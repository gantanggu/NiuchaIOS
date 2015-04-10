//
//  AddCollectionCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/31.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "AddCollectionCell.h"

@implementation AddCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"addCollectionCell" owner:self options:nil]lastObject];
        _label.textColor = [UIColor blackColor];
    }
    return self;
}

@end
