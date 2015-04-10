//
//  FeedBackVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/27.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "FeedBackVC.h"

@interface FeedBackVC ()

@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation FeedBackVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"FeedBackVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self feedBaceInitalise];
}

- (void)feedBaceInitalise{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setNavLeftBtnTitle:@"意见反馈" image:@"icon_back" andSelector:@selector(backLastVC)];
    [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(saveAction)];
    
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.text = @"请输入您的意见";
    _textView.layer.borderColor = UIColorFromHex(0xd1d1d1).CGColor;
    _textView.layer.borderWidth = 0.5f;
    _textView.layer.cornerRadius = 4.f;
    self.view.backgroundColor = UIColor_System_Silver;
}


- (void)backLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveAction{
    SKLog(@"%@",NSStringFromSelector(_cmd));
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
