//
//  HomeVC.m
//  NiuChaIos
//
//  Created by SharkCome on 15/3/26.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "HomeVC.h"

#import "SettingVC.h"
#import "SaleFunnelVC.h"
#import "MyTeamVC.h"
#import "FeedBackVC.h"
#import "PartnerConnectVC.h"

#import "HomeButton.h"
#import "MyCollectionCell.h"
#import "myTableViewCell.h"
#import "RightTableViewCell.h"

#define Scale_In_L    0.75
#define Scale_Out   1.0
#define Translate_L_X  200

#define Scale_In_R      0.85
#define Transelate_R_X  -120

typedef NS_ENUM(NSInteger, CollectionViewType){
    CollectionView_ManyBusiness,
    CollectionView_ImplementBusiness,
    CollectionView_TeamManger
};

//@implementation HomeButton
//
//
//- (CGRect)imageRectForContentRect:(CGRect)contentRect{
//    return CGRectMake(0, 42, Screen_Width/3.0 + 1, 2);
//}
//
//- (CGRect)titleRectForContentRect:(CGRect)contentRect{
//    return CGRectMake(0, 0, (Screen_Width - 20)/3, 40);
//}
//
//@end

@interface HomeVC ()
<
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UITableViewDataSource,
UITableViewDelegate
>
@property (strong, nonatomic) IBOutlet UIView *manyBusView;
@property (strong, nonatomic) IBOutlet UICollectionView *manyBusCollectionView;

@property (strong, nonatomic) IBOutlet UIView *implementView;
@property (strong, nonatomic) IBOutlet UICollectionView *implementCollectionView;

@property (strong, nonatomic) IBOutlet UIView *teamMangerView;
@property (strong, nonatomic) IBOutlet UICollectionView *teamCollectionView;

@property (strong, nonatomic) IBOutlet UIView *leftSideView;
@property (strong, nonatomic) IBOutlet UITableView *sideTableView;

@property (strong, nonatomic) IBOutlet UIView *tableHeadView;
@property (strong, nonatomic) IBOutlet UILabel *headViewName;
@property (strong, nonatomic) IBOutlet UILabel *headViewPosition;
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;

@property (strong, nonatomic) IBOutlet UIView *rightSideView;
@property (strong, nonatomic) IBOutlet UITableView *rightTableView;

@property (strong, nonatomic) IBOutlet UIView *buttonsView;
@property (strong, nonatomic) IBOutlet HomeButton *manyBusButton;
@property (strong, nonatomic) IBOutlet HomeButton *implementBusButton;
@property (strong, nonatomic) IBOutlet HomeButton *teamMangerButton;
@property(strong,nonatomic) HomeButton *lastSelectBtn;                     //上一次选择的按钮


@property(strong,nonatomic) UIView *lastView;

@property(assign,nonatomic) BOOL showLeftSideView;                          //sideview隐藏出现标志
@property(assign,nonatomic) BOOL showRightSideView;                         //right view 标志
@property(assign,nonatomic) CollectionViewType viewTpye;                    //当前所显示的collection view

@property(strong,nonatomic) NSArray *manyBusArray;                          //海量业务icon，title数组
@property(strong,nonatomic) NSArray *implementArray;                        //开展业务icon，title数组
@property(strong,nonatomic) NSArray *teamMangerArray;                       //团队管理icon，title数组
@property(strong,nonatomic) NSArray *sideTableArray;                        //左边侧滑视图数组
@property(strong,nonatomic) NSArray *rightTableArray;                       //右边侧滑视图数组


@property(strong,nonatomic) UITapGestureRecognizer *tapGesture;             //点击手势，隐藏sideview
@property(strong,nonatomic) UISwipeGestureRecognizer *swipeGesture;         //横扫收拾，隐藏sideview

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addManyBusView];
    [self initnalData];
    [self setNavRightBtn];
    [self buttonsViewSet];
    
    
    SKLog(@"123");
//    self.edgesForExtendedLayout = UIRectEdgeNone;
  
}

