//
//  JZD_HomeCourseListTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseListTableViewCell.h"

@interface JZD_HomeCourseListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *classHourLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *childrenOneImage;
@property (weak, nonatomic) IBOutlet UILabel *childrenOneName;
@property (weak, nonatomic) IBOutlet UIButton *applyButton;
@property (weak, nonatomic) IBOutlet UIImageView *childrenTwoImage;
@property (weak, nonatomic) IBOutlet UILabel *childrenTwoName;
@property (weak, nonatomic) IBOutlet UIButton *cartButton;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *locationImage;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *locationImageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *locationLabelHeight;
@end

@implementation JZD_HomeCourseListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.childrenOneImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    [self.childrenTwoImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    [self.applyButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    // Initialization code
}

- (void)setCellType:(JZD_HomeCourseListTableViewCellType)cellType {
    _cellType = cellType;
    switch (_cellType) {
        case JZD_HomeCourseListTableViewCellTypeGeneralPracticeNormal:
            self.cartButton.hidden = YES;
            self.applyButton.hidden = NO;
            self.numberLabel.hidden = YES;
//            self.locationImage.hidden = YES;
//            self.locationLabel.hidden = YES;
            self.locationImageHeight.constant = 0;
            self.locationLabelHeight.constant = 0;
            break;
        case JZD_HomeCourseListTableViewCellTypeGeneralPracticeDetails:
            self.cartButton.hidden = YES;
            self.applyButton.hidden = YES;
            self.numberLabel.hidden = NO;
//            self.locationImage.hidden = NO;
//            self.locationLabel.hidden = NO;
//            self.locationImage.height = 25;
//            self.locationLabel.height = 25;
            self.locationImageHeight.constant = 25;
            self.locationLabelHeight.constant = 25;
            break;
        case JZD_HomeCourseListTableViewCellTypeSinglePracticeNormal:
            self.cartButton.hidden = NO;
            self.applyButton.hidden = NO;
            self.numberLabel.hidden = YES;
            
//            self.locationImage.hidden = YES;
//            self.locationLabel.hidden = YES;
//            self.locationImage.height = 0;
//            self.locationLabel.height = 0;
            self.locationImageHeight.constant = 0;
            self.locationLabelHeight.constant = 0;
            break;
        case JZD_HomeCourseListTableViewCellTypeSinglePracticeDetails:
            self.cartButton.hidden = YES;
            self.applyButton.hidden = YES;
            self.numberLabel.hidden = NO;
            
//            self.locationImage.hidden = NO;
//            self.locationLabel.hidden = NO;
//            self.locationImage.height = 25;
//            self.locationLabel.height = 25;
            self.locationImageHeight.constant = 25;
            self.locationLabelHeight.constant = 25;
            break;
            
        default:
            break;
    }
}
- (IBAction)cartButtonClick:(id)sender {
    if (self.cartButtonClick) {
        self.cartButtonClick();
    }
}
- (IBAction)applyButtonClick:(id)sender {
    if (self.applyButtonClick) {
        self.applyButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
