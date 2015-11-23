//
//  SortCollectionViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/18.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "SortCollectionViewController.h"
#import "SortCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "CollectionReusableView.h"
#import "SortDetailedTableViewController.h"
#import "TableAndCoViewController.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface SortCollectionViewController ()
@property (nonatomic, retain)NSMutableArray *scArray;
@property (nonatomic, retain)NSMutableArray *rowArray;
@end

@implementation SortCollectionViewController
static NSString * const identifier = @"Cell1";
static NSString * const reuseIdentifier = @"Cell";
- (NSMutableArray *)scArray{
    if (!_scArray) {
        _scArray = [NSMutableArray arrayWithCapacity:5];
        
    }
    return _scArray;
}
- (NSMutableArray *)rowArray{
    if (!_rowArray) {
        _rowArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _rowArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [[Choiceness1Manager sharedChoi1Manager] sharedData:kURL_11 block:^(id block) {
        NSDictionary *dic = block[@"data"];
        NSArray *array = dic[@"channel_groups"];
        for (NSDictionary *dic in array) {
            [self.scArray addObject:dic[@"name"]];
            NSArray *array1 = dic[@"channels"];
            [self.rowArray addObject:array1];
            [self.collectionView reloadData];
            
        }
        
    }];
    
        // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SortCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"cell3"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"cell4"];
          // Do any additional setup after loading the view.
}
- (IBAction)click:(UIBarButtonItem *)sender {
    TableAndCoViewController *taVC = [[TableAndCoViewController alloc]init];
    [self.navigationController pushViewController:taVC animated:YES];

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
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        //    从重用池里面取出来
        CollectionReusableView *headerReusable = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"cell3" forIndexPath:indexPath];
        headerReusable.titleLab.text = self.scArray[indexPath.section];
        return headerReusable;
    }else{
        UICollectionReusableView *foReusable = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"cell4" forIndexPath:indexPath];
        foReusable.backgroundColor = [UIColor colorWithRed:231/256.0 green:231/256.0 blue:231/256.0 alpha:1];
        return foReusable;
    }
  
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _scArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    NSArray *array = _rowArray[section];
   
    return array.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(20, 15);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SortCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor whiteColor];
     NSArray *array = _rowArray[indexPath.section];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:array[indexPath.row][@"icon_url"]]];
    cell.titleLab.text = array[indexPath.row][@"name"];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kWidth/4-10, kWidth/4 + 30);
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(20, 15);
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(20, 40);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SortDetailedTableViewController *stVC = [SortDetailedTableViewController new];
     NSArray *array = _rowArray[indexPath.section];
    stVC.strID = array[indexPath.row][@"id"];
    stVC.title4Lab = array[indexPath.row][@"name"];
    [self.navigationController pushViewController:stVC animated:YES];
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
