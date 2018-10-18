//
//  FWEB_BasicTableViewCell.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/7.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@implementation JZD_BasicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layoutMargins = UIEdgeInsetsZero;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
