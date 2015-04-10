//
//  RichengListCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/7.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "RichengListCell.h"

@implementation RichengListCell

- (void)awakeFromNib {
    // Initialization code
    _backView.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = UIColor_System_Silver;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
