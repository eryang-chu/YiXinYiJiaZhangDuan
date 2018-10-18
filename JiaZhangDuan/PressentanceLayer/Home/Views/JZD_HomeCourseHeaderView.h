//
//  JZD_HomeCourseHeaderView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZD_HomeCourseHeaderViewType) {
    JZD_HomeCourseHeaderViewTypeCourses, //全科
    JZD_HomeCourseHeaderViewTypeLanguage, //语文 外教
};

@interface JZD_HomeCourseHeaderView : UIView
@property (nonatomic, assign) JZD_HomeCourseHeaderViewType viewType;
@property (nonatomic, copy) void (^languageButtonClick)(void);
@property (nonatomic, copy) void (^mathButtonClick)(void);
@property (nonatomic, copy) void (^classButtonClick)(void);
@property (nonatomic, copy) void (^teacherButtonClick)(void);
@property (nonatomic, copy) void (^courseButtonClick)(void);
- (instancetype)initWithFrame:(CGRect)frame;
@end
