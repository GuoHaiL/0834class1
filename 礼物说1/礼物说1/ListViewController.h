//
//  ListViewController.h
//  礼物说
//
//  Created by 郭海林 on 15/11/16.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ListViewDelegate <NSObject>

- (void)listViewDelegateImgView:(UIImage *)img lebtitle:(NSString *)title;

@end

typedef void(^Bolck)(UIImage * img,NSString * title);
@interface ListViewController : UITableViewController
@property (nonatomic, assign)id<ListViewDelegate>delegate;
@property (nonatomic, copy)Bolck block;

@property (nonatomic ,retain)UINavigationController *navigationController;

@end
