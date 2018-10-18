//
//  JZD_HomeOrderPaymentMethodTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderPaymentMethodTableViewCell.h"

@interface JZD_HomeOrderPaymentMethodTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end

@implementation JZD_HomeOrderPaymentMethodTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.zhiButton.selected = YES;
    self.weiButton.selected = NO;
    // Initialization code
}
- (IBAction)weiButtonClick:(id)sender {
    if (!self.weiButton.selected) {
        self.zhiButton.selected = NO;
        self.weiButton.selected = YES;
    }
}
- (IBAction)zhiButtonClick:(id)sender {
    if (!self.zhiButton.selected) {
        self.weiButton.selected = NO;
        self.zhiButton.selected = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
