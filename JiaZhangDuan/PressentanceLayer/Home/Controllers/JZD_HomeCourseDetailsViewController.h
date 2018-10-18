//
//  JZD_HomeCourseDetailsViewController.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicViewController.h"

typedef NS_ENUM(NSUInteger, JZD_HomeCourseDetailsViewControllerType) {
    JZD_HomeCourseDetailsViewControllerTypeCourses, //全科
    JZD_HomeCourseDetailsViewControllerTypeLanguage, //语文
    JZD_HomeCourseDetailsViewControllerTypeEnglish,//外交
};
@interface JZD_HomeCourseDetailsViewController : JZD_BasicViewController
@property (nonatomic, strong) NSString *titleName;
@property (nonatomic, assign) JZD_HomeCourseDetailsViewControllerType vcType;
@end
