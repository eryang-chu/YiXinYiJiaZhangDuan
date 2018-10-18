//
//  JZD_ServeTimeTableTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/12.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeTimeTableTableViewCell.h"

@interface JZD_ServeTimeTableTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalHourLabel;
@property (weak, nonatomic) IBOutlet UILabel *surplusLabel;
@property (weak, nonatomic) IBOutlet UIButton *leaveButton;
@property (weak, nonatomic) IBOutlet UIButton *changeButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leaveButtonWidth;
@end

@implementation JZD_ServeTimeTableTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    [self.leaveButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.changeButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Initialization code
}

- (IBAction)leaveButtonClick:(id)sender {
    if (self.leaveButtonClick) {
        self.leaveButtonClick();
    }
}
- (IBAction)changeButtonClick:(id)sender {
    if (self.changeClassButtonClick) {
        self.changeClassButtonClick();
    }
}

- (void)setCellType:(JZD_ServeTimeTableTableViewCellType)cellType {
    switch (cellType) {
        case JZD_ServeTimeTableTableViewCellTypeleave:
            [self.leaveButton setTitle:@"请假" forState:UIControlStateNormal];
            self.leaveButtonWidth.constant = 60;
            break;
        case JZD_ServeTimeTableTableViewCellTypeCancelLeave:
            [self.leaveButton setTitle:@"取消请假" forState:UIControlStateNormal];
            self.leaveButtonWidth.constant = 100;
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
