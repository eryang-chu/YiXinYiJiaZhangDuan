//
//  JZD_IntegralNormalTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_IntegralNormalTableViewCell.h"

@interface JZD_IntegralNormalTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@end

@implementation JZD_IntegralNormalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellType:(JZD_IntegralNormalTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_IntegralNormalTableViewCellTypeHeader:
            self.courseLabel.hidden = YES;
            self.timeLabel.hidden = YES;
            self.integralLabel.hidden = YES;
            self.titleLabel.hidden = NO;
            self.timeButton.hidden = NO;
            break;
        case JZD_IntegralNormalTableViewCellTypeCourse:
            self.courseLabel.hidden = NO;
            self.timeLabel.hidden = NO;
            self.integralLabel.hidden = NO;
            self.titleLabel.hidden = YES;
            self.timeButton.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (IBAction)timeButtonClick:(id)sender {
    if (self.timeButtonClick) {
        self.timeButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
