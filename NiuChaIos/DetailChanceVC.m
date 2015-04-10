//
//  DetailChanceVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/31.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "DetailChanceVC.h"

#import "AddCollectionCell.h"
#import "MyPageControl.h"
#import "SaleProductVC.h"
#import "AddChanceVC.h"
#import "NewRichengVC.h"
#import "RichengListVC.h"
#import "GenJinRecordVC.h"

#define Detail_Collection_CellID   @"detailCollectionCellID"

@interface DetailChanceVC ()<
UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,
UITableViewDataSource,UITableViewDelegate,
UIActionSheetDelegate
>

@property (strong, nonatomic) IBOutlet UITableView *detailTableView;
@property(strong,nonatomic) NSArray *tableArray;

@property (strong, nonatomic) IBOutlet UIView *tableHeadView;                      //tableview headview
@property (strong, nonatomic) IBOutlet UIButton *tableHeadSuccessBtn;              //tableviewheadview 成功按钮
@property (strong, nonatomic) IBOutlet UIButton *tableHeadFailBtn;                 //tableviewheadview 失败按钮
@property (strong, nonatomic) IBOutlet UIView *tableFootView;
@property (strong, nonatomic) UISegmentedControl *segMentControl;

@property (strong, nonatomic) IBOutlet UILabel *companyNameLabel;                  //tableviewhead 公司名称
@property (strong, nonatomic) IBOutlet UILabel *contactPeopleLabel;                //tableviewhead 公司联系人
@property (strong, nonatomic) IBOutlet UICollectionView *headCollectionView;       //tableviewhead 公司名称
@property (strong, nonatomic) IBOutlet UILabel *tableHeadTitle;
@property(strong,nonatomic) MyPageControl *pageControl;

@property(strong,nonatomic) NSArray *colllectionArray;

@end

@implementation DetailChanceVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"DetailChanceVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self detailInitialize];
    
}

- (void)detailInitialize{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setNavLeftBtnTitle:@"销售机会" image:@"icon_back" andSelector:@selector(detailBack)];
    [self setNavRightBtnTitle:@"" image:@"sale_icon_edit" andSelector:@selector(editBtnAction)];
    
    _colllectionArray = @[@"首次登陆",@"二次登陆",@"洽谈",@"成交"];
    
    _tableHeadView = [[[NSBundle mainBundle]loadNibNamed:@"detailTableHeadView" owner:self options:nil]lastObject];
    _detailTableView.tableHeaderView = _tableHeadView;
    _detailTableView.backgroundColor = UIColorFromHex(0xf2f2f2);
    
    UIView *addCallView = [[[NSBundle mainBundle]loadNibNamed:@"detailAddAndCall" owner:self options:nil]lastObject];
    addCallView.center = CGPointMake(Screen_Width / 2.0, Screen_Height - 30 - 64);
    addCallView.layer.cornerRadius = 20.f;
    addCallView.layer.borderWidth = 0.5f;
    addCallView.layer.borderColor = UIColorFromHex(0xe2e2e2).CGColor;
    [self.view addSubview:addCallView];
    
    [_tableHeadSuccessBtn setBackgroundImage:[self origionalImage:@"sale_btn_chengjiao_pressed"] forState:UIControlStateHighlighted];
    [_tableHeadFailBtn setBackgroundImage:[self origionalImage:@"sale_btn_shibai_pressed"] forState:UIControlStateHighlighted];
    
    [_headCollectionView registerClass:[AddCollectionCell class] forCellWithReuseIdentifier:Detail_Collection_CellID];
    _headCollectionView.layer.borderWidth = 0.5f;
    _headCollectionView.layer.borderColor = UIColorFromHex(0xe2e2e2).CGColor;
    _pageControl = [[MyPageControl alloc]initWithFrame:CGRectMake(0, 98, Screen_Width, 4) pageCount:_colllectionArray.count];
    [_pageControl changeImage:0];
    [_tableHeadView addSubview:_pageControl];
    
    
}

#pragma mark tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_tableArray.count) {
        return _tableArray.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_tableArray.count) {
        
    }else{
        static NSString *cellID = @"detailCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            
            UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(30, 0, Screen_Width - 60, 50)];
            backView.backgroundColor = [UIColor whiteColor];
            
            [cell addSubview:backView];
            
            UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, Screen_Width - 100, 40)];
            contentLabel.backgroundColor = [UIColor whiteColor];
            contentLabel.tag = 100;
            contentLabel.adjustsFontSizeToFitWidth = YES;
            contentLabel.font = Font(Font_Size_12);
            contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
            contentLabel.numberOfLines = 0;
            [cell addSubview:contentLabel];
        }
        
        UILabel *contentLabel = (UILabel *)[cell viewWithTag:100];
        contentLabel.text = @"你还没有跟进客户，马上制定一个工作计划吧";
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_tableArray.count) {
        
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 44)];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(10, 7, 20, 20)];
    title.text = @"规划";
    title.font = Font(Font_Size_12);
    [title sizeToFit];
    [backView addSubview:title];
    
    return backView;
}
#pragma mark collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _colllectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AddCollectionCell *detailCell = [collectionView dequeueReusableCellWithReuseIdentifier:Detail_Collection_CellID forIndexPath:indexPath];
    detailCell.label.text = _colllectionArray[indexPath.row];
    [detailCell sizeToFit];
    return detailCell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Screen_Width, 60);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _headCollectionView) {
        NSInteger index = (int)scrollView.contentOffset.x / (int)Screen_Width;
        [_pageControl changeImage:index];
    }
}
- (IBAction)tableHeadFailOrSuccessBtn:(UIButton *)sender {
    
    if (sender.tag == 110) {                //success
        SKLog(@"110");
    }else if (sender.tag == 120){           //fail
        SKLog(@"120");
    }
}

- (IBAction)addOrCallBtnAction:(UIButton *)sender {
    
    if (sender.tag == 130) {
        SKLog(@"130");
        
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"跟进纪录",@"日程",@"拍照",@"录音", nil];
        [actionSheet showInView:self.view];
        
    }else if (sender.tag == 140){
        SKLog(@"140");
    }
}

#pragma mark actionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIViewController *controller = nil;
    switch (buttonIndex) {
        case 0:             //跟进纪录
        {
            SKLog(@"0");
            controller = [[GenJinRecordVC alloc]init];
        }
            break;
        case 1:             //日程
        {
            SKLog(@"1");
            controller = [[RichengListVC alloc]init];
        }
            break;
        case 2:             //拍照
        {
            SKLog(@"2");
        }
            break;
        case 3:             //录音
        {
            SKLog(@"3");
        }
            break;
        case 4:             //取消
        {
            SKLog(@"4");
        }
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark 返回上一个页面
- (void)detailBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 导航栏又按钮操作
- (void)editBtnAction{
    
    AddChanceVC *editChanceVC = [[AddChanceVC alloc]init];
    editChanceVC.editVC = YES;
    [self.navigationController pushViewController:editChanceVC animated:YES];
    SKLog(@"editBtnAction");
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