- (void)viewWillDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initnalData{
    
    _viewTpye = CollectionView_ManyBusiness;
    _showLeftSideView = NO;
    _showRightSideView = NO;
    
    _manyBusArray = @[@{@"icon_N":@"zidongzhaokehu_normal",@"title":@"自动找客户",@"icon_P":@"zidongzhaokehu_pressed"},
                      @{@"icon_N":@"antiaojianjiansuo_normal",@"title":@"按条件检索",@"icon_P":@"antiaojianjiansuo_pressed"},
                      @{@"icon_N":@"tuanduigonghai_normal",@"title":@"团队领取",@"icon_P":@"tuanduigonghai_pressed"},
                      @{@"icon_N":@"wajuelaokehu_normal",@"title":@"挖掘老客户",@"icon_P":@"wajuelaokehu_pressed"},
                      @{@"icon_N":@"weituo_normal",@"title":@"委托完善",@"icon_P":@"weituo_pressed"}];
    _implementArray = @[@{@"icon_N":@"kaolvgenjin_normal",@"title":@"考虑跟进",@"icon_P":@"kaolvgenjin_pressed"},
                        @{@"icon_N":@"xiaoshouloudou_normal",@"title":@"销售漏斗",@"icon_P":@"xiaoshouloudou_pressed"},
                        @{@"icon_N":@"kehu_normal",@"title":@"我的客户",@"icon_P":@"kehu_pressed"},
                        @{@"icon_N":@"lianxiren_normal",@"title":@"联系人",@"icon_P":@"lianxiren_pressed"},
                        @{@"icon_N":@"yunpan_normal",@"title":@"云盘",@"icon_P":@"yunpan_pressed"}];
    _teamMangerArray = @[@{@"icon_N":@"tuanduichengyuan_normal",@"title":@"自动找客户",@"icon_P":@"tuanduichengyuan_pressed"},
                         @{@"icon_N":@"genjindongtai_normal",@"title":@"按条件检索",@"icon_P":@"genjindongtai_pressed"},
                         @{@"icon_N":@"gonzuohuibao_normal",@"title":@"团队领取",@"icon_P":@"gonzuohuibao_pressed"},
                         @{@"icon_N":@"baobiao_normal",@"title":@"挖掘老客户",@"icon_P":@"baobiao_pressed"}];
    
    _sideTableArray = @[
                        @{@"icon":@"icon_gongsi",@"title":@"公司",@"subTitle":@"厦门258集团"},
                        @{@"icon":@"icon_shezhi",@"title":@"系统设置",@"subTitle":@""},
                        @{@"icon":@"icon_yijianfankui",@"title":@"意见反馈",@"subTitle":@""},
                        @{@"icon":@"icon_fenxiang",@"title":@"分享给好友",@"subTitle":@""},
                        @{@"icon":@"icon_tuichu",@"title":@"退出",@"subTitle":@""}];
    
    _rightTableArray = @[@{@"icon":@"you_hua_genjinjilu",@"title":@"纪录"},
                         @{@"icon":@"you_hua_paizhao",@"title":@"拍照"},
                         @{@"icon":@"you_hua_luyin",@"title":@"录音"},
                         @{@"icon":@"you_hua_richeng",@"title":@"日程"},
                         @{@"icon":@"you_hua_saoyisao",@"title":@"扫一扫"},
                         @{@"icon":@"you_hua_kehu",@"title":@"客户"},
                         @{@"icon":@"you_hua_lianxiren",@"title":@"联系人"},
                         @{@"icon":@"you_hua_daoru",@"title":@"导入"}];
   
     _tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToHideSideView)];
    _swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeToHideSideView)];
    
}

/*               添加各个视图            */
- (void) addManyBusView{
    _manyBusView = [[[NSBundle mainBundle]loadNibNamed:@"manyBusView" owner:self options:nil]lastObject];
    _manyBusView.frame = CGRectMake(0, 108, Screen_Width, Screen_Height - 108);
    [self.view addSubview:_manyBusView];
    [_manyBusCollectionView registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:@"CELL"];
    _lastView = _manyBusView;
}

- (void)addImplementView{
    _implementView = [[[NSBundle mainBundle]loadNibNamed:@"kaiZhanYeWuView" owner:self options:nil] lastObject];
    _implementView.frame = CGRectMake(0, 108, Screen_Width, Screen_Height - 108);
    [self.view addSubview:_implementView];
    
    [_implementCollectionView registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:@"CELL"];
}

