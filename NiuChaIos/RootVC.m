//
//  RootVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/26.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "RootVC.h"

@implementation NavLeftButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(15, 12, 100, 20);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 14, 10, 16);
}

@end

@implementation UIImage (OriginalImage)

+ (UIImage *)originalImage:(NSString *)name{
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addGestureRecognizer:[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(popBack)]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)loadNib:(NSString *)nibName owner:(NSObject *)owner{
    return [[[NSBundle mainBundle]loadNibNamed:nibName owner:owner options:nil] lastObject];
}

- (UIImage *)origionalImage:(NSString *)imageName{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UIViewController *)getViewControllerFromStoryboard:(NSString *)identify{
    return  [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:identify];
}

- (void)setNavLeftBtnTitle:(NSString *)title image:(NSString *)imageName andSelector:(SEL)selectorName{
    NavLeftButton *leftBtn = [NavLeftButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 80, 44);
    leftBtn.titleLabel.font = Font(Font_Size_16);
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setImage:[self origionalImage:imageName] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:selectorName forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}

- (void)setNavRightBtnTitle:(NSString *)title image:(NSString *)imageName andSelector:(SEL)selectorName{
    if (title.length) {
        UIBarButtonItem *titleBtn = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:selectorName];
        self.navigationItem.rightBarButtonItem = titleBtn;
    }else{
        UIBarButtonItem *imageBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImage:imageName] style:UIBarButtonItemStylePlain target:self action:selectorName];
        self.navigationItem.rightBarButtonItem = imageBtn;
    }
}

- (void)popBack{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
