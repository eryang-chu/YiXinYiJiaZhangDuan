//
//  JZD_HomeCourseListTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_HomeCourseListTableViewCellType) {
    JZD_HomeCourseListTableViewCellTypeGeneralPracticeNormal, //全科
    JZD_HomeCourseListTableViewCellTypeGeneralPracticeDetails, //全科详情
    JZD_HomeCourseListTableViewCellTypeSinglePracticeNormal, //单科
    JZD_HomeCourseListTableViewCellTypeSinglePracticeDetails, //单科详情
};

@interface JZD_HomeCourseListTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_HomeCourseListTableViewCellType cellType;
@property (nonatomic, copy) void (^cartButtonClick)(void);
@property (nonatomic, copy) void (^applyButtonClick)(void);
@end
