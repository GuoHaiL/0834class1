//
//  Head.h
//  礼物说1
//
//  Created by 郭海林 on 15/11/17.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Head : UIView<UIScrollViewDelegate>
@property (nonatomic, retain)UIScrollView *scroll1;
@property (nonatomic, retain)UIPageControl *page;
@property (nonatomic, retain)UIImageView *imgView;
@property (nonatomic, retain)NSTimer *timer;
@property (nonatomic, retain)NSMutableArray *imgArray;
@end
