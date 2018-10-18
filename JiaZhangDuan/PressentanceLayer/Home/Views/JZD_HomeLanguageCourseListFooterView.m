//
//  JZD_HomeLanguageCourseListFooterView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeLanguageCourseListFooterView.h"

@interface JZD_HomeLanguageCourseListFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *cartButton;
@end

@implementation JZD_HomeLanguageCourseListFooterView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_HomeLanguageCourseListFooterView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_HomeLanguageCourseListFooterView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (IBAction)cartButtonClick:(id)sender {
    if (self.cartButtonClick) {
        self.cartButtonClick();
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
