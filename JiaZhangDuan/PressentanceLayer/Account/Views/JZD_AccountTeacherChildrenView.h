//
//  JZD_AccountTeacherChildrenView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountTeacherChildrenView : UIView
@property (nonatomic, copy) void(^backButtonClick)(void);
@property (nonatomic, copy) void(^certificationButtonClick)(void);
@property (nonatomic, copy) void(^teacherButtonClick)(void);
@property (nonatomic, copy) void(^studentButtonClick)(void);
@property (nonatomic, copy) void(^incumbencyCertificationButtonClick)(void);
@end
