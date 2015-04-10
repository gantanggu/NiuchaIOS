//
//  SaleProductVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/1.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "SaleProductVC.h"

#import "ProductsCollectionCell.h"


#define Selected_CellID     @"selectedCell"
#define Products_CellID     @"productsCell"

@interface SaleProductVC ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *collectionHeightCons;

@property (strong, nonatomic) IBOutlet UICollectionView *selectedCollectionView;


@property (strong, nonatomic) IBOutlet UICollectionView *productCollectionView;


@property(strong,nonatomic) NSMutableArray *selectArray;
@property(strong,nonatomic) NSArray *productsArray;


@end

@implementation SaleProductVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"SaleProductVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self productVCInitialize];
}

- (void)productVCInitialize{
    
    _selectArray = [NSMutableArray arrayWithArray:@[@{@"icon":@"",@"title":@"商务卫士",@"showBtn":@"NO"},
                                                    @{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"},
                                                    @{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"},
                                                    @{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"},
                                                    @{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"},
                                                    @{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"},
                                                    @{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"},
                                                    @{@"icon":@"",@"title":@"秀客",@"showBtn":@"YES"}]];
                    
                    
    _productsArray = @[@{@"icon":@"",@"title":@"商务卫士",@"showBtn":@"NO"},@{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"},
                       @{@"icon":@"",@"title":@"微堂",@"showBtn":@"NO"},@{@"icon":@"",@"title":@"魔zhan",@"showBtn":@"NO"}];
    
    
    [self setNavLeftBtnTitle:@"产品" image:@"icon_back" andSelector:@selector(salePopToLastVC)];
    
    [_selectedCollectionView  registerClass:[ProductsCollectionCell class] forCellWithReuseIdentifier:Selected_CellID];
    [_productCollectionView registerClass:[ProductsCollectionCell class] forCellWithReuseIdentifier:Products_CellID];
    _selectedCollectionView.layer.cornerRadius = 5.f;
    _selectedCollectionView.layer.borderColor = [UIColorFromHex(0xe7e7e7) CGColor];
    _selectedCollectionView.layer.borderWidth = 1.f;
    [self changeSelectProductsCollectionConstrait];
    
}


#pragma mark collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == _selectedCollectionView) {
        return _selectArray.count;
    }else{
        return _productsArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _selectedCollectionView) {
        ProductsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Selected_CellID forIndexPath:indexPath];
        NSDictionary *temDic = _selectArray[indexPath.row];
        cell.cellName.text = [temDic objectForKey:@"title"];
        if ([[temDic objectForKey:@"showBtn"] boolValue]) {
            cell.cellName.backgroundColor= [UIColor whiteColor];
            cell.cellImage.image = [self origionalImage:@"xinjian"];
            [cell.cellBtn setImage:[self origionalImage:@""] forState:UIControlStateNormal];
            cell.cellBtn.userInteractionEnabled = NO;
        }else{
            cell.cellName.backgroundColor = [UIColor orangeColor];
            cell.cellBtn.backgroundColor = [UIColor clearColor];
            cell.cellImage.image = [self origionalImage:@""];
            [cell.cellBtn setImage:[self origionalImage:@"cancel_chanpin"] forState:UIControlStateNormal];
            cell.cellBtn.userInteractionEnabled = YES;
             cell.cellBtn.btnIndex = indexPath;
            [cell.cellBtn addTarget:self action:@selector(deleteProduct:) forControlEvents:UIControlEventTouchUpInside];
        }
        return cell;
    }else{
        ProductsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Products_CellID forIndexPath:indexPath];
        NSDictionary *temDic = _productsArray[indexPath.row];
        cell.cellName.text = [temDic objectForKey:@"title"];
        cell.cellName.backgroundColor = [UIColor whiteColor];
        cell.cellBtn.userInteractionEnabled = NO;
        cell.cellImage.image = [self origionalImage:@""];
        return cell;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(90, 36);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _selectedCollectionView) {
        SKLog(@"_selectedCollectionView");
    }else{
        SKLog(@"productCollectionView");
         NSInteger locatin = 0;
        if (_selectArray.count == 0) {
            locatin = 0;
        }else{
            locatin = _selectArray.count - 1;
        }
        [_selectArray addObject:@{@"icon":@"",@"title":@"秀客",@"showBtn":@"NO"}];
        [self changeSelectProductsCollectionConstrait];
        
        [_selectedCollectionView performBatchUpdates:^{
            [_selectedCollectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:locatin inSection:0]]];
        } completion:^(BOOL finished) {
            [_selectedCollectionView reloadData];
        }];
    }
}

- (void)changeSelectProductsCollectionConstrait{
    if (_selectArray.count > 3) {
        [_selectedCollectionView removeConstraint:_collectionHeightCons];
        if (_selectArray.count % 3 > 0) {
            float hight = (_selectArray.count/3 + 1)*46;
            if (hight < 300) {
                NSLayoutConstraint *widthCon = [NSLayoutConstraint constraintWithItem:_selectedCollectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:(_selectArray.count/3 + 1)*46];
                _collectionHeightCons = widthCon;
                [_selectedCollectionView addConstraint:widthCon];
            }else{
                [_selectedCollectionView scrollsToTop];
//                [_selectedCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_selectArray.count inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
            }
        }else{
            float hight = (_selectArray.count/3)*46;
            if (hight < 300) {
                NSLayoutConstraint *widthCon = [NSLayoutConstraint constraintWithItem:_selectedCollectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:(_selectArray.count/3)*46];
                _collectionHeightCons = widthCon;
                [_selectedCollectionView addConstraint:widthCon];
            }else{
                [_selectedCollectionView scrollsToTop];
//                [_selectedCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_selectArray.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
            }
        }
        [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)deleteProduct:(ProductButton *)sender{
    SKLog(@"%ld",sender.btnIndex.row);
    NSMutableArray *temArray = [NSMutableArray arrayWithArray:_selectArray];
    
    [temArray removeObjectAtIndex:sender.btnIndex.row];
    [_selectArray removeAllObjects];
    [_selectArray addObjectsFromArray:temArray];
    
    [self changeSelectProductsCollectionConstrait];

    [_selectedCollectionView performBatchUpdates:^{
        [_selectedCollectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:sender.btnIndex.row inSection:0]]];
    } completion:^(BOOL finished) {
        [_selectedCollectionView reloadData];
    }];
}

- (void)salePopToLastVC{
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
