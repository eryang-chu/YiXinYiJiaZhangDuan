//
//  JZD_AccountPaidView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountPaidView : UIView
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^evaluateButtonClick)(NSIndexPath *index);
@property (nonatomic, copy) void (^cellDidSelectAtIndex)(NSIndexPath *index);
@end
