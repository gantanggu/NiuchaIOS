//
//  MyPageControl.h
//  NiuChaIos
//
//  Created by SharkCome on 15/3/30.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPageControl : UIView

@property(assign,nonatomic) NSInteger pageCount;
@property(assign,nonatomic) NSInteger height;

- (instancetype)initWithFrame:(CGRect)frame  pageCount:(NSInteger)count;

- (void)changeImage:(NSInteger)index;

@end
