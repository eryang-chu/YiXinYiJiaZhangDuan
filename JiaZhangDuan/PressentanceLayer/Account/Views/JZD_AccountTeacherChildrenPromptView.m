//
//  JZD_AccountTeacherChildrenPromptView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountTeacherChildrenPromptView.h"

@interface JZD_AccountTeacherChildrenPromptView ()
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@end
@implementation JZD_AccountTeacherChildrenPromptView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_AccountTeacherChildrenPromptView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_AccountTeacherChildrenPromptView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.sureButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
}

- (IBAction)sureButtonClick:(id)sender {
    if (self.sureButtonClick) {
        self.sureButtonClick();
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
