//
//  JZD_HomeLanguageCourseListFooterView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_HomeLanguageCourseListFooterView : UIView
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, copy) void (^cartButtonClick)(void);
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@end
