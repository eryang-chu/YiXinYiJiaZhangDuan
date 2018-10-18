//
//  JZD_ForgetPwdTopView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ForgetPwdTopView.h"

@interface JZD_ForgetPwdTopView ()



@end
@implementation JZD_ForgetPwdTopView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_ForgetPwdTopView *headerView = [[NSBundle mainBundle] loadNibNamed:@"JZD_ForgetPwdTopView" owner:nil options:nil].lastObject;
        headerView.frame = frame;
        return headerView;
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.backButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
}
- (IBAction)backButtonClick:(id)sender {
    if (self.backButtonClick) {
        self.backButtonClick();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
