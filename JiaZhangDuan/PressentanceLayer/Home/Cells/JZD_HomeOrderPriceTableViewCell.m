//
//  JZD_HomeOrderPriceTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderPriceTableViewCell.h"

@interface JZD_HomeOrderPriceTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *discountCouponButton;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation JZD_HomeOrderPriceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)discountCouponButtonClick:(id)sender {
    if (self.discountCouponButtonClick) {
        self.discountCouponButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
