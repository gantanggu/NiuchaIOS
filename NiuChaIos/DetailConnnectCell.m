//
//  DetailConnnectCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/8.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "DetailConnnectCell.h"

@implementation DetailConnnectCell

- (void)awakeFromNib {
    // Initialization code
    SKLog(@"%@",NSStringFromSelector(_cmd));
    
    _backView.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = UIColor_System_Silver;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
