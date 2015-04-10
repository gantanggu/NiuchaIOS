//
//  EditCustomerVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/9.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "EditCustomerVC.h"

@interface EditCustomerVC ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *tableArray;
@property(strong,nonatomic) NSArray *tableHeadArray;

@end

@implementation EditCustomerVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"EditCustomerVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self editInitalize];
}

- (void)editInitalize{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setNavLeftBtnTitle:@"新建日程" image:@"icon_back" andSelector:@selector(editPopBackVC)];
    [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(editSaveAction)];
    
    _tableView.backgroundColor = UIColor_System_Silver;
    self.view.backgroundColor = UIColor_System_Silver;
    _tableArray = @[@[@{@"title":@"客户所有人:",@"content":@"刘备"},
                      @{@"title":@"客户级别:",@"content":@"A"}],
                    @[@{@"title":@"地址:",@"content":@"中国山东省"},
                      @{@"title":@"电话:",@"content":@"18695874875"},
                      @{@"title":@"邮编:",@"content":@"3258692"}],
                    @[@{@"title":@"总人数:",@"content":@"1000"},
                      @{@"title":@"销售额:",@"content":@"258万"},
                      @{@"title":@"最新跟进人:",@"content":@"张根"},
                      @{@"title":@"创建日期:",@"content":@"2015/12/15"}]];
    _tableHeadArray = @[@"基本信息",@"联系信息",@"公司状况"];
}

#pragma mark tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"editCellID"];
    
    NSDictionary *temDic = [_tableArray[indexPath.section] objectAtIndex:indexPath.row];
    
    UILabel *title = (UILabel *)[cell viewWithTag:120];
    title.text = [temDic objectForKey:@"title"];
    
    UITextField *textField = (UITextField *)[cell viewWithTag:121];
    textField.text = [temDic objectForKey:@"content"];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.contentView.layer.borderColor = UIColor_Fenge_Line.CGColor;
    cell.contentView.layer.borderWidth = 0.5f;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width - 20, 25)];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectZero];
    title.text = _tableHeadArray[section];
    title.font = Font(Font_Size_14);
    [title sizeToFit];
    CGSize size = title.frame.size;
    title.frame = CGRectMake(10, (25 - size.height) / 2.0, size.width, size.height);
    [backView addSubview:title];
    
    return backView;
}

#pragma mark textfield delegate

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    UITableViewCell *cell = (UITableViewCell *)[textField superview];
    
    UILabel *title = (UILabel *)[cell viewWithTag:120];
    SKLog(@"%@",title.text);
    
    SKLog(@"%@",textField.text);
}

- (void)editPopBackVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)editSaveAction{
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
