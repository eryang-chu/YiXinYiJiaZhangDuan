//
//  JZD_HomeCourseListView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZD_HomeCourseListViewType) {
    JZD_HomeCourseListViewTypeCourses, //全科
    JZD_HomeCourseListViewTypeLanguage, //语文
};

@interface JZD_HomeCourseListView : UIView

@property (nonatomic, assign) JZD_HomeCourseListViewType viewType;
@property (nonatomic, copy) void (^cellDidSelectedAtIndexPath)(NSIndexPath *index);
@property (nonatomic, copy) void (^cartButtonClick)(void);
@property (nonatomic, copy) void (^applyButtonClick)(void);
@property (nonatomic, copy) void (^bottomCartButtonClick)(void);
@end
