//
//  ProductsCollectionCell.h
//  NiuChaIos
//
//  Created by SharkCome on 15/4/1.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductButton : UIButton

@property(strong,nonatomic) NSIndexPath *btnIndex;

@end


@interface ProductsCollectionCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *cellName;
@property (strong, nonatomic) IBOutlet ProductButton *cellBtn;
@property (strong, nonatomic) IBOutlet UIImageView *cellImage;

@end