- (void)addTeamMangerView{
    
    _teamMangerView = [self loadNib:@"teamMangerView" owner:self];
    _teamMangerView.frame = CGRectMake(0, 108, Screen_Width, Screen_Height - 108);
    [self.view addSubview:_teamMangerView];
    
    [_teamCollectionView registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:@"CELL"];
}
- (void)addLeftSideView{
    _leftSideView = [[[NSBundle mainBundle]loadNibNamed:@"leftSideView" owner:self options:nil]lastObject];
    _leftSideView.frame = CGRectMake(-220, 20, 220, Screen_Height - 20);
    
    _sideTableView.backgroundColor = UIColorFromHex(0x181f22);
    _sideTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_leftSideView];
}

- (void)addRightSideView{
    _rightSideView = [[[NSBundle mainBundle]loadNibNamed:@"rightSideView" owner:self options:nil]lastObject];
    _rightSideView.frame = CGRectMake(Screen_Width, 20, 100, Screen_Height - 20);
    
    _rightTableView.backgroundColor = UIColorFromHex(0x181f22);
    _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_rightSideView];
}

- (void)buttonsViewSet{
    [_manyBusButton setImage:[self origionalImage:@"bg_nav_1"] forState:UIControlStateNormal];
    [_manyBusButton setTitleColor:UIColorFromHex(0xF96700) forState:UIControlStateNormal];
    _manyBusButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _lastSelectBtn = _manyBusButton;
    
    [_implementBusButton setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_implementBusButton setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    _implementBusButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [_teamMangerButton setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_teamMangerButton setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    _teamMangerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
}
#pragma mark 显示左边视图
- (void)showLeftView:(UIBarButtonItem *)sender {
    
    if (!_showLeftSideView) {
        [self addLeftSideView];
        [self showLeftSideView];
    
        _showLeftSideView = YES;
    }else{
        [self hideLeftSideView];
        _showLeftSideView = NO;
    }
    
}
#pragma mark 手势操作隐藏左边视图
- (void)tapToHideSideView{
    if (_showLeftSideView) {
        [self hideLeftSideView];
    }else{
        [self hideRightSideView];
    }
}

- (void)swipeToHideSideView{
    if (_showLeftSideView) {
        [self hideLeftSideView];
    }else{
        [self hideRightSideView];
    }
}

#pragma mark 显示，隐藏左边视图
- (void)showLeftSideView{
    
    SKLog(@"self.view.frame.size.height--------%f",self.view.frame.size.height);
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        _lastView.transform = CGAffineTransformIdentity;
        _lastView.transform = CGAffineTransformTranslate(_lastView.transform, Translate_L_X, 0);
        _lastView.transform = CGAffineTransformScale(_lastView.transform, Scale_In_L, Scale_In_L);
        
        _leftSideView.transform = CGAffineTransformIdentity;
        _leftSideView.transform = CGAffineTransformTranslate(_leftSideView.transform, 220, 0);
//
        _buttonsView.transform = CGAffineTransformIdentity;
        _buttonsView.transform = CGAffineTransformTranslate(_buttonsView.transform, Translate_L_X, (Screen_Height - 64)*(1 - Scale_In_L)*0.5);
        _buttonsView.transform = CGAffineTransformScale(_buttonsView.transform, Scale_In_L, Scale_In_L);
//
        self.navigationController.navigationBar.transform = CGAffineTransformIdentity;
        self.navigationController.navigationBar.transform = CGAffineTransformTranslate(self.navigationController.navigationBar.transform, Translate_L_X, (Screen_Height + 20) *(1 - Scale_In_L)*0.5);
        self.navigationController.navigationBar.transform = CGAffineTransformScale(self.navigationController.navigationBar.transform, Scale_In_L, Scale_In_L);

        
    } completion:^(BOOL finished) {
        _showLeftSideView = YES;
        _swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        [_lastView setGestureRecognizers:@[_swipeGesture,_tapGesture]];
        _manyBusButton.userInteractionEnabled = NO;
        _buttonsView.gestureRecognizers = @[_swipeGesture,_tapGesture];
         self.navigationController.navigationBar.gestureRecognizers = @[_swipeGesture,_tapGesture];
    }];
}

