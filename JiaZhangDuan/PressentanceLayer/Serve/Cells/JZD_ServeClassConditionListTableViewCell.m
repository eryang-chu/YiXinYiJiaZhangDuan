//
//  JZD_ServeClassConditionListTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassConditionListTableViewCell.h"

@interface JZD_ServeClassConditionListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalClasses;
@property (weak, nonatomic) IBOutlet UILabel *usedClasses;
@property (weak, nonatomic) IBOutlet UILabel *surplusClasses;

@end

@implementation JZD_ServeClassConditionListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
