//
//  RegisteredViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "RegisteredViewController.h"
#import "UserData.h"
#import "UserViewController.h"
@interface RegisteredViewController ()<UITextFieldDelegate>

@end

@implementation RegisteredViewController
- (IBAction)register4Btn:(id)sender {
   
    if (self.user4Lab.text != nil && ![self.user4Lab.text isEqualToString:@""] && self.pass4Lab.text != nil && ![self.pass4Lab.text isEqualToString:@""] && [self.pass4Lab.text isEqualToString:self.spass4Lab.text]) {
        [[UserData sharedData] addName:self.user4Lab.text pass:self.pass4Lab.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"密码和用户名有误" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
        self.user4Lab.text = @"";
        self.pass4Lab.text = @"";
        self.spass4Lab.text = @"";
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pass4Lab.secureTextEntry = YES;
    self.spass4Lab.secureTextEntry = YES;
    self.user4Lab.delegate = self;
    self.spass4Lab.delegate = self;
    self.pass4Lab.delegate = self;
    
    // Do any additional setup after loading the view.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    UITextField *fie = (UITextField *)[self.view viewWithTag:1001];
    UITextField *fie1 = (UITextField *)[self.view viewWithTag:1002];
    if (textField.tag == 1000) {
        [fie becomeFirstResponder];
        return YES;
    }else if(textField.tag == 1001){
        [fie1 becomeFirstResponder];
        return YES;
    }
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)cancel4Btn:(UIButton *)sender {
    self.user4Lab.text = @"";
    self.pass4Lab.text = @"";
    self.spass4Lab.text = @"";
    [self dismissViewControllerAnimated:YES completion:nil];
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
