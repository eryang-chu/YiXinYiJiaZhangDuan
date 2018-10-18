//
//  JZD_HomeImageTableViewCell.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeImageTableViewCell.h"

@interface JZD_HomeImageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;

@end

@implementation JZD_HomeImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Initialization code
}
- (IBAction)buttonOneClick:(id)sender {
    if (self.buttonOneClick) {
        self.buttonOneClick();
    }
}
- (IBAction)buttonTwoClick:(id)sender {
    if (self.buttonTwoClick) {
        self.buttonTwoClick();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
