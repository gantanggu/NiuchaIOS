//
//  LogInVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/10.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "LogInVC.h"

@interface LogInVC ()

@property (strong, nonatomic)  UIToolbar *thirdLoginToolBar;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *thirdLabelCon;
@property (strong, nonatomic) IBOutlet UILabel *thirdLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *thirdVertailSpaceCon;
@property (strong, nonatomic) IBOutlet UIButton *xinLangBtn;
@property (strong, nonatomic) IBOutlet UIButton *qqBtn;
@property (strong, nonatomic) IBOutlet UIButton *kaiXinWangBtn;
@property (strong, nonatomic) IBOutlet UIButton *renRenBtn;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *qqLeadingCons;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *kaiXinWangLeadingCons;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *renRenLeadingCons;

@property (strong, nonatomic) IBOutlet UIView *registerView;

@end

@implementation LogInVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"LogInVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loginInitalize];
}

- (void)loginInitalize{
    
    self.view.backgroundColor = UIColor_System_Silver;
    UIImage *loginImage = [UIImage imageNamed:@"logo_denglu_normal"];
    [_loginBtn setBackgroundImage:[loginImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)] forState:UIControlStateNormal];
    UIImage *presedImage = [UIImage imageNamed:@"logo_denglul_pressed"];
    [_loginBtn setBackgroundImage:[presedImage resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)] forState:UIControlStateHighlighted];
    
    
    [self.view removeConstraints:@[_qqLeadingCons,_kaiXinWangLeadingCons,_renRenLeadingCons]];
    
    NSArray *consArr = [NSLayoutConstraint constraintsWithVisualFormat:@"[xinLangBtn]-distance-[qqBtn]-distance-[kaiXinWangBtn]-distance-[renRenBtn]" options:0 metrics:@{@"distance":@((Screen_Width - 195)/3)} views:@{@"xinLangBtn":_xinLangBtn,@"qqBtn":_qqBtn,@"kaiXinWangBtn":_kaiXinWangBtn,@"renRenBtn":_renRenBtn}];
    [self.view addConstraints:consArr];
    
    if (Iphone4) {
        [self.view removeConstraint:_thirdLabelCon];
        [self.view removeConstraint:_thirdVertailSpaceCon];
        NSArray *bottomCon = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-100-|" options:0 metrics:nil views:@{@"label":_thirdLabel}];
        [self.view addConstraints:bottomCon];
        
        bottomCon = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-5-[button]" options:0 metrics:nil views:@{@"label":_thirdLabel,@"button":_xinLangBtn}];
        [self.view addConstraints:bottomCon];
    }
}
- (IBAction)popBack:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)registerAction:(UIButton *)sender {
    
    _registerView = [[[NSBundle mainBundle]loadNibNamed:@"registerView" owner:self options:nil]lastObject];
    _registerView.frame = CGRectMake(Screen_Width, 0, Screen_Width, Screen_Height);
    [self.view addSubview:_registerView];
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        _registerView.transform = CGAffineTransformIdentity;
        _registerView.transform = CGAffineTransformTranslate(_registerView.transform,-Screen_Width, 0);
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)dismissRegisterView:(UIButton *)sender {
    
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        _registerView.transform = CGAffineTransformIdentity;
        _registerView.transform = CGAffineTransformTranslate(_registerView.transform, 0, 0);
    } completion:^(BOOL finished) {
        [_registerView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
