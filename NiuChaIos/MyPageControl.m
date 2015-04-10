//
//  MyPageControl.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/30.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "MyPageControl.h"

@interface UIImage (ScaleImage)

- (UIImage *)TelescopicImageToSize:(CGSize) size;

@end

@implementation UIImage (ScaleImage)

- (UIImage *)TelescopicImageToSize:(CGSize) size{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

@implementation MyPageControl

- (instancetype)initWithFrame:(CGRect)frame pageCount:(NSInteger)count{
    MyPageControl *control = [[MyPageControl alloc]initWithFrame:frame];
    control.height = frame.size.height;
    control.pageCount = count;
    SKLog(@"%ld  %ld",_pageCount,_height);
    for (int i = 0; i < count; i++) {
        UIImageView *temView = [[UIImageView alloc]initWithFrame:CGRectMake(i*frame.size.width / count, 0, frame.size.width / count, control.height)];
        UIImage *image = [UIImage imageNamed:@"jieduan_1"];
        temView.image = [image TelescopicImageToSize:CGSizeMake(frame.size.width / count - 30, control.height)];
        temView.tag = 110 + i;
        [control addSubview:temView];
    }
    return control;
}

- (void)changeImage:(NSInteger)index{
    
    SKLog(@"_height = %ld",self.height);
    for (int i = 0; i <= index; i++) {
        UIImageView *temImageView = (UIImageView *)[self viewWithTag:(110 + i)];
        UIImage *image = [UIImage imageNamed:@"jieduan_2"];
        temImageView.image = [image TelescopicImageToSize:CGSizeMake(Screen_Width / 4, 8)];
    }
    
    for (NSInteger i = index + 1; i < self.subviews.count; i++) {
        UIImageView *temImageView = (UIImageView *)[self viewWithTag:(110 + i)];
        UIImage *image = [UIImage imageNamed:@"jieduan_1"];
        temImageView.image = [image TelescopicImageToSize:CGSizeMake(Screen_Width / 4, 8)];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
