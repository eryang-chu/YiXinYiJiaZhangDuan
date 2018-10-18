//
//  JZD_AccountBabySexView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountBabySexView.h"

@interface JZD_AccountBabySexView ()
@property (weak, nonatomic) IBOutlet UIButton *schoolGirlButton;
@property (weak, nonatomic) IBOutlet UIButton *schoolBoyButton;
@property (nonatomic, strong) UIButton *selectButton;
@end
@implementation JZD_AccountBabySexView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.schoolBoyButton.selected = YES;
    self.schoolGirlButton.selected = NO;
    self.selectButton = self.schoolBoyButton;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_AccountBabySexView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_AccountBabySexView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}
- (IBAction)schoolgirlButtonClick:(UIButton *)sender {
    if (!sender.selected) {
        self.schoolGirlButton.selected = YES;
        self.schoolBoyButton.selected = NO;
        self.selectButton = self.schoolGirlButton;
    }
}
- (IBAction)schoolboyButtonClick:(UIButton *)sender {
    if (!sender.selected) {
        self.schoolGirlButton.selected = NO;
        self.schoolBoyButton.selected = YES;
        self.selectButton = self.schoolBoyButton;
    }
}
- (IBAction)cancelButtonClick:(id)sender {
    if (self.cancelButtonClick) {
        self.cancelButtonClick();
    }
}
- (IBAction)sureButtonClick:(id)sender {
    if (self.sureButtonClick) {
        self.sureButtonClick(self.selectButton);
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
