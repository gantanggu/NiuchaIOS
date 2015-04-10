//
//  NewRichengCell.h
//  NiuChaIos
//
//  Created by SharkCome on 15/4/7.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewRichengCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cellLeftImage;
@property (strong, nonatomic) IBOutlet UITextField *cellTextField;
@property (strong, nonatomic) IBOutlet UILabel *cellLabel;

@property (strong, nonatomic) IBOutlet UIImageView *cellRightImage;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textFieldLeadCon;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *labelTrailCon;

@end
