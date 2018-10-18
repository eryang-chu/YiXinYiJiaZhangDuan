//
//  JZD_ServeTeachingReportListView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ServeTeachingReportListView : UIView
@property (nonatomic, copy) void (^reportDidSelectAtIndexPath)(NSIndexPath *index);
@end
