//
//  UserData.h
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UserData : NSObject
@property (nonatomic, retain)FMDatabaseQueue *queue;
@property (nonatomic, retain)NSMutableString *str;
@property (nonatomic, retain)UIImage *img;
+(UserData *)sharedData;
- (void)open;
- (void)addName:(NSString *)name pass:(NSString *)pass;
- (NSString *)searchName:(NSString *)name;
- (void)deleteData;
- (void)addimgView:(UIImage *)imgView userName:(NSString *)name;
- (UIImage *)searchuserImg:(NSString *)name;
@end
