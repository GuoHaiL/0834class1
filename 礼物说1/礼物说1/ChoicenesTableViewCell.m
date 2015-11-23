//
//  ChoicenesTableViewCell.m
//  礼物说
//
//  Created by 郭海林 on 15/11/17.
//  Copyright © 2015年 郭海林. All rights reserved.
//

#import "ChoicenesTableViewCell.h"

@implementation ChoicenesTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.aView.layer.masksToBounds = YES;
        self.aView.layer.borderWidth = 1;
        [self addSubview:_aView];
       
    }
    return self;
}
- (void)awakeFromNib {
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
