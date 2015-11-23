//
//  SortDetailedTableViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/20.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "SortDetailedTableViewController.h"
#import "Choiceness1Manager.h"
#import "ChoicenesTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "SortDetaViewController.h"
@interface SortDetailedTableViewController ()
@property (nonatomic, retain)NSMutableArray *dataArray;
@property (nonatomic, retain)NSString *dataUrl;
@end
static NSString *iden1 = @"cell1";
@implementation SortDetailedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.title4Lab;
    [self loadNewData];
       [self.tableView registerNib:[UINib nibWithNibName:@"ChoicenesTableViewCell" bundle:nil] forCellReuseIdentifier:iden1];
    
    self.tableView.mj_header = [MJRefreshNormalHeader    headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [self.tableView.mj_footer beginRefreshing];
   }
- (void)loadNewData{
    
    NSString *str = [kURL_12 stringByAppendingString:[NSString stringWithFormat:@"%@",self.strID]];
    self.dataUrl = [str stringByAppendingString:kURL_13];
    [[Choiceness1Manager sharedChoi1Manager] sharedData:self.dataUrl block:^(id block) {
        NSDictionary *dic = block[@"data"];
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:dic[@"items"]];
        NSLog(@"dataArray = %lu",_dataArray.count);
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    }];

    
}

- (void)loadMoreData{
    
    NSString *str = [self.dataUrl stringByAppendingString:[NSString stringWithFormat:@"%ld",self.dataArray.count]];
    [[Choiceness1Manager sharedChoi1Manager] sharedData:str block:^(id block) {
        NSDictionary *dic = block[@"data"];
        
        [self.dataArray addObjectsFromArray:dic[@"items"]];
        NSLog(@"dataArray = %lu",_dataArray.count);
        
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    }];

}
- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
    cell.title.text = _dataArray[indexPath.row][@"title"];
    cell.title.textColor = [UIColor whiteColor];
    cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _dataArray[indexPath.row][@"likes_count"]];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_dataArray[indexPath.row][@"cover_image_url"]]];
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SortDetaViewController *sdVC = [SortDetaViewController new];
    sdVC.title4str = _dataArray[indexPath.row][@"title"];
    sdVC.img4str = _dataArray[indexPath.row][@"cover_image_url"];
    sdVC.web4str = _dataArray[indexPath.row][@"content_url"];
    [self.navigationController pushViewController:sdVC animated:YES];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
