//
//  MyTeamVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/27.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "MyTeamVC.h"
#import "MyTeamCell.h"

@interface TeamIntro : NSObject

@property(strong,nonatomic) NSString *teamName;
@property(assign,nonatomic) BOOL select;

+ (TeamIntro *)initWithName:(NSString *)teamName select:(BOOL)select;

@end

@implementation TeamIntro

+ (TeamIntro *)initWithName:(NSString *)teamName select:(BOOL)select{
    TeamIntro *team = [[TeamIntro alloc]init];
    team.teamName = teamName;
    team.select = select;
    return team;
}

@end

@interface MyTeamVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *tableArray;
@property(strong,nonatomic) TeamIntro *lastSelectTeam;

@end

@implementation MyTeamVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MyTeamVC"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self teamInitalize];
}

- (void)teamInitalize{
    
    self.view.backgroundColor = UIColor_System_Silver;
    _tableView.backgroundColor = UIColor_System_Silver;
    
    [self setNavLeftBtnTitle:@"我的团队" image:@"icon_back" andSelector:@selector(backLastVC)];
    [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(saveAction)];
    
    _tableArray = @[[TeamIntro initWithName:@"厦门258" select:YES],
                    [TeamIntro initWithName:@"厦门分裤" select:NO],
                    [TeamIntro initWithName:@"个人单干" select:NO]];
}


#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamCell"];
    TeamIntro *temTeam = _tableArray[indexPath.row];
    cell.cellTitle.text = temTeam.teamName;
    if (temTeam.select) {
        cell.cellRightImage.image = [self origionalImage:@"newRicheng_wancheng"];
        _lastSelectTeam = temTeam;
    }else{
        cell.cellRightImage.image = [self origionalImage:@"newRicheng_weiwancheng"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger location = [_tableArray indexOfObject:_lastSelectTeam];
    _lastSelectTeam.select = NO;
    NSIndexPath *index =  [NSIndexPath indexPathForItem:location inSection:0];
    [tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
    
    TeamIntro *temTeam = _tableArray[indexPath.row];
    temTeam.select = YES;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    _lastSelectTeam = temTeam;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}


- (void)backLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveAction{
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
