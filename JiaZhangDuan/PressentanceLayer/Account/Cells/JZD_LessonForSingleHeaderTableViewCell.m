//
//  JZD_LessonForSingleHeaderTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_LessonForSingleHeaderTableViewCell.h"

#define buttonWidth DEVICE_WIDTH / 4.f

@interface JZD_LessonForSingleHeaderTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *allButton;
@property (weak, nonatomic) IBOutlet UIButton *obligationButton;
@property (weak, nonatomic) IBOutlet UIButton *paidButton;
@property (weak, nonatomic) IBOutlet UIButton *refundButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineLeft;
@end

@implementation JZD_LessonForSingleHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.redLineWidth.constant = DEVICE_WIDTH / 4.f - 30;
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f;
    // Initialization code
}
- (IBAction)allButtonClick:(id)sender {
    [self.allButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
    [self.obligationButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.paidButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.refundButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f;
    
    if (self.allButtonClick) {
        self.allButtonClick();
    }
}
- (IBAction)obligationButtonClick:(id)sender {
    [self.obligationButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
    [self.allButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.paidButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.refundButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f + buttonWidth;
    
    if (self.obligationButtonClick) {
        self.obligationButtonClick();
    }
}
- (IBAction)paidButtonClick:(id)sender {
    [self.paidButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
    [self.obligationButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.allButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.refundButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f + buttonWidth * 2;
    
    if (self.paidButtonClick) {
        self.paidButtonClick();
    }
}
- (IBAction)refundButtonClick:(id)sender {
    [self.refundButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
    [self.obligationButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.paidButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.allButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f + buttonWidth * 3;
    
    if (self.refundButtonClick) {
        self.refundButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
