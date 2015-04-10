//
//  SaleFunnelVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/30.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "SaleFunnelVC.h"

#import "ConidtionalVC.h"
#import "MyPageControl.h"
#import "AddChanceVC.h"
#import "DetailChanceVC.h"

#import "SaleTableCell.h"
#import "CollectionViewCell.h"

#define Collection_CellID    @"collectionCellID"

@interface SaleFunnelVC ()
<
UITableViewDataSource,UITableViewDelegate,
UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
>

@property (strong, nonatomic) IBOutlet UITableView *titleTableView;
@property(assign,nonatomic) BOOL showTableView;                             //管道选择视图是否出现

@property (strong, nonatomic) IBOutlet UICollectionView *stepCollectionView;
@property(strong,nonatomic) MyPageControl *stepIndicator;
@property(strong,nonatomic) NSArray *stepArray;

@property (strong, nonatomic) IBOutlet UITableView *chanceTableView;
@property(strong,nonatomic) NSArray *chanceArray;

@property(strong,nonatomic) NSArray *titleTableArray;
@property(strong,nonatomic) UIButton *navTitleBtn;

@end

@implementation SaleFunnelVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = (SaleFunnelVC *)[self getViewControllerFromStoryboard:@"SaleFunnelVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setNavTitleView];
    [self initlizal];
    
}

- (void)initlizal{
    
    [self setNavLeftBtnTitle:@"" image:@"icon_back" andSelector:@selector(salePopToLastVC)];
    [self setNavRightBtnTitle:@"" image:@"icon_shaixuan" andSelector:@selector(rightBtnAction)];
    
    _titleTableArray = @[@"销售管道1",@"销售管道2",@"销售管道3",@"销售管道4"];
    _chanceArray = @[@{@"name":@"上海美龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美adsfgsdfasdfasd龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实qadfasdfasdfaas业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实业asdf有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"},
                     @{@"name":@"上海美龙",@"detailName":@"上海美龙实业有线公司",@"worker":@"禾苗",@"price":@"¥3000"}];
    
    _showTableView = NO;
    
    [_stepCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:Collection_CellID];
    _stepArray = @[@"首次访问",@"二次访问",@"洽谈",@"成交"];
    
    _stepIndicator = [[MyPageControl alloc]initWithFrame:CGRectMake(0, 64 - 6, Screen_Width, 6) pageCount:_stepArray.count];
    [_stepIndicator changeImage:0];
    [self.view addSubview:_stepIndicator];
}

- (void) setNavTitleView{
    
    _navTitleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _navTitleBtn.frame = CGRectMake(0, 0, 120, 40);
    _navTitleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 85, 0, 0);
    _navTitleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [_navTitleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_navTitleBtn setImage:[self origionalImage:@"xuanzesanjiao"] forState:UIControlStateNormal];
    [_navTitleBtn setTitle:@"销售管道1" forState:UIControlStateNormal];
    
    [_navTitleBtn addTarget:self action:@selector(showMoreSalePipeline) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _navTitleBtn;
}

- (void)showMoreSalePipeline{
    if (_showTableView) {
        
        [UIView animateKeyframesWithDuration:0.15 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
            _titleTableView.transform = CGAffineTransformIdentity;
            _titleTableView.transform = CGAffineTransformScale(_titleTableView.transform, 0, 0);
        } completion:^(BOOL finished) {
            _showTableView = NO;
            [_titleTableView removeFromSuperview];
        }];
        
    }else{
        _navTitleBtn.userInteractionEnabled = NO;
        _titleTableView = [[[NSBundle mainBundle]loadNibNamed:@"NavTitleView" owner:self options:nil] lastObject];
        _titleTableView.translatesAutoresizingMaskIntoConstraints = NO;
        _titleTableView.backgroundColor = UIColorFromHex(0x283039);
        _titleTableView.frame = CGRectMake((Screen_Width - 115) / 2.0, 0, 115, 44*_titleTableArray.count);
        _titleTableView.transform = CGAffineTransformIdentity;
        _titleTableView.transform = CGAffineTransformScale(_titleTableView.transform, 0, 0);
        [self.view addSubview:_titleTableView];
        [UIView animateKeyframesWithDuration:0.15 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
            _titleTableView.transform = CGAffineTransformIdentity;
            _titleTableView.transform = CGAffineTransformScale(_titleTableView.transform, 1, 1);
        } completion:^(BOOL finished) {
            _showTableView = YES;
            _navTitleBtn.userInteractionEnabled = YES;
        }];

    }
}

#pragma mark 导航栏左右按钮方法实现
- (void)salePopToLastVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnAction{
    SKLog(@"rightBtnAction");
    
    ConidtionalVC *conditionVC = [[ConidtionalVC alloc]init];
    [self.navigationController pushViewController:conditionVC animated:YES];
}

#pragma mark tableview delegate
/*            tableView delegate         */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _titleTableView) {
        return _titleTableArray.count;
    }else{
        return _chanceArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _titleTableView) {
        static NSString *cellID = @"saleCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.textLabel.text= _titleTableArray[indexPath.row];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = Font(16);
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellID = @"chanceCellID";
        SaleTableCell *saleCell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (saleCell == nil) {
            saleCell = [[SaleTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        NSDictionary *temDic = _chanceArray[indexPath.row];
        saleCell.comName.text = [temDic objectForKey:@"name"];
        [saleCell sizeToFit];
        saleCell.comDetailName.text = [temDic objectForKey:@"detailName"];
        saleCell.peopleName.text= [temDic objectForKey:@"worker"];
        saleCell.priceLabel.text = [temDic objectForKey:@"price"];
        saleCell.backgroundColor = [UIColor clearColor];
        if (indexPath.row == _chanceArray.count - 1) {
            saleCell.addBtn.hidden = NO;
            [saleCell.addBtn addTarget:self action:@selector(addSaleChance:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            saleCell.addBtn.hidden = YES;
        }
        return saleCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _titleTableView) {
        NSString *selectPipeline = _titleTableArray[indexPath.row];
        SKLog(@"selectPipeline = %@",selectPipeline);
        [_navTitleBtn setTitle:selectPipeline forState:UIControlStateNormal];
        [self showMoreSalePipeline];
    }else if (tableView == _chanceTableView){
        DetailChanceVC *detailVC = [[DetailChanceVC alloc]init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _titleTableView) {
        return 44;
    }else{
        return 80;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (tableView == _chanceTableView) {
        return 20;
    }else{
        return 0;
    }
}

- (void)addSaleChance:(UIButton *)sender{
    SKLog(@"addSaleChance");
    AddChanceVC *addChanceVC = [[AddChanceVC alloc]init];
    addChanceVC.editVC = NO;
    [self.navigationController pushViewController:addChanceVC animated:YES];
}

/*            collectionView   delegate          */
#pragma mark collectionview delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _stepArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Collection_CellID forIndexPath:indexPath];
    cell.titleLabel.text = _stepArray[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Screen_Width, 64);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        [_stepIndicator changeImage:(int)(scrollView.contentOffset.x / Screen_Width)];
    }

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
