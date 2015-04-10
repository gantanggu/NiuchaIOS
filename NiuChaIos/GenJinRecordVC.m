//
//  GenJinRecordVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/10.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "GenJinRecordVC.h"

#import "AddGenjinRecordVC.h"

@interface GenJinRecordVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GenJinRecordVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"GenJinRecordVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self genJinInitalize];
}

- (void) genJinInitalize{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColor_System_Silver;
    _tableView.backgroundColor = UIColor_System_Silver;
    [self setNavLeftBtnTitle:@"跟进管理" image:@"icon_back" andSelector:@selector(genjinPopBack)];
}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"genJinRecordCellID"];
    
    UIImageView *protal = (UIImageView *)[cell viewWithTag:120];
    protal.contentMode = UIViewContentModeScaleAspectFit;
    protal.clipsToBounds = YES;
    protal.layer.cornerRadius = 15;
    protal.image = [self origionalImage:@"icon_kaixinwang"];
    
    cell.contentView.layer.borderColor = UIColor_Fenge_Line.CGColor;
    cell.contentView.layer.borderWidth = 0.5f;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 76;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width - 20, 20)];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.text = @"今天 10:30am";
    label.textColor = UIColor_Custom_Orange;
    label.font = Font(Font_Size_10);
    [label sizeToFit];
    CGRect rect = label.frame;
    label.frame = CGRectMake(Screen_Width - 25 - rect.size.width, (20 - rect.size.height)/2.0, rect.size.width, rect.size.height);
    [backView addSubview:label];
    
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AddGenjinRecordVC *addGenjinVC = [[AddGenjinRecordVC alloc]init];
    [self.navigationController pushViewController:addGenjinVC animated:YES];
}

- (void)genjinPopBack{
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
