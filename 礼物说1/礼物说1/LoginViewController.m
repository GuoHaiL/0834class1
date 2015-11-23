//
//  LoginViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "LoginViewController.h"
#import "UserData.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)login4btn:(id)sender {
    [[UserData sharedData]open];
    NSString *str = [[UserData sharedData] searchName:self.user4Lab.text];
    NSLog(@"pass = %@",str);
    if (self.user4Lab != nil && ![self.user4Lab.text isEqualToString:@""] && [self.pass4Lab.text isEqualToString:str]) {
        [self dismissViewControllerAnimated:YES completion:nil];

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
