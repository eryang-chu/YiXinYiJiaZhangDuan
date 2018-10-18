//
//  JZD_LessonForSingleHeaderTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_LessonForSingleHeaderTableViewCell : JZD_BasicTableViewCell

@property (nonatomic, copy) void (^allButtonClick)(void);
@property (nonatomic, copy) void (^obligationButtonClick)(void);
@property (nonatomic, copy) void (^paidButtonClick)(void);
@property (nonatomic, copy) void (^refundButtonClick)(void);

@end
