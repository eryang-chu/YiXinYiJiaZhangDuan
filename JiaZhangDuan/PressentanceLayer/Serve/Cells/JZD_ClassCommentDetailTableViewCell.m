//
//  JZD_ClassCommentDetailTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ClassCommentDetailTableViewCell.h"

@interface JZD_ClassCommentDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *studentLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation JZD_ClassCommentDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)contentButtonClick:(id)sender {
    if (self.contentButtonClick) {
        self.contentButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
