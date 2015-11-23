//
//  Choiceness1Manager.h
//  礼物说1
//
//  Created by 郭海林 on 15/11/17.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Block)(id block);
@interface Choiceness1Manager : NSObject
@property (nonatomic, retain)NSMutableArray *dataArray;
@property (nonatomic, copy)Block block;
+(Choiceness1Manager *)sharedChoi1Manager;
-(void)sharedData:(NSString *)url block:(Block)block;


@end
