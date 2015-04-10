//
//  SettingCell.h
//  NiuChaIos
//
//  Created by SharkCome on 15/3/27.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *cellTitle;
@property (strong, nonatomic) IBOutlet UIImageView *cellLeftImage;
@property (strong, nonatomic) IBOutlet UIImageView *cellRightImage;
@property (strong, nonatomic) IBOutlet UILabel *subTitle;

@end
