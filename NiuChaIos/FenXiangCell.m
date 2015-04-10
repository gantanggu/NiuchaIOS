//
//  FenXiangCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/10.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "FenXiangCell.h"

@implementation FenXiangCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"FenXiangCell" owner:self options:nil]lastObject];
    }
    return self;
}

@end
