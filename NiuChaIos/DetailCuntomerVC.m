//
//  DetailCuntomerVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/9.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "DetailCuntomerVC.h"

#import "EditCustomerVC.h"

#import "CustomeSaleChanceCell.h"
#import "HomeButton.h"
#import "CustomerButton.h"

typedef NS_ENUM(NSUInteger, ShowTableTpye) {
    ShowTableTpye_BasicInfo,
    ShowTableTpye_CustomerConnection,
    ShowTableTpye_SaleChance,
    ShowTableTpye_DongTai
};

@interface DetailCuntomerVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet CustomerButton *compriseInfoBtn;
@property (strong, nonatomic) IBOutlet CustomerButton *connectBtn;
@property (strong, nonatomic) IBOutlet CustomerButton *saleChanceBtn;
@property (strong, nonatomic) IBOutlet CustomerButton *dongTaiBtn;
@property(strong,nonatomic) CustomerButton *lastSelectBtn;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *tableArray;
@property(assign,nonatomic) ShowTableTpye showType;

@end

@implementation DetailCuntomerVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"DetailCuntomerVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customerInitalize];
}

-(void)customerInitalize{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = UIColor_System_Silver;
    _tableView.backgroundColor = UIColor_System_Silver;
    
    [self setNavLeftBtnTitle:@"联系人详情" image:@"icon_back" andSelector:@selector(customerPopBack)];
    [self setNavRightBtnTitle:@"" image:@"sale_icon_edit" andSelector:@selector(connectionEditAction)];
    
    _showType = ShowTableTpye_BasicInfo;
    
    [self setHeadViewBtns];
    
}

- (void)setHeadViewBtns{
    [_compriseInfoBtn setImage:[self origionalImage:@"bg_nav_1"] forState:UIControlStateNormal];
    [_compriseInfoBtn setTitleColor:UIColorFromHex(0xF96700) forState:UIControlStateNormal];
    _compriseInfoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _lastSelectBtn = _compriseInfoBtn;
    
    [_connectBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_connectBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    _connectBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [_saleChanceBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_saleChanceBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    _saleChanceBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [_dongTaiBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_dongTaiBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    _dongTaiBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (_showType == ShowTableTpye_BasicInfo) {                             //公司基本信息
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customerBasicInfoCellID"];
        cell.contentView.layer.borderColor = UIColor_Fenge_Line.CGColor;
        cell.contentView.layer.borderWidth = 0.5f;
        cell.contentView.backgroundColor = [UIColor whiteColor];
        
//        UILabel *titleLabel = (UILabel *)[cell viewWithTag:160];
//        
//        UILabel *contentLabel = (UILabel *)[cell viewWithTag:161];
        
        return cell;
        
    }else if (_showType == ShowTableTpye_CustomerConnection){                 //联系人
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customeConnectCellID"];
        
        UIImageView *portratImage = (UIImageView *)[cell viewWithTag:150];
        portratImage.layer.cornerRadius = 15;
        portratImage.layer.masksToBounds = YES;
        portratImage.contentMode = UIViewContentModeScaleAspectFit;
//
//        UILabel *nameLabel = (UILabel *)[cell viewWithTag:151];
        
        UIView *backView = [cell viewWithTag:152];
        backView.layer.borderWidth = 0.5f;
        backView.layer.borderColor = UIColor_Fenge_Line.CGColor;
        backView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *arrowImage = (UIImageView *)[cell viewWithTag:153];
        arrowImage.image = [self origionalImage:@"newRicheng_more"];
        
        return cell;
        
    }else if (_showType == ShowTableTpye_SaleChance){                           //销售机会
    
        CustomeSaleChanceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customeSaleCellID"];
        
        cell.backVIew.layer.borderWidth = 0.5f;
        cell.backVIew.layer.borderColor = UIColor_Fenge_Line.CGColor;
        
        cell.cellArrowImage.image = [self origionalImage:@"newRicheng_more"];
        return cell;
        
    }else{                                                                      //动态
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customerDongTaiCellID"];
//        UILabel *contentLabel = (UILabel *)[cell viewWithTag:170];
//        
//        UILabel *timeLabel = (UILabel *)[cell viewWithTag:171];
        
        UIView *backView = [cell viewWithTag:172];
        backView.layer.borderColor = UIColor_Fenge_Line.CGColor;
        backView.layer.borderWidth = 0.5f;
        
        return cell;
    }
    
}
/**/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_showType == ShowTableTpye_SaleChance) {
        return 60;
    }else if(_showType == ShowTableTpye_DongTai){
        return 60;
    }else if(_showType == ShowTableTpye_CustomerConnection){
        return 50;
    }else{
        return 44;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (_showType == ShowTableTpye_BasicInfo || _showType == ShowTableTpye_SaleChance) {
        return 20;
    }
    return 0;
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (_showType == ShowTableTpye_BasicInfo || _showType == ShowTableTpye_SaleChance || _showType == ShowTableTpye_DongTai) {
        return 20;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if (_showType == ShowTableTpye_BasicInfo || _showType == ShowTableTpye_SaleChance || _showType == ShowTableTpye_DongTai) {
        UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width - 20, 40)];
        return footView;
    }
    UIView *footView = [[UIView alloc]initWithFrame:CGRectZero];
    return footView;
}
*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (_showType == ShowTableTpye_BasicInfo || _showType == ShowTableTpye_SaleChance) {
        
        UIView *backView = [[[NSBundle mainBundle]loadNibNamed:@"ConnectTableHeadView" owner:self options:nil]lastObject];
//        backView.frame = CGRectMake(0, 0, Screen_Width - 20, 20);
        backView.backgroundColor = UIColor_System_Silver;
        
        UILabel *title = (UILabel *)[backView viewWithTag:130];
        UILabel *count = (UILabel *)[backView viewWithTag:140];
        UILabel *price = (UILabel *)[backView viewWithTag:150];
        
        if (_showType == ShowTableTpye_BasicInfo) {
            title.text = @"基本信息";
            count.text = @"";
            price.text = @"";
        }else{
            title.text = @"进行中";
            count.text = @"2单";
            price.text = @"¥23400";
        }
        return backView;
    }
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectZero];
    return backView;
}

#pragma mark 视图顶部按钮方法实现
- (IBAction)headViewBtnsAction:(CustomerButton *)sender {
    
    [_lastSelectBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_lastSelectBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    
    [sender setImage:[self origionalImage:@"bg_nav_1"] forState:UIControlStateNormal];
    [sender setTitleColor:UIColorFromHex(0xF96700) forState:UIControlStateNormal];
    
    _lastSelectBtn = sender;
    
    if (sender.tag == 110) {                //基本信息
        
        _showType = ShowTableTpye_BasicInfo;
        
    }else if (sender.tag == 120){           //联系人
    
        _showType = ShowTableTpye_CustomerConnection;
    }else if (sender.tag == 130){           //销售机会
        _showType = ShowTableTpye_SaleChance;
    }else{                                  //动态
        _showType = ShowTableTpye_DongTai;
    }
    
    [_tableView reloadData];

}

#pragma mark 导航栏返回按钮
- (void)customerPopBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 导航栏又按钮方法
- (void)connectionEditAction{
    SKLog(@"%@",NSStringFromSelector(_cmd));
    
    EditCustomerVC *editVC = [[EditCustomerVC alloc]init];
    [self.navigationController pushViewController:editVC animated:YES];
    
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
