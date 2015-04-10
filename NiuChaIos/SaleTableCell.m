//
//  SaleTableCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/30.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "SaleTableCell.h"

@implementation SaleTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self = [[[NSBundle mainBundle]loadNibNamed:@"SaleTableCell" owner:self options:nil] lastObject];
        _arrowImage.image = [UIImage imageNamed:@"more"];
        
        _comName.textColor = UIColorFromHex(0xfaad8d);
        
        _backView.layer.cornerRadius = 8.f;
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.borderWidth = 0.5f;
        _backView.layer.borderColor = UIColorFromHex(0xcecece).CGColor;
        
        self.backgroundColor = UIColorFromHex(0xf2f2f2);
        
        [_addBtn setBackgroundImage:[UIImage imageNamed:@"bg_tianjia"] forState:UIControlStateNormal];
        [_addBtn setImage:[[UIImage imageNamed:@"icon_tianjia_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_addBtn setImage:[[UIImage imageNamed:@"icon_tianjia_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
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
