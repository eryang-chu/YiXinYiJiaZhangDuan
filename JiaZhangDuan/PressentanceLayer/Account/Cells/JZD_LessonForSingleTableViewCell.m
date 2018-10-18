//
//  JZD_LessonForSingleTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_LessonForSingleTableViewCell.h"

@interface JZD_LessonForSingleTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@end

@implementation JZD_LessonForSingleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.actionButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Initialization code
}

- (IBAction)actionButtonClick:(id)sender {
    if (self.actionButtonClick) {
        self.actionButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
