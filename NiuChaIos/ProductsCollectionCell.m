//
//  ProductsCollectionCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/1.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "ProductsCollectionCell.h"

@implementation ProductButton


@end

@implementation ProductsCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"ProductCollectionCell" owner:self options:nil]lastObject];
        
        _cellName.layer.cornerRadius = 5.f;
//        _cellName.backgroundColor = [UIColor orangeColor];
        _cellName.layer.borderWidth = 0.5f;
    }
    return self;
}

@end
