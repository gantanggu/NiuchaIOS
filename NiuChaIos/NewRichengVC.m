//
//  NewRichengVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/7.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "NewRichengVC.h"

#import "TiXingTimeVC.h"
#import "NewRichengCell.h"

@interface NewRichengVC ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) NSArray *tableArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NewRichengVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"NewRichengVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self newRichengInitalize];
}

- (void)newRichengInitalize{
    
    if (_type == RiCheng_New) {
        [self setNavLeftBtnTitle:@"新建日程" image:@"icon_back" andSelector:@selector(backToLastVC)];
        [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(saveRicheng)];
        
        _tableArray = @[
                        @[@{@"icon_left":@"newRicheng_morenleixing",@"titile":@"请输入日期",@"icon_right":@"newRicheng_weiwancheng",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_dizhi",@"titile":@"地址",@"icon_right":@"",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_beizhu",@"titile":@"详情备注",@"icon_right":@"",@"subTitle":@""}]
                        ,
                        @[@{@"icon_left":@"",@"titile":@"开始时间",@"icon_right":@"",@"subTitle":@"设置开始时间"},
                          @{@"icon_left":@"",@"titile":@"结束时间",@"icon_right":@"",@"subTitle":@"设置结束时间"}]
                        ,
                        @[@{@"icon_left":@"newRicheng_tixing",@"titile":@"提醒",@"icon_right":@"newRicheng_more",@"subTitle":@"设置提醒日期"}]
                        ,
                        @[@{@"icon_left":@"newRicheng_gongsi",@"titile":@"张氏企业有限公司",@"icon_right":@"newRicheng_more",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_lianxiren",@"titile":@"张经理",@"icon_right":@"newRicheng_more",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_jihui",@"titile":@"与张氏企业优先公司的销售机会",@"icon_right":@"newRicheng_more",@"subTitle":@""}]
                        ];
    }else{
        [self setNavLeftBtnTitle:@"日程安排" image:@"icon_back" andSelector:@selector(backToLastVC)];
        [self setNavRightBtnTitle:@"" image:@"newRicheng_edit" andSelector:@selector(saveRicheng)];
        
        _tableArray = @[
                        @[@{@"icon_left":@"newRicheng_morenleixing",@"titile":@"开会",@"icon_right":@"newRicheng_weiwancheng",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_dizhi",@"titile":@"2#号会议室",@"icon_right":@"",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_beizhu",@"titile":@"要带电脑演示",@"icon_right":@"",@"subTitle":@""}]
                        ,
                        @[@{@"icon_left":@"",@"titile":@"开始时间",@"icon_right":@"",@"subTitle":@"2014年3月10日 14:00"},
                          @{@"icon_left":@"",@"titile":@"结束时间",@"icon_right":@"",@"subTitle":@"2014年3月10日 15:30"}]
                        ,
                        @[@{@"icon_left":@"newRicheng_tixing",@"titile":@"提醒",@"icon_right":@"newRicheng_more",@"subTitle":@"准时提醒"}]
                        ,
                        @[@{@"icon_left":@"newRicheng_gongsi",@"titile":@"张氏企业有限公司",@"icon_right":@"newRicheng_more",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_lianxiren",@"titile":@"张经理",@"icon_right":@"newRicheng_more",@"subTitle":@""},
                          @{@"icon_left":@"newRicheng_jihui",@"titile":@"与张氏企业优先公司的销售机会",@"icon_right":@"newRicheng_more",@"subTitle":@""}]
                        ];
    }
    
    
    
    
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"newRichengCellID";
    NewRichengCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NewRichengCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSArray *temArray = _tableArray[indexPath.section];
    NSDictionary *temDic = temArray[indexPath.row];
    
    if (indexPath.section == 0) {
        cell.cellTextField.userInteractionEnabled = YES;
    }else{
        cell.cellTextField.userInteractionEnabled = NO;
    }
    
    cell.cellTextField.text = [temDic objectForKey:@"titile"];
    
    cell.cellLeftImage.image = [self origionalImage:[temDic objectForKey:@"icon_left"]];
    cell.cellRightImage.image = [self origionalImage:[temDic objectForKey:@"icon_right"]];
    
    if (indexPath.section == 1) {
        [cell removeConstraint:cell.textFieldLeadCon];
        [cell removeConstraint:cell.labelTrailCon];
        
        NSArray *leadCon = [NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[cellTextfield]" options:0 metrics:nil views:@{@"cellTextfield":cell.cellTextField}];
        [cell addConstraints:leadCon];
        
        leadCon = [NSLayoutConstraint constraintsWithVisualFormat:@"[cellLabel]-10-|" options:0 metrics:nil views:@{@"cellLabel":cell.cellLabel}];
        [cell addConstraints:leadCon];
    }else{
        [cell addConstraint:cell.textFieldLeadCon];
        [cell addConstraint:cell.labelTrailCon];
    }
    cell.cellLabel.text = [temDic objectForKey:@"subTitle"];
    [cell.cellLabel sizeToFit];
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width - 20, 10)];
    backView.backgroundColor = UIColor_System_Silver;
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
        
            switch (indexPath.row) {
                case 0:                 //输入日期
                {
                
                }
                    break;
                case 1:                 //地址
                {
                    
                }
                    break;
                case 2:                 //详情备注
                {
                    
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            if (indexPath.row) {        //开始时间
                
            }else{                      //结束时间
            
            }
        }
            break;
        case 2:                         //提醒
        {
            TiXingTimeVC *tiXingVC = [[TiXingTimeVC alloc]init];
            [self.navigationController pushViewController:tiXingVC animated:YES];
        }
            break;
        case 3:
        {
            switch (indexPath.row) {
                case 0:                 //公司名称
                {
                
                }
                    break;
                case 1:                 //联系人
                {
                    
                }
                    break;
                case 2:                 //销售机会
                {
                    
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}

- (void)backToLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveRicheng{
    if (_type == RiCheng_New) {
        
    }else{
        
    }
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
