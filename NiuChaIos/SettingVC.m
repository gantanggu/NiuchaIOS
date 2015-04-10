//
//  SettingVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/27.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "SettingVC.h"

#import "SettingCell.h"

@interface SettingVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *tableArray;

@end

@implementation SettingVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = (SettingVC *)[self getViewControllerFromStoryboard:@"SettingVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self settingInitalize];
}

- (void)settingInitalize{
    
    
    [self setNavLeftBtnTitle:@"系统设置" image:@"icon_back" andSelector:@selector(backLastVC)];
    self.view.backgroundColor = UIColor_System_Silver;
    _tableView.backgroundColor = UIColor_System_Silver;
    
    self.navigationController.navigationBar.transform = CGAffineTransformIdentity;
    self.navigationController.navigationBar.transform = CGAffineTransformTranslate(self.navigationController.navigationBar.transform, 200, 0);
    self.navigationController.navigationBar.transform = CGAffineTransformScale(self.navigationController.navigationBar.transform, 0.75, 0.75);
    
    self.view.transform= CGAffineTransformIdentity;
    self.view.transform = CGAffineTransformTranslate(self.view.transform, 200, 0);
    self.view.transform = CGAffineTransformScale(self.view.transform, 0.75, 0.75);
    
    _tableView.transform = CGAffineTransformIdentity;
    _tableView.transform = CGAffineTransformTranslate(_tableView.transform, 200, 0);
    _tableView.transform = CGAffineTransformScale(_tableView.transform, 0.75, 0.75);
    
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        
        self.navigationController.navigationBar.transform = CGAffineTransformIdentity;
        self.navigationController.navigationBar.transform = CGAffineTransformTranslate(self.navigationController.navigationBar.transform, 0, 0);
        self.navigationController.navigationBar.transform = CGAffineTransformScale(self.navigationController.navigationBar.transform, 1, 1);
        
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, 0);
        self.view.transform = CGAffineTransformScale(self.view.transform, 1.0, 1.0);
        
        _tableView.transform = CGAffineTransformIdentity;
        _tableView.transform = CGAffineTransformTranslate(_tableView.transform, 0, 0);
        _tableView.transform = CGAffineTransformScale(_tableView.transform, 1.0, 1.0);
        
    } completion:^(BOOL finished) {
        
    }];
    _tableArray = @[@[@{@"icon_left":@"system_laidian",@"title":@"来电提醒",@"select":@(YES)},
                      @{@"icon_left":@"system_xiaoxitixing",@"title":@"消息提醒",@"select":@(NO)}],
                    @[@{@"icon_left":@"system_mima",@"title":@"修改密码"}],
                    @[@{@"icon_left":@"system_niucha",@"title":@"版本更新",@"subTitle":@""},
                      @{@"icon_left":@"system_huanchong",@"title":@"更新缓冲",@"subTitle":@"V2.0"}],
                    @[@{@"icon_left":@"system_pingjia",@"title":@"给牛叉评分"}]
                    ];
    
}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableArray[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
    
    NSDictionary *temDic = [_tableArray[indexPath.section] objectAtIndex:indexPath.row];
    cell.cellRightImage.image = [self origionalImage:[temDic objectForKey:@"icon_left"]];
    cell.cellTitle.text = [temDic objectForKey:@"title"];
    
    switch (indexPath.section) {
        case 0:
        {
            if ([[temDic objectForKey:@"select"] boolValue]) {
                cell.cellLeftImage.image = [self origionalImage:@"newRicheng_wancheng"];
            }else{
                cell.cellLeftImage.image = [self origionalImage:@"newRicheng_weiwancheng"];
            }
        }
            break;
        case 2:
        {
            cell.subTitle.text = [temDic objectForKey:@"subTitle"];
            [cell.subTitle sizeToFit];
            cell.cellLeftImage.image = [self origionalImage:@"newRicheng_more"];
        }
            break;
        default:
        {
            cell.cellLeftImage.image = [self origionalImage:@"newRicheng_more"];
        }
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}

- (void)backLastVC{
    [self.navigationController popViewControllerAnimated:YES];
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
