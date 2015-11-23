//
//  User.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "User.h"
#define kName @"name"
#define kPass @"pass"
@implementation User
//编码
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.pass forKey:kPass];
}

//反编码
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:kName];
        self.pass = [aDecoder decodeObjectForKey:kPass];
    }
    return self;
}
@end
