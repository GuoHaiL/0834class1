//
//  HotCollectionViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/17.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "HotCollectionViewController.h"
#import "Choiceness1Manager.h"
#import "HotCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "HotDetailedViewController.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface HotCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, retain)NSMutableArray *dataArray;
@end
static NSString * const identifier = @"Cell1";
@implementation HotCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"热门";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [[Choiceness1Manager sharedChoi1Manager] sharedData:kURL_10 block:^(id block) {
        NSDictionary *dic = block[@"data"];
        NSArray *array = dic[@"items"];
        for (NSDictionary *dic1 in array) {
            NSDictionary *dic2 = dic1[@"data"];
            [self.dataArray addObject:dic2];
            [self.collectionView reloadData];
        }
      
        NSLog(@"dataArray = %lu",_dataArray.count);
    }];
    self.collectionView.mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter  footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HotCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    // Do any additional setup after loading the view.
}
- (void)loadNewData{
    [self.collectionView.mj_header becomeFirstResponder];
    [[Choiceness1Manager sharedChoi1Manager] sharedData:kURL_10 block:^(id block) {
        [_dataArray removeAllObjects];
        NSDictionary *dic = block[@"data"];
        NSArray *array = dic[@"items"];
        for (NSDictionary *dic1 in array) {
            NSDictionary *dic2 = dic1[@"data"];
            [self.dataArray addObject:dic2];
            [self.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
        }
        
        NSLog(@"dataArray = %lu",_dataArray.count);
    }];

}
- (void)loadMoreData{
    [self.collectionView.mj_footer becomeFirstResponder];
    NSString *str = [NSString stringWithFormat:@"%ld",_dataArray.count];
    NSString *str1  = [kURL_10 stringByAppendingString:str];
    [[Choiceness1Manager sharedChoi1Manager] sharedData:str1 block:^(id block) {
        NSDictionary *dic = block[@"data"];
        NSArray *array = dic[@"items"];
        for (NSDictionary *dic1 in array) {
            NSDictionary *dic2 = dic1[@"data"];
            [self.dataArray addObject:dic2];
            [self.collectionView reloadData];
            [self.collectionView.mj_footer endRefreshing];
        }
        
//        NSLog(@"dataArray = %lu",_dataArray.count);
    }];

}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataArray;
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.title.text = _dataArray[indexPath.row][@"name"];
    cell.pic.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row][@"price"]];
    cell.likes.text = [NSString stringWithFormat:@"%@",_dataArray[indexPath.row][@"favorites_count"]];
    // Configure the cell
  [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_dataArray[indexPath.row][@"cover_image_url"]]];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kWidth / 2 - 15, 260);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 0, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HotDetailedViewController *hotVC = [HotDetailedViewController new];
    hotVC.strWeb = _dataArray[indexPath.row][@"purchase_url"];
    [self.navigationController pushViewController:hotVC animated:YES];
}





/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