- (void)hideLeftSideView{
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        _lastView.transform = CGAffineTransformIdentity;
        _lastView.transform = CGAffineTransformTranslate(_lastView.transform, 0, 0);
        _lastView.transform = CGAffineTransformScale(_lastView.transform, Scale_Out, Scale_Out);
        
        _leftSideView.transform = CGAffineTransformIdentity;
        _leftSideView.transform = CGAffineTransformTranslate(_leftSideView.transform, -Screen_Width, 0);
        
        _buttonsView.transform = CGAffineTransformIdentity;
        _buttonsView.transform = CGAffineTransformTranslate(_buttonsView.transform, 0, 0);
        _buttonsView.transform = CGAffineTransformScale(_buttonsView.transform, Scale_Out, Scale_Out);
        
        self.navigationController.navigationBar.transform = CGAffineTransformIdentity;
        self.navigationController.navigationBar.transform = CGAffineTransformTranslate(self.navigationController.navigationBar.transform, 0, 0);
        self.navigationController.navigationBar.transform = CGAffineTransformScale(self.navigationController.navigationBar.transform, Scale_Out, Scale_Out);
       
        
    } completion:^(BOOL finished) {
        _showLeftSideView = NO;
        [_lastView removeGestureRecognizer:_swipeGesture];
        [_lastView removeGestureRecognizer:_tapGesture];
        
        [_buttonsView removeGestureRecognizer:_tapGesture];
        [_buttonsView removeGestureRecognizer:_swipeGesture];
        _manyBusButton.userInteractionEnabled = YES;
        [self.navigationController.navigationBar removeGestureRecognizer:_swipeGesture];
        [self.navigationController.navigationBar removeGestureRecognizer:_tapGesture];
    }];

}

- (IBAction)buttonViewAction:(HomeButton *)sender {
    
    if (_lastView) {
        [_lastView removeFromSuperview];
        _lastView = nil;
    }
    
    [_lastSelectBtn setImage:[self origionalImage:@"bg_nav_2"] forState:UIControlStateNormal];
    [_lastSelectBtn setTitleColor:UIColorFromHex(0x626262) forState:UIControlStateNormal];
    
    [sender setImage:[self origionalImage:@"bg_nav_1"] forState:UIControlStateNormal];
    [sender setTitleColor:UIColorFromHex(0xF96700) forState:UIControlStateNormal];
    _lastSelectBtn = sender;
    
    if (sender.tag == 110) {
        NSLog(@"100");
        
        [self addManyBusView];
        _lastView = _manyBusView;
        _viewTpye = CollectionView_ManyBusiness;
    }else if (sender.tag == 111){
        NSLog(@"111");
        
        [self addImplementView];
        _lastView = _implementView;
        _viewTpye = CollectionView_ImplementBusiness;
        
    }else if (sender.tag == 112){
        NSLog(@"112");
        [self addTeamMangerView];
        _lastView = _teamMangerView;
        _viewTpye = CollectionView_TeamManger;
    }

}

#pragma mark 设置导航栏又按钮
-(void)setNavRightBtn{
    
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc]initWithImage:[self origionalImage:@"niucha"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView:)];
    
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    UIBarButtonItem *addBarBtn = [[UIBarButtonItem alloc]initWithImage:[self origionalImage:@"kuaijie"] style:UIBarButtonItemStylePlain target:self action:@selector(addBtnAction:)];
    addBarBtn.tag = 120;
    UIBarButtonItem *richengBarBtn = [[UIBarButtonItem alloc]initWithImage:[self origionalImage:@"richeng"] style:UIBarButtonItemStylePlain target:self action:@selector(addBtnAction:)];
    richengBarBtn.tag = 121;
    UIBarButtonItem *searchBarBtn = [[UIBarButtonItem alloc]initWithImage:[self origionalImage:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(addBtnAction:)];
    searchBarBtn.tag = 122;
    
    self.navigationItem.rightBarButtonItems = @[addBarBtn,richengBarBtn,searchBarBtn];
}


/*            导航栏有按钮方法实现            */
- (void)addBtnAction:(UIBarButtonItem *)sender{
    if (sender.tag == 120) {           //快捷
        SKLog(@"120");
        
        if (_showRightSideView) {
            _showRightSideView = NO;
            [self hideRightSideView];
        }else{
             _showRightSideView = YES;
            [self addRightSideView];
            [self showRightSideView];
        }
    }else if (sender.tag == 121){      //日程
        SKLog(@"121");
    }else if (sender.tag == 122){       //搜索
        SKLog(@"122");
    }
}


