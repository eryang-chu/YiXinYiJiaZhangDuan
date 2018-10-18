//
//  JZD_ModifyPhoneView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZD_PhoneCodePwdTableViewCell;

@interface JZD_ModifyPhoneView : UIView
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (copy, nonatomic) void (^sureButtonClick)(NSString *phone, NSString *code);
@property (copy, nonatomic) void (^getCodeButtonClick)(NSString *phone, JZD_PhoneCodePwdTableViewCell *cell);

@end
