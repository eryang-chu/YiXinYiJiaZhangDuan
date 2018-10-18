//
//  JZD_BabyInforTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BabyInforTableViewCell.h"

@interface JZD_BabyInforTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@end
@implementation JZD_BabyInforTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.babyImage layerCornerRadius:@25 borderWidth:@2 borderColor:HEX_COLOR(0xffffff)];
    [self.backgroundImage layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Initialization code
}
- (IBAction)errorInfoButtonClick:(id)sender {
    if (self.errorInfoButtonClick) {
        self.errorInfoButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
