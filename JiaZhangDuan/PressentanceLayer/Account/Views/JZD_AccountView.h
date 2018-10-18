//
//  JZD_AccountView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZD_AccountViewType) {
    JZD_AccountViewTypeLogined, //已登录
    JZD_AccountViewTypeUnLogin, //未登录
};

@interface JZD_AccountView : UIView
@property (nonatomic, assign) JZD_AccountViewType viewType;
@property (nonatomic, copy) void (^changeBabyButtonClick)(void);
@property (nonatomic, copy) void (^loginButtonClick)(void);

@property (nonatomic, copy) void (^goukedanButtonClick)(void);
@property (nonatomic, copy) void (^daifukuanButtonClick)(void);
@property (nonatomic, copy) void (^yifukuanButtonClick)(void);
@property (nonatomic, copy) void (^tuihuanButtonClick)(void);

@property (nonatomic, copy) void (^youhuiquanButtonClick)(void);
@property (nonatomic, copy) void (^chafenButtonClick)(void);
@property (nonatomic, copy) void (^jifenButtonClick)(void);
@property (nonatomic, copy) void (^helpButtonClick)(void);
@property (nonatomic, copy) void (^setButtonClick)(void);
@property (nonatomic, copy) void (^jiaoshizinvButtonClick)(void);
@end
