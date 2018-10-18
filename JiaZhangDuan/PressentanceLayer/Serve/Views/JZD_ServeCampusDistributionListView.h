//
//  JZD_ServeCampusDistributionListView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ServeCampusDistributionListView : UIView
@property (nonatomic, copy) void (^campusDidSelectAtIndexPath)(NSIndexPath *index);
@property (nonatomic, copy) void (^phoneButtonDidClickAtIndexPath)(NSIndexPath *index);
@end
