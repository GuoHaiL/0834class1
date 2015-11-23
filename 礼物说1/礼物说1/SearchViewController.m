//
//  SearchViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/22.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "SearchViewController.h"
@interface SearchViewController ()<UISearchBarDelegate>
@property(nonatomic, retain)UISearchBar *search;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
   self.search = [[UISearchBar alloc]initWithFrame:CGRectMake(90, 0, self.view.frame.size.width-150, 44)];
    _search.placeholder = @"搜索礼物.攻略";
    _search.delegate = self;
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(searcher)];
    [self.navigationController.navigationBar addSubview:self.search];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)searcher{
    [self loadStringUrl:self.search.text];
    
}
- (void)loadStringUrl:(NSString *)url{
    NSString *urlStr = url;
    if (![url hasPrefix:@"http://"]) {
    urlStr = [NSString stringWithFormat:@"http://m.baidu.com/s?word=%@",url];
    }
    NSURL *url1 = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url1];
    [self.webView loadRequest:request];
    [self.webView reloadInputViews];
    NSLog(@"%@",self.webView);
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
