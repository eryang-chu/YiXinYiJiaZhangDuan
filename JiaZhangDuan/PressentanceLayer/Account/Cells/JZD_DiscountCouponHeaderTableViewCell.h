//
//  JZD_DiscountCouponHeaderTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_DiscountCouponHeaderTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^enableButtonClick)(void);
@property (nonatomic, copy) void (^usedButtonClick)(void);
@property (nonatomic, copy) void (^expiredButtonClick)(void);
@end
