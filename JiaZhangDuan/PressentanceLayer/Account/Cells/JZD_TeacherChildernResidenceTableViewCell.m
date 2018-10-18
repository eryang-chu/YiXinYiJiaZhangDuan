//
//  JZD_TeacherChildernResidenceTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_TeacherChildernResidenceTableViewCell.h"

@interface JZD_TeacherChildernResidenceTableViewCell ()
@end
@implementation JZD_TeacherChildernResidenceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)teacherButtonClick:(id)sender {
    if (self.teacherButtonClick) {
        self.teacherButtonClick();
    }
}
- (IBAction)studentButtonClick:(id)sender {
    if (self.studentButtonClick) {
        self.studentButtonClick();
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
