//
//  JZD_ServeTimeTableTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/12.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_ServeTimeTableTableViewCellType) {
    JZD_ServeTimeTableTableViewCellTypeleave, //请假
    JZD_ServeTimeTableTableViewCellTypeCancelLeave, //取消请假
};
@interface JZD_ServeTimeTableTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_ServeTimeTableTableViewCellType cellType;
@property (nonatomic, copy) void (^leaveButtonClick)(void);
@property (nonatomic, copy) void (^changeClassButtonClick)(void);
@end
