//
//  DetailedVC.h
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UIWebView *web4View;//web视图
@property (strong, nonatomic) IBOutlet UILabel *lab4Title;
@property (nonatomic ,retain) NSString *string;
@property (nonatomic, retain) NSString *strImg; //webView视图的url
@property (nonatomic, retain) NSString *strUrl;
@end
