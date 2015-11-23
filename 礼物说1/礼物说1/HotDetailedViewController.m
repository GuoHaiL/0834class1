//
//  HotDetailedViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/20.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "HotDetailedViewController.h"

@interface HotDetailedViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HotDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情介绍";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    NSURL *url = [NSURL URLWithString:self.strWeb];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
