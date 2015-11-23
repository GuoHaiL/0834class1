//
//  TableAndCoViewController.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/21.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "TableAndCoViewController.h"
#import "Choiceness1Manager.h"
#import "SortCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "TableCollectionReusableView.h"
#define kWihte [UIScreen mainScreen].bounds.size.width
@interface TableAndCoViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table4View;
@property (strong, nonatomic) IBOutlet UICollectionView *collection4View;
@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic, retain) NSMutableArray *data1Array;

@end
static NSString *inde = @"cell";
static NSString *inde1 = @"cell10";
static NSString *headerIdentifier = @"hesderReuse";
@implementation TableAndCoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_15 block:^(id block) {
        NSDictionary *dic = block[@"data"];
        NSArray *array = dic[@"categories"];
        for (NSDictionary *dic1 in array) {
            [self.dataArray addObject:dic1[@"name"]];
            [self.data1Array addObject:dic1[@"subcategories"]];
            NSLog(@"dataArray = %lu",_dataArray.count);
            NSLog(@"dataArray1 = %lu",_data1Array.count);
        }
        
        [self.table4View reloadData];
        [self.collection4View reloadData];
        
        
}];
    self.table4View.delegate = self;
    self.table4View.dataSource = self;
    [self.table4View registerClass:[UITableViewCell class] forCellReuseIdentifier:inde];
    self.collection4View.backgroundColor = [UIColor whiteColor];
    self.collection4View.delegate = self;
    self.collection4View.dataSource = self;
    [self.collection4View registerNib:[UINib nibWithNibName:@"SortCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:inde1];
//    [self.collection4View registerClass:[TableCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];

    
    [self.view addSubview:self.collection4View];
    
    // Do any additional setup after loading the view from its nib.
}
- (NSMutableArray *)data1Array{
    if (!_data1Array) {
        _data1Array = [NSMutableArray arrayWithCapacity:5];
    }
    return _data1Array;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _dataArray;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inde forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return _dataArray.count;
}
//设置每组item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *array = _data1Array[section];
        return array.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //    从重用池里面去带有cellIdentifier标志的cell;
    SortCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:inde1 forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSArray *array = _data1Array[indexPath.section];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:array[indexPath.row][@"icon_url"]]];
    cell.titleLab.text = [NSString stringWithString:array[indexPath.row][@"name"]];
    NSLog(@"title = %@",cell.titleLab.text);
    
    return cell;
}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    if (kind == UICollectionElementKindSectionHeader) {
//       TableCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
//        header.titlt4Lab.text = _dataArray[indexPath.row];
//        return header;
//    }
//    return nil;
//}
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
