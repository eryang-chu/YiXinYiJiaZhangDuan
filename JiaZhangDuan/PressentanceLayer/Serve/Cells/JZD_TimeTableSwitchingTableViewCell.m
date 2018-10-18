//
//  JZD_TimeTableSwitchingTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_TimeTableSwitchingTableViewCell.h"

@interface JZD_TimeTableSwitchingTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation JZD_TimeTableSwitchingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleBlue;
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
