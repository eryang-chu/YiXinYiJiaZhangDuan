//
//  JZD_HomeOrderPayOverTimePromptView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderPayOverTimePromptView.h"

@interface JZD_HomeOrderPayOverTimePromptView ()
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *sureButton;
@end

@implementation JZD_HomeOrderPayOverTimePromptView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_HomeOrderPayOverTimePromptView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_HomeOrderPayOverTimePromptView" owner:nil options:nil].lastObject;
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
