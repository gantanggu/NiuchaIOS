//
//  EditConnectionVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/8.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "EditConnectionVC.h"

@interface EditConnectionVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) NSArray *tableArray;
@property(strong,nonatomic) NSArray *positionArray;
@property(strong,nonatomic) NSArray *infoArray;

@end

@implementation EditConnectionVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"EditConnectionVC"];
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
    _tableView.backgroundColor = UIColor_System_Silver;
    
    [self setNavLeftBtnTitle:@"新建日程" image:@"icon_back" andSelector:@selector(eidtPopBack)];
    [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(eidtSaveAction)];
    
    _tableArray = @[
                    @[@{@"title":@"联系人:",@"content":@"李哥"},@{@"title":@"公   司:",@"content":@"上海美龙"}
                      ,@{@"title":@"部   门:",@"content":@"PHP"},@{@"title":@"职   位:",@"content":@"美工"}],
                    @[@{@"title":@"电话:",@"content":@"15898758967"},@{@"title":@"手机:",@"content":@"15898759865"},
                      @{@"title":@"邮箱:",@"content":@"12365897@qq.com"},@{@"title":@"微博:",@"content":@"weibo.com"},
                      @{@"title":@"地址:",@"content":@"上海市某某区"},@{@"title":@"邮编:",@"content":@"316000"}]
                    ];
    
}

#pragma mark tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topCellID"];
        
        NSDictionary *temDic = [_tableArray[indexPath.section] objectAtIndex:indexPath.row];
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:110];
        titleLabel.text = [temDic objectForKey:@"title"];
        
        UITextField *temTextField = (UITextField *)[cell viewWithTag:111];
        temTextField.text = [temDic objectForKey:@"content"];
        
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"botCellID"];
        
        NSDictionary *temDic = [_tableArray[indexPath.section] objectAtIndex:indexPath.row];
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:130];
        titleLabel.text = [temDic objectForKey:@"title"];
        
        UITextField *temTextField = (UITextField *)[cell viewWithTag:131];
        temTextField.text = [temDic objectForKey:@"content"];
        
        UILabel *backView = (UILabel *)[cell viewWithTag:133];
        backView.backgroundColor = [UIColor whiteColor];
        backView.layer.borderColor = UIColor_Fenge_Line.CGColor;
        backView.layer.borderWidth = 0.5f;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)eidtPopBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)eidtSaveAction{
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
