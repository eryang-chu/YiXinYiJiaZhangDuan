//
//  JZD_ServeTeachingReportEvaluateTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_StarView.h"
#import "JZD_ServeTeachingReportEvaluateTableViewCell.h"

@interface JZD_ServeTeachingReportEvaluateTableViewCell ()
@property (weak, nonatomic) IBOutlet JZD_StarView *classStarView;
@property (weak, nonatomic) IBOutlet JZD_StarView *workStarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *classStarViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *workStarViewWidth;
@end

@implementation JZD_ServeTeachingReportEvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.classStarViewWidth.constant = DEVICE_WIDTH / 2.f - 80;
    self.workStarViewWidth.constant = DEVICE_WIDTH / 2.f - 80;
    // Initialization code
}

- (void)setScore:(NSInteger)score {
    self.classStarView.score = score;
    self.workStarView.score = score;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
