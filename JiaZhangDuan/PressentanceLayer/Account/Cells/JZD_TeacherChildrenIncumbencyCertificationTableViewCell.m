//
//  JZD_TeacherChildrenIncumbencyCertificationTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_TeacherChildrenIncumbencyCertificationTableViewCell.h"

@interface JZD_TeacherChildrenIncumbencyCertificationTableViewCell ()
@end

@implementation JZD_TeacherChildrenIncumbencyCertificationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)incumbencyCertificationButtonClick:(id)sender {
    if (self.incumbencyCertificationButtonClick) {
        self.incumbencyCertificationButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
