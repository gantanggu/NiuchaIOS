//
//  RichengListCell.h
//  NiuChaIos
//
//  Created by SharkCome on 15/4/7.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RichengListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *cellTopLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellMidLabel;
@property (strong, nonatomic) IBOutlet UILabel *cellBotLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cellLeftImage;
@property (strong, nonatomic) IBOutlet UIImageView *cellRightImage;
@property (strong, nonatomic) IBOutlet UILabel *backView;

@end
