//
//  ListViewController.m
//  礼物说
//
//  Created by 郭海林 on 15/11/16.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "ListViewController.h"
#import "Choiceness1Manager.h"
#import "Head.h"
#import "UIImageView+WebCache.h"
#import "ChoicenesTableViewCell.h"
#import "MJRefresh.h"
#import "DetailedVC.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface ListViewController ()
@property (nonatomic, retain)NSMutableArray *barArray;
@property (nonatomic, retain)NSMutableArray *mainArray;
@property (nonatomic, strong)NSMutableArray *liWuArray;
@property (nonatomic, retain)NSMutableArray *haiTaoArray;
@property (nonatomic, retain)NSMutableArray *meiShiArray;
@property (nonatomic, retain)NSMutableArray *shuMaArray;
@property (nonatomic, retain)NSMutableArray *yunDongArray;
@property (nonatomic, retain)NSMutableArray *zhangArray;
@property (nonatomic, retain)NSMutableString *mainStr;
@property (nonatomic, retain)NSMutableString *liWuStr;
@property (nonatomic, retain)NSMutableString *haiTaoStr;
@property (nonatomic, retain)NSMutableString *meiShiStr;
@property (nonatomic, retain)NSMutableString *shuMaStr;
@property (nonatomic, retain)NSMutableString *yunDongStr;
@property (nonatomic, retain)NSMutableString *zhangStr;


