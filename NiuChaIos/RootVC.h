//
//  RootVC.h
//  NiuChaIos
//
//  Created by SharkCome on 15/3/26.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavLeftButton : UIButton 

@end

@interface UIImage (OriginalImage)

+ (UIImage *)originalImage:(NSString *)name;

@end

@interface RootVC : UIViewController

- (UIView *)loadNib:(NSString *)nibName owner:(NSObject *)owner;

-(UIImage *)origionalImage:(NSString *)imageName;

- (UIViewController *)getViewControllerFromStoryboard:(NSString *)identify;

- (void)setNavLeftBtnTitle:(NSString *)title image:(NSString *)imageName andSelector:(SEL)selectorName;

-(void) setNavRightBtnTitle:(NSString *)title image:(NSString *)imageName andSelector:(SEL)selectorName;

@end
