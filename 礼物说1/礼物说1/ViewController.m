//
//  ViewController.m
//  礼物说
//
//  Created by 郭海林 on 15/11/16.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "ViewController.h"
#import "Choiceness1Manager.h"
#import "MJRefresh.h"
#import "UserData.h"
@interface ViewController ()<SUNSlideSwitchViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *barScroll;
@property (nonatomic, retain)UIView *barView;
@property (nonatomic, retain)NSMutableArray *barArray;
@property (nonatomic, retain)NSMutableDictionary *datadic;

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidLoad {
       [super viewDidLoad];
    [[UserData sharedData]open];
////    [[UserData sharedData] addName:@"nsa" pass:@"123"];
//    NSString *str = [[UserData sharedData] searchName:@"na"];
  
    self.slideSwitchView = [[SUNSlideSwitchView alloc] initWithFrame:self.view.frame];
    
    _slideSwitchView.slideSwitchViewDelegate = self;
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_1 block:^(id block) {
        self.barArray=[(NSMutableDictionary *)block objectForKey:@"data"];
       
        
        
    }];
    [self.view addSubview:self.slideSwitchView];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    self.slideSwitchView.tabItemNormalColor = [SUNSlideSwitchView colorFromHexRGB:@"868686"];
    self.slideSwitchView.tabItemSelectedColor = [SUNSlideSwitchView colorFromHexRGB:@"bb0b15"];
    self.slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]
                                                                                stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];

   self.slideSwitchView.backgroundColor = [UIColor whiteColor];
    self.vc1 = [[ListViewController alloc] init];
    self.vc1.title = @"精选";

    self.vc2 = [[ListViewController alloc] init];
    self.vc2.title = @"礼物";
    
    self.vc3 = [[ListViewController alloc] init];
    self.vc3.title = @"海淘";
    
    self.vc4 = [[ListViewController alloc] init];
    self.vc4.title = @"美食";
    
    self.vc5 = [[ListViewController alloc] init];
    self.vc5.title = @"数码";
    
    self.vc6 = [[ListViewController alloc] init];
    self.vc6.title = @"运动";
    self.vc7 = [[ListViewController alloc] init];
    self.vc7.title = @"涨姿势";
    UIButton *rightSideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightSideButton setImage:[UIImage imageNamed:@"xia"] forState:UIControlStateNormal];
    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"]  forState:UIControlStateHighlighted];
    rightSideButton.frame = CGRectMake(0, 0, 40.0f, 44.0f);
    rightSideButton.userInteractionEnabled = NO;
    self.slideSwitchView.rigthSideButton = rightSideButton;
    
    [self.slideSwitchView buildUI];
        // Do any additional setup after loading the view, typically from a nib.
}
- (NSMutableArray *)barArray{
    if (!_barArray) {
        _barArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _barArray;
}
-(NSMutableDictionary *)datadic{
    if (!_datadic) {
        _datadic = [NSMutableDictionary dictionaryWithCapacity:5];
    }
    return _datadic;
}
- (NSUInteger)numberOfTab:(SUNSlideSwitchView *)view
{
    return 7;
}

- (UIViewController *)slideSwitchView:(SUNSlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    if (number == 0) {
        return self.vc1;
    } else if (number == 1) {
        return self.vc2;
    } else if (number == 2) {
        return self.vc3;
    } else if (number == 3) {
        return self.vc4;
    } else if (number == 4) {
        return self.vc5;
    } else if (number == 5) {
        return self.vc6;
    }else if (number == 6) {
        return self.vc7;
    } else {
        return nil;
    }
}
//- (void)slideSwitchView:(SUNSlideSwitchView *)view panLeftEdge:(UIPanGestureRecognizer *)panParam
//{
//    ViewController *drawerController = (ViewController *)self.navigationController.mm_drawerController;
//    [drawerController panGestureCallback:panParam];
//}

- (void)slideSwitchView:(SUNSlideSwitchView *)view didselectTab:(NSUInteger)number
{
    ListViewController *vc = nil;
    if (number == 0) {
        vc = self.vc1;
        vc.navigationController = self.navigationController;
    } else if (number == 1) {
        vc = self.vc2;
    } else if (number == 2) {
        vc = self.vc3;
    } else if (number == 3) {
        vc = self.vc4;
    } else if (number == 4) {
        vc = self.vc5;
    } else if (number == 5) {
        vc = self.vc6;
    }else if (number == 6) {
        vc = self.vc7;
    }

    
}


- (void)addMJ{
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
