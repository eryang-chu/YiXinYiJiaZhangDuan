//
//  JZD_AccountIntegralView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountIntegralView : UIView
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^timeButtonClick)(void);
@end
