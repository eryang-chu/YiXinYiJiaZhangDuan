//
//  JZD_HomeOrderPriceTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_HomeOrderPriceTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^discountCouponButtonClick)(void);
@end
