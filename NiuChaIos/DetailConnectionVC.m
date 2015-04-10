//
//  DetailConnectionVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/8.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "DetailConnectionVC.h"

#import "HomeButton.h"
#import "DetailConnnectCell.h"
#import "DetailConnectInfoCell.h"
#import "EditConnectionVC.h"

typedef enum {
    Tableview_BasicInfo,
    Tableview_SaleChance,
    Tableview_DongTai
}TableViewType;

@interface DetailConnectionVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *tableHeadView;
@property (strong, nonatomic) IBOutlet UILabel *tableConnectName;
@property (strong, nonatomic) IBOutlet UILabel *headComName;
@property(strong,nonatomic) HomeButton *lastSelectBtn;
@property (strong, nonatomic) IBOutlet HomeButton *basicBtn;
@property (strong, nonatomic) IBOutlet HomeButton *saleChanceBtn;
@property (strong, nonatomic) IBOutlet HomeButton *dongTaiBtn;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;

@property(assign,nonatomic) TableViewType type;

@property(strong,nonatomic) NSArray *tableSaleArray;                            //销售机会
@property(strong,nonatomic) NSArray *tableInfoArray;                            //基本信息
@property(strong,nonatomic) NSArray *tableDongArray;                            //动态

@end

@implementation DetailConnectionVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"DetailConnectionVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self connectionInitalize];
}

- (void)connectionInitalize{

    self.view.backgroundColor = UIColor_System_Silver;
    _tableView.backgroundColor = UIColor_System_Silver;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    _tableSaleArray = @[@[@{@"title":@"运行中"},@{@"title":@"运行中"}],@[@{@"title":@"运行中"}],@[@{@"title":@"运行中"}]];
    _tableInfoArray = @[@{@"title":@"电话:",@"content":@"15898758967"},@{@"title":@"手机:",@"content":@"15898759865"},
                        @{@"title":@"邮箱:",@"content":@"12365897@qq.com"},@{@"title":@"微博:",@"content":@"weibo.com"},
                        @{@"title":@"地址:",@"content":@"上海市某某区"},@{@"title":@"邮编:",@"content":@"316000"}];
    
    [self setNavLeftBtnTitle:@"联系人详情" image:@"icon_back" andSelector:@selector(connectionPopBack)];
    [self setNavRightBtnTitle:@"" image:@"sale_icon_edit" andSelector:@selector(connectionEditAction)];
    
    [_basicBtn setImage:[self origionalImage:@"bg_nav_1"] forState:UIControlStateNormal];
    [_basicBtn setTitleColor:UIColorFromHex(0xF96700) forState:UIControlStateNormal];
    _basicBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _lastSelectBtn = _basicBtn;
    _type = Tableview_BasicInfo;
    
    
    [_saleChanceBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_saleChanceBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    _saleChanceBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [_dongTaiBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_dongTaiBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    _dongTaiBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [_addBtn setBackgroundImage:[self origionalImage:@"bg_tianjia"] forState:UIControlStateNormal];
    [_addBtn setImage:[self origionalImage:@"icon_tianjia_normal"] forState:UIControlStateNormal];
}

#pragma mark tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (_type == Tableview_BasicInfo) {
        return 1;
    }else if (_type == Tableview_SaleChance){
        return _tableSaleArray.count;
    }else{
        return 1;
    }
//    return _tableSaleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (_type == Tableview_BasicInfo) {
        return _tableInfoArray.count;
    }else if (_type == Tableview_SaleChance){
        return [_tableSaleArray[section] count];
    }else{
        return 5;
    }
    return [_tableSaleArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_type == Tableview_BasicInfo) {
        DetailConnectInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailInfoCell"];
        
        NSDictionary *temDic = _tableInfoArray[indexPath.row];
        cell.cellTitle.text = [temDic objectForKey:@"title"];
        cell.cellContent.text = [temDic objectForKey:@"content"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.layer.borderWidth = 0.5f;
        cell.contentView.layer.borderColor = UIColor_Fenge_Line.CGColor;
        
        return cell;
    }else if (_type == Tableview_SaleChance){
        DetailConnnectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCellID"];
        cell.cellArrowImage.image = [self origionalImage:@"more"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dongTaiCellID"];
        
        UIView *backView = [cell viewWithTag:132];
        backView.layer.borderColor = UIColor_Fenge_Line.CGColor;
        backView.layer.borderWidth = 0.5;
        
        UILabel *title = (UILabel *)[cell viewWithTag:130];
        title.text = @"今天心情不好，好像找个人打一架啊。。。。";
        
        UILabel *timeLabel = (UILabel *)[cell viewWithTag:131];
        timeLabel.text = @"2014/12/2 15:32";
        
        cell.contentView.backgroundColor = UIColor_System_Silver;
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [[[NSBundle mainBundle]loadNibNamed:@"ConnectTableHeadView" owner:self options:nil]lastObject];
    backView.backgroundColor = UIColor_System_Silver;
    
    UILabel *stateLabel = (UILabel *)[backView viewWithTag:130];
    UILabel *countLabel = (UILabel *)[backView viewWithTag:140];
    UILabel *priceLabel = (UILabel *)[backView viewWithTag:150];
    
    if (_type == Tableview_BasicInfo) {
        stateLabel.text = @"基本信息";
        countLabel.text = @"";
        priceLabel.text = @"";
    }else if (_type == Tableview_SaleChance){
        stateLabel.text = @"运行";
        countLabel.text = @"2单";
        priceLabel.text = @"¥25000";
    }else{
    
    }
    return backView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_type == Tableview_BasicInfo) {
        return 44;
    }else if (_type == Tableview_SaleChance){
        return 62;
    }else{
        return 70;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (_type == Tableview_BasicInfo || _type == Tableview_SaleChance) {
        return 20;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
- (void)connectionPopBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)connectionEditAction{
    SKLog(@"%@",NSStringFromSelector(_cmd));
    
    EditConnectionVC *editConnectionVC = [[EditConnectionVC alloc]init];
    [self.navigationController pushViewController:editConnectionVC animated:YES];
    
}

- (IBAction)changeDataBtnsAction:(HomeButton *)sender {
    
    [_lastSelectBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_lastSelectBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    
    [sender setTitleColor:UIColorFromHex(0xF96700) forState:UIControlStateNormal];
    [sender setImage:[self origionalImage:@"bg_nav_1"] forState:UIControlStateNormal];
    
    _lastSelectBtn = sender;
    
    
    if (sender.tag == 120) {                    //基本信息
        
        _type = Tableview_BasicInfo;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }else if (sender.tag == 130){               //销售机会
        
        _type = Tableview_SaleChance;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else{                                      //动态
        
        _type = Tableview_DongTai;
        
    }

    [_tableView reloadData];
    
    SKLog(@"%ld",sender.tag);
    
}
- (IBAction)addBtnAction:(UIButton *)sender {
    
    if (_type == Tableview_BasicInfo) {
        SKLog(@"Tableview_BasicInfo");
    }else if (_type == Tableview_SaleChance){
        SKLog(@"Tableview_SaleChance");
    }else{
        SKLog(@"Tableview_DongTai");
    }
    
    
//    SKLog(@"%@",NSStringFromSelector(_cmd));
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
