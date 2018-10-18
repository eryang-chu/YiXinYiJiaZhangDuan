//
//  JZD_ServeTeachingReportListTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_ServeTeachingReportListTableViewCellType) {
    JZD_ServeTeachingReportListTableViewCellTypeList, //列表页
    JZD_ServeTeachingReportListTableViewCellTypeDetail, //详情页
};
@interface JZD_ServeTeachingReportListTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_ServeTeachingReportListTableViewCellType cellType;
@end
