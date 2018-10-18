//
//  JZD_DiscountCouponView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_DiscountCouponView : UIView
@property (nonatomic, copy) void (^cellDidSelectedAtIndexPath)(NSIndexPath *index);
- (void)reloadData;
@end
