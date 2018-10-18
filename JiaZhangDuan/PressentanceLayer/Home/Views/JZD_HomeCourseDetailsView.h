//
//  JZD_HomeCourseDetailsView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JZD_HomeCourseDetailsViewType) {
    JZD_HomeCourseDetailsViewTypeCourses, //全科
    JZD_HomeCourseDetailsViewTypeLanguage, //语文 外教
};

@interface JZD_HomeCourseDetailsView : UIView
@property (nonatomic, assign) JZD_HomeCourseDetailsViewType viewType;

@property (nonatomic, copy) void (^languageButtonClick)(void);
@property (nonatomic, copy) void (^mathButtonClick)(void);
@property (nonatomic, copy) void (^classButtonClick)(void);
@property (nonatomic, copy) void (^teacherButtonClick)(void);
@property (nonatomic, copy) void (^courseButtonClick)(void);
@property (nonatomic, copy) void (^cellDidSelectedAtIndexPath)(NSIndexPath *index);
@end
