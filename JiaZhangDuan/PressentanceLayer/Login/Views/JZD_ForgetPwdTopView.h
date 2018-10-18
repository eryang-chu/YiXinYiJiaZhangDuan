//
//  JZD_ForgetPwdTopView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ForgetPwdTopView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, copy) void (^backButtonClick)(void);
@end
