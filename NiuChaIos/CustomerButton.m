//
//  CustomerButton.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/9.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "CustomerButton.h"

@implementation CustomerButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 42, Screen_Width/4.0 + 1, 2);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, (Screen_Width)/4, 40);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
