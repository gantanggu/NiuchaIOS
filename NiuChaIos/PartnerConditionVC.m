//
//  PartnerConditionVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/8.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "PartnerConditionVC.h"

#import "TixingTimeCell.h"

@interface PartnerCondition : NSObject

@property(strong,nonatomic) NSString *title;
@property(assign,nonatomic) BOOL select;

+ (PartnerCondition *)initWithTitle:(NSString *)title select:(BOOL)select;

@end

@implementation PartnerCondition

+ (PartnerCondition *)initWithTitle:(NSString *)title select:(BOOL)select{
    PartnerCondition *cond = [[PartnerCondition alloc]init];
    cond.title = title;
    cond.select = select;
    return cond;
}

@end

@interface PartnerConditionVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *tableArray;
@property(strong,nonatomic) PartnerCondition *lastSelectCon;

@end

@implementation PartnerConditionVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"PartnerConditionVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self conditionInitalize];
}

- (void)conditionInitalize{

    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setNavLeftBtnTitle:@"筛选条件" image:@"icon_back" andSelector:@selector(conditionPopToLastVC)];
    [self setNavRightBtnTitle:@"" image:@"" andSelector:@selector(conditionSave)];
    
    _tableArray = @[[PartnerCondition initWithTitle:@"最近添加" select:NO],
                    [PartnerCondition initWithTitle:@"已有一周未联系" select:YES],
                    [PartnerCondition initWithTitle:@"已有一月未联系" select:NO],
                    [PartnerCondition initWithTitle:@"从未联系" select:NO]];
    
    _tableView.backgroundColor = UIColor_System_Silver;
}

#pragma mark tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"conditionCellID";
    TixingTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[TixingTimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    PartnerCondition *temCon = _tableArray[indexPath.row];
    if (temCon.select) {
        cell.cellRightImage.image = [self origionalImage:@"newRicheng_wancheng"];
        _lastSelectCon = temCon;
    }else{
        cell.cellRightImage.image = [self origionalImage:@"newRicheng_weiwancheng"];
    }
    cell.cellLabel.text = temCon.title;
    cell.cellLabel.font = Font(Font_Size_14);
    [cell.cellLabel sizeToFit];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _lastSelectCon.select = NO;
    NSInteger location = [_tableArray indexOfObject:_lastSelectCon];
    NSIndexPath *index = [NSIndexPath indexPathForRow:location inSection:0];
    [tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
    
    PartnerCondition *temCon = _tableArray[indexPath.row];
    temCon.select = YES;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    _lastSelectCon = temCon;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

- (void)conditionPopToLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)conditionSave{
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
