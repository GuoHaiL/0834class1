//
//  Choiceness1Manager.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/17.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "Choiceness1Manager.h"
#import "AFNetworking.h"
static Choiceness1Manager *manager = nil;
@implementation Choiceness1Manager
+(Choiceness1Manager *)sharedChoi1Manager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [Choiceness1Manager new];
    });
    return manager;
}

-(void)sharedData:(NSString *)url block:(Block)block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    if ([url isEqualToString:@""]&& url == nil) {
        return;
    }
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        block(responseObject);
        //        NSLog(@"%@",responseObject);
        
        
    
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        block(nil);
        
    }];
}

@end
