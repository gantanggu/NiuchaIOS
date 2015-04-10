//
//  AddChanceVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/31.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "AddChanceVC.h"

#import "SaleProductVC.h"
#import "MyPageControl.h"
#import "AddCollectionCell.h"
#import "AddChanceCell.h"


#define Add_CellID     @"addCellID"


@interface AddChanceVC ()<
UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,
UITableViewDataSource,UITableViewDelegate,
UITextFieldDelegate
>

@property (strong, nonatomic) IBOutlet UIView *tableHead;
@property (strong, nonatomic) IBOutlet UILabel *collectionBackView;
@property (strong, nonatomic) IBOutlet UIView *tableFootView;

@property (strong, nonatomic) IBOutlet UICollectionView *headCollectionView;
@property(strong,nonatomic) NSArray *stepArray;
@property(strong,nonatomic) MyPageControl *pageControl;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray *tableArray;
@property (strong, nonatomic) IBOutlet UIButton *tableFootBtn;
@property (strong, nonatomic) IBOutlet UITextField *headTextField;
@property (strong, nonatomic) IBOutlet UIView *textFieldBack;

@end

@implementation AddChanceVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddChanceVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChanceInitialize];
}

-(void) addChanceInitialize{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (_editVC) {          //此视图为编辑销售机会视图
        SKLog(@"come from detailVC");
        [self setNavLeftBtnTitle:@"编辑销售机会" image:@"icon_back" andSelector:@selector(addChancePop)];
    }else{                  //添加销售机会视图
        SKLog(@"come from saleFunnelVC");
        [self setNavLeftBtnTitle:@"添加销售机会" image:@"icon_back" andSelector:@selector(addChancePop)];
    }
    
    [self setNavRightBtnTitle:@"" image:@"icon_save" andSelector:@selector(addChanceSave)];
    
    _stepArray = @[@"首次登陆",@"二次登陆",@"洽谈",@"成交"];
    
    _tableHead = [[[NSBundle mainBundle]loadNibNamed:@"addChanceHead" owner:self options:nil] lastObject];
    _tableHead.backgroundColor = UIColorFromHex(0xF8F8F8);
    
    _textFieldBack.layer.borderWidth = 0.5f;
    _textFieldBack.layer.borderColor = UIColor_Fenge_Line.CGColor;
    
    [_headCollectionView registerClass:[AddCollectionCell class] forCellWithReuseIdentifier:Add_CellID];
    _headCollectionView.layer.cornerRadius = 5.f;
    _headCollectionView.layer.borderColor = UIColorFromHex(0xe4e4e4).CGColor;
    _headCollectionView.layer.borderWidth = 1.f;
    
    
    _tableFootView = [[[NSBundle mainBundle]loadNibNamed:@"addChanceFoot" owner:self options:nil] lastObject];
    _tableView.tableFooterView = _tableFootView;
    _tableFootBtn.layer.cornerRadius = 5.f;
    
    _pageControl = [[MyPageControl alloc]initWithFrame:CGRectMake(10, 103 - 4, Screen_Width - 20, 4) pageCount:_stepArray.count];
    [_pageControl changeImage:0];
    [_tableHead addSubview:_pageControl];
    
    _tableView.tableHeaderView = _tableHead;
    _tableView.backgroundColor = UIColorFromHex(0xF8F8F8);
    _tableArray = @[
                    @[@{@"title":@"客户",@"icon":@"sale_icon_gongsi",@"content":@"选择一个客户",@"icon_right":@"icon_more"}],
                    @[@{@"title":@"主要联系人",@"icon":@"sale_icon_lianxiren",@"content":@"选择一个主要联系人",@"icon_right":@"icon_more"}],
                    @[
                        @{@"title":@"产品与报价",@"icon":@"sale_icon_goumai",@"content":@"选择销售产品",@"icon_right":@"icon_more"},
                        @{@"title":@"客户",@"icon":@"icon_jiage",@"content":@"标记承担金额",@"icon_right":@"cancel"}],
                    @[@{@"title":@"结单日期",@"icon":@"sale_icon_riqi",@"content":@"2015-03-11",@"icon_right":@"icon_more"}]
                    ];
}

#pragma mark tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tableArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *addCellID = @"addCellID";
    AddChanceCell *addCell = (AddChanceCell *)[tableView dequeueReusableCellWithIdentifier:addCellID];
    if (addCell == nil) {
        addCell = [[AddChanceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addCellID];
    }
    NSDictionary *temDic = [_tableArray[indexPath.section] objectAtIndex:indexPath.row];
    addCell.cellImage.image = [self origionalImage:[temDic objectForKey:@"icon"]];
    addCell.cellLabel.text= [temDic objectForKey:@"content"];
    [addCell.cellLabel sizeToFit];
    addCell.arrowImage.image = [self origionalImage:[temDic objectForKey:@"icon_right"]];
    addCell.backgroundColor = UIColorFromHex(0xf0f0f0);
    return addCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self hideKeyBoard];
    switch (indexPath.section) {
        case 0:         //客户
        {
        
        }
            break;
        case 1:         //联系人
        {
            
        }
            break;
        case 2:         //产品与报价
        {
            if (indexPath.row == 0) {           //销售产品
                SaleProductVC *productVC = [[SaleProductVC alloc]init];
                [self.navigationController pushViewController:productVC animated:YES];
            }else{                              //承担金额
                
            }
        }
            break;
        case 3:         //结单日期
        {
            
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 50;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 30)];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 80, 20)];
    label.textColor = [UIColor blackColor];
    label.font = Font(14);
    label.text = [[_tableArray[section] objectAtIndex:0] objectForKey:@"title"];
    [label sizeToFit];
    
    [backView addSubview:label];
    return backView;
}

#pragma mark collectionView delegate 
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _stepArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AddCollectionCell *addCell = (AddCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:Add_CellID forIndexPath:indexPath];
    addCell.label.text = _stepArray[indexPath.row];
    [addCell.label sizeToFit];
    return addCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self hideKeyBoard];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Screen_Width - 20, 80);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _headCollectionView) {
        NSInteger index = (int)scrollView.contentOffset.x / (int)(Screen_Width - 20);
        [_pageControl changeImage:index];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self hideKeyBoard];
}

#pragma mark textField delegate 
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)hideKeyBoard{
    if ([_headTextField isFirstResponder]) {
        [_headTextField resignFirstResponder];
    }
}

- (void)addChancePop{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addChanceSave{
    SKLog(@"addChanceSave");
}

- (IBAction)deleteChanceBtn:(UIButton *)sender {
    
    SKLog(@"deleteChanceBtn");
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
