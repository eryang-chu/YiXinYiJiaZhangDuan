//
//  JZD_HomeCourseHeaderView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseHeaderView.h"

@interface JZD_HomeCourseHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *classButton;
@property (weak, nonatomic) IBOutlet UIButton *teacherButton;
@property (weak, nonatomic) IBOutlet UIButton *courseButton;
@property (weak, nonatomic) IBOutlet UIView *redLineView;
@property (weak, nonatomic) IBOutlet UIButton *languageButton;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UIButton *mathButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineLeftSpace;
@end

@implementation JZD_HomeCourseHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        JZD_HomeCourseHeaderView *promptView = [[NSBundle mainBundle] loadNibNamed:@"JZD_HomeCourseHeaderView" owner:nil options:nil].lastObject;
        promptView.frame = frame;
        return promptView;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.classButton.selected = YES;
    self.languageButton.selected = YES;
    self.courseButton.selected = NO;
    self.teacherButton.selected = NO;
    self.mathButton.selected = NO;
    
    self.languageButton.hidden = YES;
    self.mathButton.hidden = YES;
    
    self.languageButton.backgroundColor = SYSTEM_RED_COLOR;
    [self.languageButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    [self.mathButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    
    self.redLineLeftSpace.constant = (DEVICE_WIDTH / 3.f - 100) / 2.f;
}

- (IBAction)languageButtonClick:(id)sender {
    if (!self.languageButton.selected) {
        self.mathButton.selected = NO;
        self.mathButton.backgroundColor = [UIColor whiteColor];
        
        self.languageButton.selected = YES;
        self.languageButton.backgroundColor = SYSTEM_RED_COLOR;
    }
    if (self.languageButtonClick) {
        self.languageButtonClick();
    }
}

- (IBAction)mathButton:(id)sender {
    if (!self.mathButton.selected) {
        self.languageButton.selected = NO;
        self.languageButton.backgroundColor = [UIColor whiteColor];
        
        self.mathButton.selected = YES;
        self.mathButton.backgroundColor = SYSTEM_RED_COLOR;
    }
    if (self.mathButtonClick) {
        self.mathButtonClick();
    }
}

- (IBAction)classButtonClick:(id)sender {
    self.languageButton.hidden = YES;
    self.mathButton.hidden = YES;
    if (!self.classButton.selected) {
        self.teacherButton.selected = NO;
        self.courseButton.selected = NO;
        self.classButton.selected = YES;
    }
    
    self.introduceLabel.text = @"班级简介";
    self.redLineLeftSpace.constant = (DEVICE_WIDTH / 3.f - 100) / 2.f;
    if (self.classButtonClick) {
        self.classButtonClick();
    }
}
- (IBAction)teacherButtonClick:(id)sender {
    if (self.viewType == JZD_HomeCourseHeaderViewTypeCourses) {
        self.languageButton.hidden = NO;
        self.mathButton.hidden = NO;
    } else {
        self.languageButton.hidden = YES;
        self.mathButton.hidden = YES;
    }
    
    if (!self.teacherButton.selected) {
        self.classButton.selected = NO;
        self.courseButton.selected = NO;
        self.teacherButton.selected = YES;
    }
    self.introduceLabel.text = @"教师简介";
    
    self.redLineLeftSpace.constant = (DEVICE_WIDTH / 3.f - 100) / 2.f + DEVICE_WIDTH / 3.f;
    if (self.teacherButtonClick) {
        self.teacherButtonClick();
    }
}
- (IBAction)courseButtonClick:(id)sender {
    self.languageButton.hidden = YES;
    self.mathButton.hidden = YES;
    
    if (!self.courseButton.selected) {
        self.teacherButton.selected = NO;
        self.classButton.selected = NO;
        self.courseButton.selected = YES;
    }
    
    self.introduceLabel.text = @"课程评价";
    self.redLineLeftSpace.constant = (DEVICE_WIDTH / 3.f - 100) / 2.f + (DEVICE_WIDTH / 3.f) * 2;
    if (self.courseButtonClick) {
        self.courseButtonClick();
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
