//
//  SaleTableCell.h
//  NiuChaIos
//
//  Created by SharkCome on 15/3/30.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaleTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *comName;
@property (strong, nonatomic) IBOutlet UILabel *comDetailName;
@property (strong, nonatomic) IBOutlet UILabel *peopleName;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIImageView *arrowImage;
@property (strong, nonatomic) IBOutlet UILabel *backView;

@property (strong, nonatomic) IBOutlet UIButton *addBtn;

@end
