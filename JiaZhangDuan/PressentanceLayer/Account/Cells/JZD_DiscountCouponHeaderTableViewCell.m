//
//  JZD_DiscountCouponHeaderTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_DiscountCouponHeaderTableViewCell.h"

#define buttonWidth DEVICE_WIDTH / 3.f

@interface JZD_DiscountCouponHeaderTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *enableButton;
@property (weak, nonatomic) IBOutlet UIButton *usedButton;
@property (weak, nonatomic) IBOutlet UIButton *expiredButton;
@property (weak, nonatomic) IBOutlet UIView *redLineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineLeft;

@end

@implementation JZD_DiscountCouponHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f;
    // Initialization code
}
- (IBAction)enableButtonClick:(id)sender {
    [self.enableButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
    [self.usedButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.expiredButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    
//    self.redLineView.centerX = self.enableButton.centerX;
//    CGRect rect = self.redLineView.frame;
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f;
//    self.redLineView.frame = rect;
    
    if (self.enableButtonClick) {
        self.enableButtonClick();
    }
}
- (IBAction)usedButtonClick:(id)sender {
    [self.usedButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
    [self.enableButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.expiredButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    
//    self.redLineView.centerX = self.usedButton.centerX;
//    CGRect rect = self.redLineView.frame;
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f + buttonWidth;
//    self.redLineView.frame = rect;
    
    if (self.usedButtonClick) {
        self.usedButtonClick();
    }
}
- (IBAction)expiredButtonClick:(id)sender {
    [self.expiredButton setTitleColor:SYSTEM_RED_COLOR forState:UIControlStateNormal];
    [self.usedButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    [self.enableButton setTitleColor:HEX_COLOR(0x333333) forState:UIControlStateNormal];
    
//    self.redLineView.centerX = self.expiredButton.centerX;
//    CGRect rect = self.redLineView.frame;
    self.redLineLeft.constant = (buttonWidth - 80) / 2.f + 2 * buttonWidth;
//    self.redLineView.frame = rect;
    
    if (self.expiredButtonClick) {
        self.expiredButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
