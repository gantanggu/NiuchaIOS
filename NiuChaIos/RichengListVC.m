//
//  RichengListVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/7.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "RichengListVC.h"

#import "NewRichengVC.h"
#import "RichengListCell.h"

#define Tableview_Headview_Hitht    20

@interface RichengListVC ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *addRichengBtn;

@property(strong,nonatomic) NSArray *tableArray;

@end

@implementation RichengListVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"RichengListVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self riChengInitalize];
}

- (void)riChengInitalize{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = UIColor_System_Silver;
    [self setNavLeftBtnTitle:@"我的日程" image:@"icon_back" andSelector:@selector(backLastVC)];
    [self setNavRightBtnTitle:@"" image:@"richeng_shaixuan" andSelector:@selector(navRightBtnAction)];
    
    _tableArray = @[@[@{@"icon_left":@"sale_dadianhua_normal",@"icon_right":@"sale_weiwancheng"}]
                    ,
                    @[@{@"icon_left":@"richeng_task",@"icon_right":@"sale_weiwancheng"},
                      @{@"icon_left":@"newRicheng_huiyi",@"icon_right":@"sale_weiwancheng"}]
                    ,
                    @[@{@"icon_left":@"richeng_task",@"icon_right":@"sale_weiwancheng"},
                      @{@"icon_left":@"newRicheng_huiyi",@"icon_right":@"sale_weiwancheng"}]
                    ];
    _tableView.backgroundColor = UIColor_System_Silver;
    [_addRichengBtn setBackgroundImage:[self origionalImage:@"bg_tianjia"] forState:UIControlStateNormal];
    [_addRichengBtn setImage:[self origionalImage:@"icon_tianjia_normal"] forState:UIControlStateNormal];
}

#pragma mark tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tableArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RichengListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    NSDictionary *temDic = [_tableArray[indexPath.section] objectAtIndex:indexPath.row];
    cell.cellRightImage.image = [self origionalImage:[temDic objectForKey:@"icon_right"]];
    cell.cellLeftImage.image = [self origionalImage:[temDic objectForKey:@"icon_left"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Tableview_Headview_Hitht;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width - 20, 20)];
    backView.backgroundColor = UIColor_System_Silver;
    
    UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    leftLabel.text = @"今天";
    leftLabel.font = Font(Font_Size_10);
    [leftLabel sizeToFit];
    CGRect rect = leftLabel.frame;
    leftLabel.frame = CGRectMake(5, (Tableview_Headview_Hitht - rect.size.height)/2, rect.size.width, rect.size.height);
    [backView addSubview:leftLabel];
    
    UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    rightLabel.text = @"已过期";
    rightLabel.font = Font(Font_Size_10);
    [rightLabel sizeToFit];
    rect = rightLabel.frame;
    rightLabel.frame = CGRectMake(Screen_Width - 20 - rect.size.width - 5, (Tableview_Headview_Hitht - rect.size.height) / 2, rect.size.width,rect.size.height);
    [backView addSubview:rightLabel];
    
    return backView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewRichengVC *richengVC = [[NewRichengVC alloc]init];
    richengVC.type = RiCheng_Look;
    [self.navigationController pushViewController:richengVC animated:YES];
}

- (void)backLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 添加日程操作
- (IBAction)addRichengBtnAction:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"添加日程", nil];
    [actionSheet showInView:self.view];
}

#pragma mark actionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NewRichengVC *richengVC = [[NewRichengVC alloc]init];
        richengVC.type = RiCheng_New;
        [self.navigationController pushViewController:richengVC animated:YES];
    }
}

- (void)navRightBtnAction{
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
