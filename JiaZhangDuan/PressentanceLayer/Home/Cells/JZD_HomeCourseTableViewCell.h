//
//  JZD_HomeCourseTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_HomeCourseTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^cellDidSelectedAtIndex)(NSIndexPath *index);
@end
