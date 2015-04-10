//
//  AddChanceCell.h
//  NiuChaIos
//
//  Created by SharkCome on 15/3/31.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddChanceCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *backView;

@property (strong, nonatomic) IBOutlet UIImageView *cellImage;
@property (strong, nonatomic) IBOutlet UILabel *cellLabel;
@property (strong, nonatomic) IBOutlet UIImageView *arrowImage;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *arrowImageWidthCon;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *arrowImageHeightCon;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *arrowImageTrailCon;

@end