#pragma mark 显示右边侧滑菜单
- (void)showRightSideView{
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        
        _lastView.transform = CGAffineTransformIdentity;
        _lastView.transform = CGAffineTransformTranslate(_lastView.transform, Transelate_R_X, 0);
        _lastView.transform = CGAffineTransformScale(_lastView.transform, Scale_In_R, Scale_In_R);
        
        _rightSideView.transform = CGAffineTransformIdentity;
        _rightSideView.transform = CGAffineTransformTranslate(_rightSideView.transform, -100, 0);
        
        _buttonsView.transform= CGAffineTransformIdentity;
        _buttonsView.transform = CGAffineTransformTranslate(_buttonsView.transform, Transelate_R_X, (Screen_Height - 64)*(1 - Scale_In_R)*0.5);
        _buttonsView.transform = CGAffineTransformScale(_buttonsView.transform, Scale_In_R, Scale_In_R);
        
        self.navigationController.navigationBar.transform = CGAffineTransformIdentity;
        self.navigationController.navigationBar.transform = CGAffineTransformTranslate(self.navigationController.navigationBar.transform, Transelate_R_X, (Screen_Height + 20)*(1 - Scale_In_R)*0.5);
        self.navigationController.navigationBar.transform = CGAffineTransformScale(self.navigationController.navigationBar.transform, Scale_In_R, Scale_In_R);
        
    } completion:^(BOOL finished) {
        _showRightSideView = YES;
        _swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
        [_lastView setGestureRecognizers:@[_tapGesture,_swipeGesture]];
        [_buttonsView setGestureRecognizers:@[_tapGesture,_swipeGesture]];
        _implementBusButton.userInteractionEnabled = NO;
        _teamMangerButton.userInteractionEnabled = NO;
        [self.navigationController.navigationBar setGestureRecognizers:@[_tapGesture,_swipeGesture]];

    }];
}

- (void)hideRightSideView{
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
        _lastView.transform = CGAffineTransformIdentity;
        _lastView.transform = CGAffineTransformTranslate(_lastView.transform, 0, 0);
        _lastView.transform = CGAffineTransformScale(_lastView.transform, Scale_Out, Scale_Out);
        
        _rightSideView.transform = CGAffineTransformIdentity;
        _rightSideView.transform = CGAffineTransformTranslate(_rightSideView.transform, 0, 0);
        
        _buttonsView.transform = CGAffineTransformIdentity;
        _buttonsView.transform = CGAffineTransformTranslate(_buttonsView.transform, 0, 0);
        _buttonsView.transform = CGAffineTransformScale(_buttonsView.transform, Scale_Out, Scale_Out);
        
        self.navigationController.navigationBar.transform = CGAffineTransformIdentity;
        self.navigationController.navigationBar.transform = CGAffineTransformTranslate(self.navigationController.navigationBar.transform, 0, 0);
        self.navigationController.navigationBar.transform = CGAffineTransformScale(self.navigationController.navigationBar.transform, Scale_Out, Scale_Out);
    } completion:^(BOOL finished) {
        _showRightSideView = NO;
        [_lastView removeGestureRecognizer:_tapGesture];
        [_lastView removeGestureRecognizer:_swipeGesture];
        [_buttonsView removeGestureRecognizer:_tapGesture];
        [_buttonsView removeGestureRecognizer:_swipeGesture];
        _implementBusButton.userInteractionEnabled = YES;
        _teamMangerButton.userInteractionEnabled = YES;
        [self.navigationController.navigationBar removeGestureRecognizer:_tapGesture];
        [self.navigationController.navigationBar removeGestureRecognizer:_swipeGesture];
    }];
}

