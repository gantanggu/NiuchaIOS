//
//  PartnerConnectVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/8.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "PartnerConnectVC.h"
#import "PartnerConditionVC.h"
#import "DetailConnectionVC.h"
#import "DetailCuntomerVC.h"

@interface PartnerConnectVC ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *navSegmentCon;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) NSArray *tableArray;
@property(strong,nonatomic) NSArray *tableHeadArray;

@end

@implementation PartnerConnectVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"PartnerConnectVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self partnerInitalize];
}

- (void)partnerInitalize{
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
    [self setNavLeftBtnTitle:@"" image:@"icon_back" andSelector:@selector(partnerPopLastVC)];
    [self setNavRightBtnTitle:@"" image:@"icon_shaixuan" andSelector:@selector(partnerShowConditionVC)];
    
    if (_type == Partner_Customer) {
        _navSegmentCon.selectedSegmentIndex = 0;
    }else{
        _navSegmentCon.selectedSegmentIndex = 1;
    }
    
    _tableArray = @[];
    _tableHeadArray = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"G"];
    _tableView.backgroundColor = UIColor_System_Silver;
    
}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"partnerCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (_type == Partner_Customer) {
        cell.textLabel.text = @"中国奇瑞汽车有限公司";
    }else{
        cell.textLabel.text = @"123";
    }
    cell.textLabel.font = Font(Font_Size_12);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _tableHeadArray[section];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableHeadArray;
}

- (NSInteger)tableView:(UITableView *)tableView  indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 2;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _tableHeadArray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_type == Partner_Customer) {                    //顾客
        DetailCuntomerVC *customerVC = [[DetailCuntomerVC alloc]init];
        [self.navigationController pushViewController:customerVC animated:YES];
    }else{                                              //联系人
        DetailConnectionVC *connectionVC = [[DetailConnectionVC alloc]init];
        [self.navigationController pushViewController:connectionVC animated:YES];
    }
}

- (void)partnerPopLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)partnerShowConditionVC{
    SKLog(@"%@",NSStringFromSelector(_cmd));
    PartnerConditionVC *conditionVC = [[PartnerConditionVC alloc]init];
    [self.navigationController pushViewController:conditionVC animated:YES];
}

#pragma mark 导航栏segmentcontrol action
- (IBAction)segMentAction:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _type = Partner_Customer;
    }else{
        _type = Partner_Connection;
    }
    [_tableView reloadData];
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
