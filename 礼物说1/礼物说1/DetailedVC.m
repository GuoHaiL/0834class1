//
//  DetailedVC.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "DetailedVC.h"
#import "ListViewController.h"
#import "UIImageView+WebCache.h"
@interface DetailedVC ()<UIWebViewDelegate>
@property (nonatomic ,retain)UIWebView *wedView;
@end

@implementation DetailedVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"详情攻略";
//    self.navigationController.navigationBar.translucent = NO;
//    self.lab4Title.text = self.string;
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.strImg]];
//    self.web4View.delegate = self;
    NSURL *url = [NSURL URLWithString:self.strUrl];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [self.web4View loadRequest:request];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"礼物说" style:(UIBarButtonItemStylePlain) target:self action:@selector(goBack)];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}
//webView懒加载
-(UIWebView *)wedView{
    if (!_wedView) {
        _wedView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
    }
    return _wedView;
}
//返回界面的方法
- (void)goBack{
    if ([self.web4View canGoBack]) {
        [self.web4View goBack];
    }else{
        [self dismissViewControllerAnimated:NO completion:nil];
    }
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
