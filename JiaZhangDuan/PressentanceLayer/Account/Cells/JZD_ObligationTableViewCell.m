//
//  JZD_ObligationTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ObligationTableViewCell.h"

@implementation JZD_ObligationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.obligationButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Initialization code
}

- (void)setCellType:(JZD_ObligationTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_ObligationTableViewCellTypeObligation:
            self.moneyLabel.hidden = NO;
            break;
        case JZD_ObligationTableViewCellTyperefund:
            self.moneyLabel.hidden = YES;
            break;
        case JZD_ObligationTableViewCellTypeAccountPaid:
            self.moneyLabel.hidden = NO;
            self.moneyLabel.textColor = HEX_COLOR(0x333333);
            break;
            
        default:
            break;
    }
}

- (IBAction)obligationButtonClick:(id)sender {
    if (self.obligationButtonClick) {
        self.obligationButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
