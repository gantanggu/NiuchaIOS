//
//  MyCollectionCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/26.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "MyCollectionCell.h"

@implementation MyCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"MyCollectionCell" owner:self options:nil]lastObject];
        self.contentView.layer.cornerRadius = 5.f;
        self.contentView.layer.borderColor = [UIColor grayColor].CGColor;
        self.contentView.layer.borderWidth = 0.5f;
        
        self.label.textColor = UIColorFromHex(0xF87509);
    }
    return self;
}

@end
