//
//  JZD_AccountPaidDetailsTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountPaidDetailsTableViewCell.h"

@interface JZD_AccountPaidDetailsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *refundButton;
@property (weak, nonatomic) IBOutlet UIButton *chooseSeatButton;
@end

@implementation JZD_AccountPaidDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.refundButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.chooseSeatButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Initialization code
}

- (void)setCellType:(JZD_AccountPaidDetailsTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_AccountPaidDetailsTableViewCellTypePaid:
            self.refundButton.hidden = NO;
            self.chooseSeatButton.hidden = NO;
            break;
        case JZD_AccountPaidDetailsTableViewCellTypeEndClass:
            self.refundButton.hidden = YES;
            self.chooseSeatButton.hidden = YES;
            break;
            
        default:
            break;
    }
}
- (IBAction)refundButtonClick:(id)sender {
    if (self.refundButtonClick) {
        self.refundButtonClick();
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
