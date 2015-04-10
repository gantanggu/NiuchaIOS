//
//  AddGenjinRecordVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/10.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "AddGenjinRecordVC.h"

@interface AddGenjinRecordVC ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITableView *tableVIew;
@property(strong,nonatomic) NSArray *tableArray;

@end

@implementation AddGenjinRecordVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"AddGenjinRecordVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addGenjinInitalize];
}

- (void)addGenjinInitalize{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColor_System_Silver;
    _tableVIew.backgroundColor = UIColor_System_Silver;
    
    [self setNavLeftBtnTitle:@"销售机会" image:@"icon_back" andSelector:@selector(addGenjinPopback)];
    [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(addGenjinSave)];

    _tableArray = @[@{@"title":@"企业有限公司",@"icon":@"newRicheng_gongsi"},
                    @{@"title":@"联系人",@"icon":@"newRicheng_lianxiren"},
                    @{@"title":@"销售机会",@"icon":@"newRicheng_jihui"}];

}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addGenjinCellID"];
    cell.contentView.layer.borderColor = UIColor_Fenge_Line.CGColor;
    cell.contentView.layer.borderWidth = 0.5f;
    
    NSDictionary *temDic = _tableArray[indexPath.row];
    UIImageView *cellImage = (UIImageView *)[cell viewWithTag:120];
    cellImage.backgroundColor = UIColor_Fenge_Line;
    cellImage.image = [self origionalImage:[temDic objectForKey:@"icon"]];
    
    UILabel *title = (UILabel *)[cell viewWithTag:121];
    title.text = [temDic objectForKey:@"title"];
    
    return cell;
}


- (void)addGenjinPopback{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addGenjinSave{
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
