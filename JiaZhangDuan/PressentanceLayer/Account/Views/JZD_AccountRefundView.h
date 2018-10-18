//
//  JZD_AccountRefundView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountRefundView : UIView
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^refundButtonClick)(NSIndexPath *index);
@end
