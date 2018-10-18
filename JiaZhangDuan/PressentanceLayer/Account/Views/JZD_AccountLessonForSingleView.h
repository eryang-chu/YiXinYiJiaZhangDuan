//
//  JZD_AccountLessonForSingleView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountLessonForSingleView : UIView

@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^actionButtonClick)(NSIndexPath *index);
@property (nonatomic, copy) void (^allButtonClick)(void);
@property (nonatomic, copy) void (^obligationButtonClick)(void);
@property (nonatomic, copy) void (^paidButtonClick)(void);
@property (nonatomic, copy) void (^refundButtonClick)(void);

@end
