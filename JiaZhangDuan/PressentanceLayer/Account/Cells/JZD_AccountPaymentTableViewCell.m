//
//  JZD_AccountPaymentTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountPaymentTableViewCell.h"

@interface JZD_AccountPaymentTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *paymentView;

@end

@implementation JZD_AccountPaymentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.paymentView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Initialization code
}
- (IBAction)goukedanButtonClick:(id)sender {
    if (self.goukedanButtonClick) {
        self.goukedanButtonClick();
    }
}
- (IBAction)daifukuanButtonClick:(id)sender {
    if (self.daifukuanButtonClick) {
        self.daifukuanButtonClick();
    }
}
- (IBAction)yifukuanButtonClick:(id)sender {
    if (self.yifukuanButtonClick) {
        self.yifukuanButtonClick();
    }
}
- (IBAction)tuihuanButtonClick:(id)sender {
    if (self.tuihuanButtonClick) {
        self.tuihuanButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
