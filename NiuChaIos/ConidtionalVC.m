//
//  ConidtionalVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/30.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "ConidtionalVC.h"


#import "ConditionCell.h"

@interface Condition : NSObject

@property(strong,nonatomic) NSString *titleName;
@property(assign,nonatomic) BOOL sybol;

+ (Condition *)initializeWithName:(NSString *)name andSybol:(BOOL)sybol;

@end

@implementation Condition

+ (Condition *)initializeWithName:(NSString *)name andSybol:(BOOL)sybol{
    Condition *condition = [[Condition alloc]init];
    condition.titleName = name;
    condition.sybol = sybol;
    return condition;
}

@end

@interface ConidtionalVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *conditionTableView;
@property(strong,nonatomic) NSArray *conditionArray;
@property(strong,nonatomic) Condition *timeLastCondition;
@property(strong,nonatomic) Condition *comLastCondition;

@end

@implementation ConidtionalVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"ConditionVC"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initialize];
}

- (void)initialize{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _conditionArray = @[@[
                            [Condition initializeWithName:@"已有一周未联系" andSybol:YES],
                            [Condition initializeWithName:@"已有一月未联系" andSybol:NO],
                            [Condition initializeWithName:@"从未联系" andSybol:NO]
                            ],
                        @[
                            [Condition initializeWithName:@"商务卫士" andSybol:YES],
                            [Condition initializeWithName:@"秀客" andSybol:NO],
                            [Condition initializeWithName:@"微堂" andSybol:NO],
                            [Condition initializeWithName:@"最优" andSybol:NO],
                            ]
                        ];
    _conditionTableView.backgroundColor = UIColorFromHex(0xf7f7f7);
    
    [self setNavLeftBtnTitle:@"筛选条件" image:@"icon_back" andSelector:@selector(conditionBack)];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _conditionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_conditionArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *conditionCellID = @"conditionCellID";
    ConditionCell *cell = (ConditionCell *)[tableView dequeueReusableCellWithIdentifier:conditionCellID];
    if (cell == nil) {
        cell = [[ConditionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:conditionCellID];
    }
    
    Condition *temCondition = [_conditionArray[indexPath.section] objectAtIndex:indexPath.row];
    cell.titleLabel.text = temCondition.titleName;
    [cell sizeToFit];
    SKLog(@"%@",NSStringFromCGRect(cell.titleLabel.frame));
    if (temCondition.sybol) {
        cell.cellImage.image = [self origionalImage:@"wancheng"];
        if (indexPath.section == 0) {
            _timeLastCondition = temCondition;
        }else if (indexPath.section == 1){
            _comLastCondition = temCondition;
        }
    }else{
        cell.cellImage.image = [self origionalImage:@"weiwancheng"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        _timeLastCondition.sybol = NO;
        NSInteger index = [_conditionArray[0] indexOfObject:_timeLastCondition];
        [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        Condition *temCondition = [_conditionArray[indexPath.section] objectAtIndex:indexPath.row];
        temCondition.sybol = YES;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        _timeLastCondition = temCondition;
        
    }else if (indexPath.section == 1){
        
        _comLastCondition.sybol = NO;
        NSInteger index = [_conditionArray[1] indexOfObject:_comLastCondition];
        [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        Condition *temCondition = [_conditionArray[1] objectAtIndex:indexPath.row];
        temCondition.sybol = YES;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        _comLastCondition = temCondition;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

#pragma mark conditionBack
- (void)conditionBack{
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
