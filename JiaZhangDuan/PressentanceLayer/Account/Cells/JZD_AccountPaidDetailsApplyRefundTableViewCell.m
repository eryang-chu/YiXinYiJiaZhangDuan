//
//  JZD_AccountPaidDetailsApplyRefundTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountPaidDetailsApplyRefundTableViewCell.h"

@interface JZD_AccountPaidDetailsApplyRefundTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@end

@implementation JZD_AccountPaidDetailsApplyRefundTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headerImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    self.selectButton.selected = NO;
    // Initialization code
}
- (IBAction)selectButtonClick:(UIButton *)sender {
    if (!sender.selected) {
        self.selectButton.selected = YES;
    } else {
        self.selectButton.selected = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
