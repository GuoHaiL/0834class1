//
//  SortDetaViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/20.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "SortDetaViewController.h"
#import "UIImageView+WebCache.h"
#define kWithe
@interface SortDetaViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *my4Scroll;
@property (strong, nonatomic) IBOutlet UIImageView *my4Img;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UILabel *title4Lab;

@end

@implementation SortDetaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情攻略";
    self.title4Lab.text = self.title4str;
    NSLog(@"%@",self.title4Lab.text);
    [self.my4Img sd_setImageWithURL:[NSURL URLWithString:self.img4str]];
    NSURL *url = [NSURL URLWithString:self.web4str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.my4Scroll.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,2000);
//    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    NSLog(@"%f",self.webView.frame.size.height );
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