/*       collectionView delegate        */

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_viewTpye == CollectionView_ManyBusiness) {
        return _manyBusArray.count;
    }else if(_viewTpye == CollectionView_ImplementBusiness){
        return _implementArray.count;
    }else{
        return _teamMangerArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    NSDictionary *temDic = nil;
    switch (_viewTpye) {
        case CollectionView_ManyBusiness:
        {
            temDic = _manyBusArray[indexPath.row];
        }
            break;
        case CollectionView_ImplementBusiness:
        {
            temDic = _implementArray[indexPath.row];
        }
            break;
        case CollectionView_TeamManger:
        {
            temDic = _teamMangerArray[indexPath.row];
        }
            break;
        default:
            break;
    }
    cell.imageView.image = [UIImage imageNamed:[temDic objectForKey:@"icon_N"]];
    cell.label.text = [temDic objectForKey:@"title"];
    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SKLog(@"%@",indexPath);
    switch (_viewTpye) {
        case CollectionView_ManyBusiness:
        {
            switch (indexPath.row) {
                case 0:
                {
                
                }
                    break;
                case 1:
                {
                
                }
                    break;
                case 2:
                {
                    
                }
                    break;
                case 3:
                {
                    
                }
                    break;
                case 4:
                {
                    
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case CollectionView_ImplementBusiness:
        {
            switch (indexPath.row) {
                case 0:             //考虑跟进
                {
                
                }
                    break;
                case 1:             //销售漏斗
                {
                    SaleFunnelVC *saleFunnelVC = [[SaleFunnelVC alloc]init];
                    [self.navigationController pushViewController:saleFunnelVC animated:YES];
                }
                    break;
                case 2:             //我的客户
                case 3:             //联系人
                {
                    PartnerConnectVC *partnerVC = [[PartnerConnectVC alloc]init];
                    if (indexPath.row == 2) {
                        partnerVC.type = Partner_Customer;
                    }else{
                        partnerVC.type = Partner_Connection;
                    }
                    [self.navigationController pushViewController:partnerVC animated:YES];
                }
                    break;
                case 4:             //云盘
                {
                    
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case CollectionView_TeamManger:
        {
            switch (indexPath.row) {
                case 0:
                {
                
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                case 2:
                {
                    
                }
                    break;
                case 3:
                {
                    
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(30, (Screen_Width - 270)/4, 20, (Screen_Width - 270)/4);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(90, 110);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


/*          tableView delegate      */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_showRightSideView) {
        return _rightTableArray.count;
    }
    return _sideTableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_showRightSideView) {
        static NSString *cellID = @"rightTableViewCell";
        RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[RightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        NSDictionary *temDic = _rightTableArray[indexPath.row];
        cell.image.image = [self origionalImage:[temDic objectForKey:@"icon"]];
        cell.title.text = [temDic objectForKey:@"title"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *cellID = @"tableViewCellID";
        myTableViewCell *cell =(myTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[myTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        NSDictionary *temDic = _sideTableArray[indexPath.row];
        cell.image.image = [UIImage imageNamed:[temDic objectForKey:@"icon"]];
        cell.title.textColor = [UIColor whiteColor];
        cell.title.text = [temDic objectForKey:@"title"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor clearColor];
        cell.subTitle.text = [temDic objectForKey:@"subTitle"];
        if (indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 4) {
            cell.bottomLine.hidden = NO;
        }else{
            cell.bottomLine.hidden = YES;
        }
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!_showRightSideView) {
        _tableHeadView = [[[NSBundle mainBundle]loadNibNamed:@"headView" owner:self options:nil]lastObject];
        _tableHeadView.backgroundColor = UIColorFromHex(0x181f22);
        _headImageView.image = [self origionalImage:@"bg_touxiang"];
        return _tableHeadView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
   
    
    if (_showLeftSideView) {
         [self hideLeftSideView];
        switch (indexPath.row) {
            case 0:                     //公司
            {
                SKLog(@"0");
                MyTeamVC *teamVC = [[MyTeamVC alloc]init];
                [self.navigationController pushViewController:teamVC animated:YES];
                
            }
                break;
            case 1:                     //系统设置
            {
                SKLog(@"1");
                SettingVC *settingVC = [[SettingVC alloc]init];
                [self.navigationController pushViewController:settingVC animated:YES];
            }
                break;
            case 2:                     //意见反馈
            {
                SKLog(@"2");
                FeedBackVC *feedBackVC = [[FeedBackVC alloc]init];
                [self.navigationController pushViewController:feedBackVC animated:YES];
            }
                break;
            case 3:                     //分享给好友
            {
                SKLog(@"3");
            }
                break;
            case 4:                     //退出
            {
                SKLog(@"4");
            }
                break;
            default:
                break;
        }
    }else{
        [self hideRightSideView];
        switch (indexPath.row) {
            case 0:
            {
            
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                
            }
                break;
            case 3:
            {
                
            }
                break;
            case 4:
            {
                
            }
                break;
            case 5:
            {
                
            }
                break;
            case 6:
            {
                
            }
                break;
            case 7:
            {
                
            }
                break;
            default:
                break;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (!_showRightSideView) {
        return 140;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_showRightSideView) {
        return (Screen_Height - 20) / _rightTableArray.count;
    }
    return 51;
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
