//
//  Head.m
//  礼物说1
//
//  Created by 郭海林 on 15/11/17.
//  Copyright © 2015年 郭海林. All rights reserved.
//
#import "Choiceness1Manager.h"
#import "Head.h"
#import "UIImageView+WebCache.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@implementation Head
int a = 0;
int b = 0;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 200)];
        self.scroll1 = scroll;
        
        scroll.pagingEnabled = YES;
        scroll.delegate = self;
        [[Choiceness1Manager sharedChoi1Manager]sharedData:kURL_2 block:^(id block) {
            NSDictionary *dic =[(NSMutableDictionary *)block objectForKey:@"data"];
          
            NSArray *array = [[NSArray alloc]initWithArray:dic[@"banners"]];
//            NSLog(@"%lu",array.count);
            for (NSDictionary *dic in array) {
                NSString *str = dic[@"image_url"];
                
                [self.imgArray addObject:str];
            }
            
            
        
        scroll.contentSize = CGSizeMake(kWidth * (self.imgArray.count), 200);
        
        for (int i = 0; i < self.imgArray.count; i++) {
            
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 200)];
            [imgView sd_setImageWithURL:[NSURL URLWithString:self.imgArray[i]]];
         
            UIScrollView *scroll2 = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * i, 0, kWidth, 200)];
            [scroll2 addSubview:imgView];
            [scroll addSubview:scroll2];
            
        }
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth , 200)];
            [imgView sd_setImageWithURL:[NSURL URLWithString:self.imgArray[0]] placeholderImage:nil];
        UIScrollView *scroll3 = [[UIScrollView alloc]initWithFrame:CGRectMake(-kWidth , 0, kWidth, 200)];
        [scroll3 addSubview:imgView];
        [scroll addSubview:scroll3];
        UIImageView *imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kWidth, 200)];
         [imgView1 sd_setImageWithURL:[NSURL URLWithString:self.imgArray[0]]];
        UIScrollView *scroll4 = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * _imgArray.count , 0, kWidth, 200)];
        [scroll4 addSubview:imgView1];
        [scroll addSubview:scroll4];
        
        
        [self addSubview:_scroll1];
        self.page = [[UIPageControl alloc]initWithFrame:CGRectMake(277, 170, 100, 30)];
        _page.currentPageIndicatorTintColor = [UIColor redColor];
        _page.numberOfPages = _imgArray.count;
        _page.pageIndicatorTintColor = [UIColor grayColor];
        [_page addTarget:self action:@selector(click:) forControlEvents:(UIControlEventValueChanged)];
        [self addSubview:_page];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(timeClick:) userInfo:nil repeats:YES];
        }];
        //

    }
    return self;
}
-(NSMutableArray *)imgArray{
    if (!_imgArray) {
        _imgArray = [NSMutableArray arrayWithCapacity:5];
}
    return _imgArray;
}
-(void)click:(UIPageControl *)sender{
    CGFloat cur = sender.currentPage;
    _scroll1.contentOffset = CGPointMake(kWidth*cur, 0);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:6]];
    CGPoint cur = scrollView.contentOffset;
    _page.currentPage = cur.x/kWidth;
//    a = (int)_page.currentPage;
    }


-(void)timeClick:(NSTimer *)timer{
    if (a > _imgArray.count) {
        a = 0;
    }
//    [_timer setFireDate:[NSDate distantFuture]];
   
//    [self.scroll1 setContentOffset:CGPointMake(kWidth * a, 0) animated:YES];
    CATransition *tran = [CATransition animation];
    tran.duration = 1;
    tran.type = @"cube";
   
//    tran.repeatCount = NSIntegerMax;
    tran.subtype = kCATransitionFromRight;
    [_scroll1.layer addAnimation:tran forKey:nil];
    CGPoint cur = CGPointMake(kWidth * (a + 1) , 0);
    [_scroll1 setContentOffset:cur animated:NO];
    _page.currentPage = a + 1;
    a++;
    if (a == _imgArray.count + 1) {
        _page.currentPage = 0;
        _scroll1.contentOffset = CGPointMake(-kWidth, 0);
    }
//    [_timer setFireDate:[NSDate distantPast]];
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