@end
static NSString *iden = @"cell2";
static NSString *iden1 = @"cell1";
@implementation ListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ChoicenesTableViewCell" bundle:nil] forCellReuseIdentifier:iden1];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
  
    if ([self.title isEqualToString:@"精选"]) {
        Head *headView = [[Head alloc]initWithFrame:CGRectMake(0, 0, kWidth, 200)];
        self.tableView.tableHeaderView = headView;
        
    }
   
    
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_1 block:^(id block) {
       NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.barArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_mainArray.count + 20];
        self.mainStr= (NSMutableString *)[kURL_1 stringByAppendingString:str];

        [self.tableView reloadData];
        
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_2 block:^(id block) {
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        self.mainArray = dic[@"banners"];
        [self.tableView reloadData];
        
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_4 block:^(id block) {
        NSDictionary *dic =[block objectForKey:@"data"];
        [self.liWuArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_liWuArray.count];
        self.liWuStr= (NSMutableString *)[kURL_4 stringByAppendingString:str];


        [self.tableView reloadData];
        
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_8 block:^(id block) {
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
         [self.haiTaoArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_haiTaoArray.count];
        self.haiTaoStr= (NSMutableString *)[kURL_8 stringByAppendingString:str];

        [self.tableView reloadData];
        
     
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_5 block:^(id block) {
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
         [self.meiShiArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_meiShiArray.count];
        self.meiShiStr= (NSMutableString *)[kURL_5 stringByAppendingString:str];


        [self.tableView reloadData];
        
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_6 block:^(id block) {
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.shuMaArray addObjectsFromArray:dic[@"items"]];         NSString *str = [NSString stringWithFormat:@"%ld",_shuMaArray.count];
        self.shuMaStr= (NSMutableString *)[kURL_6 stringByAppendingString:str];

        [self.tableView reloadData];
        
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_7 block:^(id block) {
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.yunDongArray addObjectsFromArray:dic[@"items"]];         NSString *str = [NSString stringWithFormat:@"%ld",_yunDongArray.count];
        self.yunDongStr= (NSMutableString *)[kURL_7 stringByAppendingString:str];

        [self.tableView reloadData];
        
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_9 block:^(id block) {
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.zhangArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_zhangArray.count];
        self.zhangStr = (NSMutableString *)[kURL_9 stringByAppendingString:str];

        [self.tableView reloadData];
        
        
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter  footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
}
//加载跟多数据
- (void)loadMoreData{
    [self.tableView.mj_footer beginRefreshing];
    if ([self.title isEqualToString:@"礼物"]&&![_liWuStr isEqualToString:@""]) {
        __block typeof (self)temp = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:self.liWuStr block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
            NSMutableArray *array = dic[@"items"];
            NSString *str = [NSString stringWithFormat:@"%ld",_liWuArray.count];
            self.liWuStr= (NSMutableString *)[kURL_4 stringByAppendingString:str];

            for (NSMutableDictionary *dic1 in array) {
                [temp.liWuArray addObject:dic1];
            }
            [self.tableView reloadData];
           [self.tableView.mj_footer endRefreshing];

            
    }];
    }
    if ([self.title isEqualToString:@"精选"]&&![_mainStr isEqualToString:@""] ) {
        __block typeof (self)temp = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:self.mainStr block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
            NSMutableArray *array = dic[@"items"];
            NSString *str = [NSString stringWithFormat:@"%ld",_barArray.count + 20];
            self.mainStr= (NSMutableString *)[kURL_1 stringByAppendingString:str];
            NSLog(@"mainStr = %@",_mainStr);
            for (NSMutableDictionary *dic1 in array) {
                [temp.barArray addObject:dic1];
            }
            NSLog(@"%lu",_barArray.count);
            [self.tableView reloadData];
          [self.tableView.mj_footer endRefreshing];
            
            
        }];
    }
    if ([self.title isEqualToString:@"海淘"]&&![_haiTaoStr isEqualToString:@""]) {
        __block typeof (self)temp = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:self.haiTaoStr block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
            NSMutableArray *array = dic[@"items"];
            NSString *str = [NSString stringWithFormat:@"%ld",_haiTaoArray.count];
            self.haiTaoStr= (NSMutableString *)[kURL_8 stringByAppendingString:str];

            for (NSMutableDictionary *dic1 in array) {
                [temp.haiTaoArray addObject:dic1];
            }
            [self.tableView reloadData];
           [self.tableView.mj_footer endRefreshing];
            
            
        }];
    }
    if ([self.title isEqualToString:@"美食"] &&![_meiShiStr  isEqualToString:@""]) {
        __block typeof (self)temp = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:self.meiShiStr block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
            NSMutableArray *array = dic[@"items"];
            NSString *str = [NSString stringWithFormat:@"%ld",_meiShiArray.count];
            self.meiShiStr= (NSMutableString *)[kURL_5 stringByAppendingString:str];

            for (NSMutableDictionary *dic1 in array) {
                [temp.meiShiArray addObject:dic1];
            }
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
            
            
        }];
    }
    if ([self.title isEqualToString:@"数码"]&&![_shuMaStr  isEqualToString:@""]) {
        __block typeof (self)temp = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:self.shuMaStr block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
            NSMutableArray *array = dic[@"items"];
            NSString *str = [NSString stringWithFormat:@"%ld",_shuMaArray.count];
            self.shuMaStr= (NSMutableString *)[kURL_6 stringByAppendingString:str];

            for (NSMutableDictionary *dic1 in array) {
                [temp.shuMaArray addObject:dic1];
            }
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
            
            
        }];
    }
    if ([self.title isEqualToString:@"运动"] && ![_yunDongStr isEqualToString:@""]) {
        __block typeof (self)temp = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:self.yunDongStr block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
            NSMutableArray *array = dic[@"items"];
            NSString *str = [NSString stringWithFormat:@"%ld",_yunDongArray.count];
            self.yunDongStr= (NSMutableString *)[kURL_7 stringByAppendingString:str];
            for (NSMutableDictionary *dic1 in array) {
                [temp.yunDongArray addObject:dic1];
            }
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
            
            
        }];
    }
    if ([self.title isEqualToString:@"涨姿势"]) {
        
        __block typeof (self)temp = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:self.zhangStr block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
            NSMutableArray *array = dic[@"items"];
            NSString *str = [NSString stringWithFormat:@"%ld",_zhangArray.count];
         self.zhangStr = (NSMutableString *)[kURL_9 stringByAppendingString:str];
            NSLog(@"%@",self.zhangStr);
                       for (NSMutableDictionary *dic1 in array) {
                [temp.zhangArray addObject:dic1];
            }
            [self.tableView reloadData];
          [self.tableView.mj_footer endRefreshing];
            
            
        }];
        
    }
