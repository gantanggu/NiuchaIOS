//
//  AddChanceCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/31.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "AddChanceCell.h"

@implementation AddChanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"AddChanceCell" owner:self options:nil]lastObject];
        
//        _backView.layer.cornerRadius = 5.f;
        _backView.layer.borderColor = UIColorFromHex(0xe4e4e4).CGColor;
        _backView.layer.borderWidth = 1.f;
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
