//
//  UserData.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "UserData.h"
static UserData *userData = nil;
@implementation UserData
+(UserData *)sharedData{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userData = [UserData new];
      
    });
    return userData;
}

- (void)open{
    // 1.数据库路径
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [document stringByAppendingString:@"/user.sqlite"];
    NSLog(@"%@",path);
    // 2.创建数据库
    self.queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    // 3.打开数据库
    [self.queue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:@"create table userInf (username text primary key, password text,imgView blob);"];
        if (result) {
            NSLog(@"创表成功");
        } else {
            NSLog(@"创表失败");
        }
    }];

}
- (void)addName:(NSString *)name pass:(NSString *)pass{
    [self open];
    [self.queue inDatabase:^(FMDatabase *db) {
      BOOL result = [db executeUpdate:@"insert into userInf (username, password, imgView) values (?, ?, ?);",name, pass,nil];
        if (result) {
            NSLog(@"添加成功");
        }else{
            NSLog(@"添加失败");
        }
    }];
}

- (NSString *)searchName:(NSString *)name{
    [self open];
    [self.queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rb = [db executeQuery:@"select * from userInf where username = ?;",name];
        while (rb.next) {
            NSString *pass = [rb stringForColumn:@"passWord"];
            if (pass.length != 0) {
                self.str = [NSMutableString stringWithString:pass];
                NSLog(@"str1 = %@",_str);
            }else{
                self.str = nil;
            }
        }
    }];
    return _str;
}

- (void)deleteData{
    [self open];
    [self.queue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeQuery:@"drop table userInf;"];
        if (result) {
            NSLog(@"删除成功");
        }else{
            NSLog(@"删除失败");
        }
    }];
}
- (void)addimgView:(UIImage *)imgView userName:(NSString *)name{
    [self open];
    [self.queue inDatabase:^(FMDatabase *db) {
        
      BOOL reult = [db executeUpdate:@"update userInf set imgView = ? where username = ?;",imgView,name];
        if (reult) {
            NSLog(@"修改头像成功");
        }else{
            NSLog(@"修改头像失败");
        }
           }];
    
}
- (UIImage *)searchuserImg:(NSString *)name{
    [self open];
    [self.queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rb = [db executeQuery:@"select * from userInf where username = ?;",name];
        while (rb.next) {
            NSData *data = [rb dataForColumn:@"imgView"];
            NSLog(@"%@",data);
        if ( data!= nil) {
        self.img = [UIImage imageWithData:data];
            NSLog(@"%@",self.img);
        }else{
                self.img = nil;
            }
        }
    }];
    return self.img;
}
- (UIImage *)img{
    if (!_img) {
        _img = [[UIImage alloc]init];
    }
    return _img;
}
@end
