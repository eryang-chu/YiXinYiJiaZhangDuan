//
//  JZD_ServeCampusDistributionTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeCampusDistributionTableViewCell.h"

@interface JZD_ServeCampusDistributionTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@end

@implementation JZD_ServeCampusDistributionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    // Initialization code
}

- (IBAction)phoneButtonClick:(id)sender {
    if (self.phoneButtonClick) {
        self.phoneButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
