//
//  JZD_HomeOrderCourseListTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderCourseListTableViewCell.h"

@interface JZD_HomeOrderCourseListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@end

@implementation JZD_HomeOrderCourseListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectButton.selected = YES;
    // Initialization code
}
- (IBAction)selectButtonClick:(id)sender {
    if (self.selectButtonClick) {
        self.selectButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
