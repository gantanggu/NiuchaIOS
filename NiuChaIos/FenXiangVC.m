//
//  FenXiangVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/27.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "FenXiangVC.h"
#import "FenXiangCell.h"


#define Collection_CellID    @"fenXiangCellID"

@interface FenXiangVC ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property(strong,nonatomic) NSArray *collectionArray;

@end

@implementation FenXiangVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"FenXiangVC"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fenXiangInitalize];
}

- (void) fenXiangInitalize{
    
    
    _collectionArray = @[@"icon_xinlang",@"icon_weixin",@"icon_qq",@"icon_pengyouquan",@"icon_duanxin",
                         @"icon_kaixinwang",@"icon_renren",@"icon_youjian"];
    
    [_collectionView registerClass:[FenXiangCell class] forCellWithReuseIdentifier:Collection_CellID];
}

#pragma mark collecitonview delegate 
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _collectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FenXiangCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Collection_CellID forIndexPath:indexPath];
    cell.celIImage.image = [self origionalImage:_collectionArray[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(75, 75);
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
