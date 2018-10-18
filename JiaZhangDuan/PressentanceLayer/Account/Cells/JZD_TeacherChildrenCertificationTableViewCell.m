//
//  JZD_TeacherChildrenCertificationTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_TeacherChildrenCertificationTableViewCell.h"

@interface JZD_TeacherChildrenCertificationTableViewCell ()
@end

@implementation JZD_TeacherChildrenCertificationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)certificationButtonClick:(id)sender {
    if (self.certificationButtonClick) {
        self.certificationButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
