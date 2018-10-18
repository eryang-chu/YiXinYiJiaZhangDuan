//
//  JZD_AccountPaymentTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_AccountPaymentTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^goukedanButtonClick)(void);
@property (nonatomic, copy) void (^daifukuanButtonClick)(void);
@property (nonatomic, copy) void (^yifukuanButtonClick)(void);
@property (nonatomic, copy) void (^tuihuanButtonClick)(void);
@end
