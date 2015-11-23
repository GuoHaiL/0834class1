//
//  UserViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/19.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "UserViewController.h"
#import "UserData.h"

@interface UserViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *user4Img;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *user4imgn;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
       self.user4Img.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loginHandle)];
    [self.user4Img addGestureRecognizer:tap];
//    [[UserData sharedData]open];
//    self.user4Img.image = [[UserData sharedData]searchuserImg:@"123"];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
  
 
    
    
}
- (void)loginHandle{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.user4Img.image = info[UIImagePickerControllerEditedImage];
    [[UserData sharedData]addimgView:self.user4Img.image userName:@"123"];
    
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
