//
//  JZD_HomeMoreTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeMoreTableViewCell.h"

@implementation JZD_HomeMoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)moreContentButtonClick:(id)sender {
    if (self.moreContentButtonClick) {
        self.moreContentButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
