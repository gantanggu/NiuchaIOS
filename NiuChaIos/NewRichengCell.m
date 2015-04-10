//
//  NewRichengCell.m
//  NiuChaIos
//
//  Created by SharkCome on 15/4/7.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#import "NewRichengCell.h"

@implementation NewRichengCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"NewRichengCell" owner:self options:nil]lastObject];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