//    [self.tableView.mj_footer endRefreshing];

}
//刷新数据
- (void)loadNewData{
    
      [self.tableView.mj_header beginRefreshing];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_1 block:^(id block) {
        [_barArray removeAllObjects];
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.barArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_mainArray.count + 20];
        self.mainStr= (NSMutableString *)[kURL_1 stringByAppendingString:str];

        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_2 block:^(id block) {
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        self.mainArray = dic[@"banners"];
        [self.tableView reloadData];
        
        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_4 block:^(id block) {
        [_liWuArray removeAllObjects];
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.liWuArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_liWuArray.count];
        self.liWuStr= (NSMutableString *)[kURL_4 stringByAppendingString:str];

        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];

        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_8 block:^(id block) {
        [_haiTaoArray removeAllObjects];
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.haiTaoArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_haiTaoArray.count];
        self.haiTaoStr= (NSMutableString *)[kURL_8 stringByAppendingString:str];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];

        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_5 block:^(id block) {
        [_meiShiArray removeAllObjects];
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.meiShiArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_meiShiArray.count];
        self.meiShiStr= (NSMutableString *)[kURL_5 stringByAppendingString:str];

        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];

        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_6 block:^(id block) {
        [_shuMaArray removeAllObjects];
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.shuMaArray addObjectsFromArray:dic[@"items"]];         NSString *str = [NSString stringWithFormat:@"%ld",_shuMaArray.count];
        self.shuMaStr= (NSMutableString *)[kURL_6 stringByAppendingString:str];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];

        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_7 block:^(id block) {
        [_yunDongArray removeAllObjects];
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.yunDongArray addObjectsFromArray:dic[@"items"]];         NSString *str = [NSString stringWithFormat:@"%ld",_yunDongArray.count];
        self.yunDongStr= (NSMutableString *)[kURL_7 stringByAppendingString:str];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];

        
    }];
    [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_9 block:^(id block) {
        [_zhangArray removeAllObjects];
        NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
        [self.zhangArray addObjectsFromArray:dic[@"items"]];
        NSString *str = [NSString stringWithFormat:@"%ld",_zhangArray.count];
        self.zhangStr = (NSMutableString *)[kURL_9 stringByAppendingString:str];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];

        
    }];
   
}
#pragma mark 懒加载
- (NSMutableArray *)barArray{
    if (!_barArray) {
        _barArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _barArray;

}
- (NSMutableArray *)mainArray{
    if (!_mainArray) {
        _mainArray = [NSMutableArray arrayWithCapacity:5];
        
    }
    return _mainArray;
}
- (NSMutableArray *)liWuArray{
    if (!_liWuArray) {
        _liWuArray = [NSMutableArray arrayWithCapacity:5];
        
    }
    return _liWuArray;
 }
- (NSMutableArray *)haiTaoArray{
    if(!_haiTaoArray){
        _haiTaoArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _haiTaoArray;
}
- (NSMutableArray *)meiShiArray{
    if (!_meiShiArray) {
        _meiShiArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _meiShiArray;
}
-(NSMutableArray *)shuMaArray{
    if (!_shuMaArray) {
        _shuMaArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _shuMaArray;
}
- (NSMutableArray *)yunDongArray{
    if (!_yunDongArray) {
        _yunDongArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _yunDongArray;
}
- (NSMutableArray *)zhangArray{
    if (!_zhangArray) {
        _zhangArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _zhangArray;
}
- (NSMutableString *)liWuStr{
    if (!_liWuStr) {
        _liWuStr = [NSMutableString new];
    }
    return _liWuStr;
}
- (NSMutableString *)zhangStr{
    if (!_zhangStr) {
        _zhangStr = [NSMutableString new];
    }
    return _zhangStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.title isEqualToString:@"精选"]) {
                // Configure the cell...
        
        //    cell.textLabel.textColor = [UIColor whiteColor];
        return _barArray.count;
    }
    if ([self.title isEqualToString:@"礼物"]){
        
        
        return _liWuArray.count ;
    }
    if ([self.title isEqualToString:@"海淘"]){
        
        
        return _haiTaoArray.count;
    }
    if ([self.title isEqualToString:@"美食"]){
       
        
        return _meiShiArray.count;
    }
    if ([self.title isEqualToString:@"数码"]){
        
        return _shuMaArray.count;
    }
    if ([self.title isEqualToString:@"运动"]){
                return _yunDongArray.count;
    }
    if ([self.title isEqualToString:@"涨姿势"]){
        
        return _zhangArray.count;
    }
    
        return 0;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if ([self.title isEqualToString:@"精选"]) {
        ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
        cell.title.text = _barArray[indexPath.row][@"title"];
        cell.title.textColor = [UIColor whiteColor];
        cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _barArray[indexPath.row][@"likes_count"]];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_barArray[indexPath.row][@"cover_image_url"]]];
        
        // Configure the cell...
        
        //    cell.textLabel.textColor = [UIColor whiteColor];
        return cell;
        }
    if ([self.title isEqualToString:@"礼物"]){
    ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
        cell.title.text = _liWuArray[indexPath.row][@"title"];
        cell.title.textColor = [UIColor whiteColor];
        cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _liWuArray[indexPath.row][@"likes_count"]];

        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_liWuArray[indexPath.row][@"cover_image_url"]]];
        
    return cell;
    }
    if ([self.title isEqualToString:@"海淘"]){
        ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
        cell.title.text = _haiTaoArray[indexPath.row][@"title"];
        cell.title.textColor = [UIColor whiteColor];
        cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _haiTaoArray[indexPath.row][@"likes_count"]];

        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_haiTaoArray[indexPath.row][@"cover_image_url"]]];
        
        return cell;
    }
    if ([self.title isEqualToString:@"美食"]){
        ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
        cell.title.text = _meiShiArray[indexPath.row][@"title"];
        cell.title.textColor = [UIColor whiteColor];
        cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _meiShiArray[indexPath.row][@"likes_count"]];

        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_meiShiArray[indexPath.row][@"cover_image_url"]]];
        
        return cell;
    }
    if ([self.title isEqualToString:@"数码"]){
        ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
        cell.title.text = _shuMaArray[indexPath.row][@"title"];
        cell.title.textColor = [UIColor whiteColor];
        cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _shuMaArray[indexPath.row][@"likes_count"]];

        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_shuMaArray[indexPath.row][@"cover_image_url"]]];
        
        return cell;
    }
    if ([self.title isEqualToString:@"运动"]){
        ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
        cell.title.text = _yunDongArray[indexPath.row][@"title"];
        cell.title.textColor = [UIColor whiteColor];
        cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _yunDongArray[indexPath.row][@"likes_count"]];

        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_yunDongArray[indexPath.row][@"cover_image_url"]]];
        
        return cell;
    }
    if ([self.title isEqualToString:@"涨姿势"]){
        ChoicenesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden1 forIndexPath:indexPath];
        cell.title.text = _zhangArray[indexPath.row][@"title"];
        cell.title.textColor = [UIColor whiteColor];
        cell.Lab_xiai.text = [NSString stringWithFormat:@"%@", _zhangArray[indexPath.row][@"likes_count"]];

        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:_zhangArray[indexPath.row][@"cover_image_url"]]];
        
        return cell;
    }


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
    
}
//cell的点击时间
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailedVC *deVC = [DetailedVC new];
    
    deVC.string = _barArray[indexPath.row][@"title"];
    deVC.strImg = _barArray[indexPath.row][@"cover_image_url"];
    deVC.strUrl = _barArray[indexPath.row][@"content_url"];
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:deVC];
    navVC.navigationBar.translucent = NO;
    [self showDetailViewController:navVC sender:nil];
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
