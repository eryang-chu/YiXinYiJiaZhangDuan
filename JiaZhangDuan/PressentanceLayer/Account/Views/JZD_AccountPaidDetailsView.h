//
//  JZD_AccountPaidDetailsView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZD_AccountPaidDetailsViewType) {
    JZD_AccountPaidDetailsViewTypePaid, //已付款
    JZD_AccountPaidDetailsViewTypeEndClass, //已结课
};

@interface JZD_AccountPaidDetailsView : UIView
@property (nonatomic, assign) JZD_AccountPaidDetailsViewType viewType;
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^refundButtonClick)(void);
@property (nonatomic, copy) void (^chooseSeatButtonClick)(void);
@end
