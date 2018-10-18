//
//  JZD_AccountDiversityTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountDiversityTableViewCell.h"

@interface JZD_AccountDiversityTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *diversityView;
@end
@implementation JZD_AccountDiversityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.diversityView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Initialization code
}
- (IBAction)youhuiquanButtonClick:(id)sender {
    if (self.youhuiquanButtonClick) {
        self.youhuiquanButtonClick();
    }
}
- (IBAction)chafenButtonClick:(id)sender {
    if (self.chafenButtonClick) {
        self.chafenButtonClick();
    }
}
- (IBAction)jifenButtonClick:(id)sender {
    if (self.jifenButtonClick) {
        self.jifenButtonClick();
    }
}
- (IBAction)helpButtonClick:(id)sender {
    if (self.helpButtonClick) {
        self.helpButtonClick();
    }
}
- (IBAction)setButtonClick:(id)sender {
    if (self.setButtonClick) {
        self.setButtonClick();
    }
}
- (IBAction)jiaoshizinvButtonClick:(id)sender {
    if (self.jiaoshizinvButtonClick) {
        self.jiaoshizinvButtonClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
