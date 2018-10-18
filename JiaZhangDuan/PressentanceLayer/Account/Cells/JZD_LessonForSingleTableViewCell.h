//
//  JZD_LessonForSingleTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_LessonForSingleTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^actionButtonClick)(void);
@end
