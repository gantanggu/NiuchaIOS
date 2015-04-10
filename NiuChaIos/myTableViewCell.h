//
//  myTableViewCell.h
//  NiuChaIos
//
//  Created by SharkCome on 15/3/27.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subTitle;
@property (strong, nonatomic) IBOutlet UILabel *bottomLine;

@end
