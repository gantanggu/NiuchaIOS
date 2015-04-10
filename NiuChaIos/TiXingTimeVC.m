//
//  TiXingTimeVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/7.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "TiXingTimeVC.h"
#import "TixingTimeCell.h"

@interface Time : NSObject

@property(strong,nonatomic) NSString *title;
@property(assign,nonatomic) BOOL select;

+ (Time *)initWithTitle:(NSString *)title andSelect:(BOOL)select;
@end

@implementation Time

+(Time *)initWithTitle:(NSString *)title andSelect:(BOOL)select{
    Time  *time = [[Time alloc]init];
    time.title = title;
    time.select = select;
    return time;
}

@end

@interface TiXingTimeVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *tableArray;
@property(strong,nonatomic) Time *lastTime;

@end

@implementation TiXingTimeVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"TiXingTimeVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tiXingTimeInitalize];
}

- (void)tiXingTimeInitalize{
    
    [self setNavLeftBtnTitle:@"提醒时间" image:@"icon_back" andSelector:@selector(backToLastVC)];
    [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(saveTiXing)];
    
    _tableArray = @[[Time initWithTitle:@"准时提醒" andSelect:YES],
                    [Time initWithTitle:@"提前5分钟提醒" andSelect:NO],
                    [Time initWithTitle:@"提前10分钟提醒" andSelect:NO],
                    [Time initWithTitle:@"提前20分钟提醒" andSelect:NO],
                    [Time initWithTitle:@"提前30分钟提醒" andSelect:NO],
                    [Time initWithTitle:@"提前45分钟提醒" andSelect:NO],
                    [Time initWithTitle:@"提前1小时提醒" andSelect:NO],
                    [Time initWithTitle:@"提前2小时提醒" andSelect:NO]
                   ];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
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
    static NSString *timeCellID = @"timeCellID";
    TixingTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:timeCellID];
    if (cell == nil) {
        cell = [[TixingTimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:timeCellID];
    }
    
    Time *temTime = _tableArray[indexPath.row];
    cell.cellLabel.text = temTime.title;
    [cell.cellLabel sizeToFit];
    
    if (temTime.select) {
        cell.cellRightImage.image = [self origionalImage:@"newRicheng_wancheng"];
        _lastTime = temTime;
    }else{
        cell.cellRightImage.image = [self origionalImage:@"newRicheng_weiwancheng"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Time *temTime = _tableArray[indexPath.row];
    
    NSInteger location = [_tableArray indexOfObject:_lastTime];
    _lastTime.select = NO;
    NSIndexPath *index = [NSIndexPath indexPathForRow:location inSection:0];
    [tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
    
    temTime.select = YES;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    _lastTime = temTime;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
- (void)backToLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveTiXing{
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
