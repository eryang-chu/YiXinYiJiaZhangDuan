//
//  JZD_ObligationCourseDetailsTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ObligationCourseDetailsTableViewCell.h"

@implementation JZD_ObligationCourseDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.obligationButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.chooseSeatButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Initialization code
}

- (IBAction)obligationButtonClick:(id)sender {
    if (self.obligationButtonClick) {
        self.obligationButtonClick();
    }
}

- (IBAction)chooseSeatButtonClick:(id)sender {
    if (self.chooseSeatButtonClick) {
        self.chooseSeatButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
