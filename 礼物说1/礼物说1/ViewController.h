//
//  ViewController.h
//  礼物说
//
//  Created by 郭海林 on 15/11/16.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewController.h"
#import "SUNSlideSwitchView.h"
@interface ViewController : UIViewController
@property (nonatomic, retain)SUNSlideSwitchView *slideSwitchView;

@property (nonatomic, strong) ListViewController *vc1;
@property (nonatomic, strong) ListViewController *vc2;
@property (nonatomic, strong) ListViewController *vc3;
@property (nonatomic, strong) ListViewController *vc4;
@property (nonatomic, strong) ListViewController *vc5;
@property (nonatomic, strong) ListViewController *vc6;
@property (nonatomic, strong) ListViewController *vc7;
@property (nonatomic, retain)UINavigationController *navSlideSwitchVC;


@end

