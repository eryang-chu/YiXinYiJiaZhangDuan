//
//  JZD_AccountTeacherChildrenPromptView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountTeacherChildrenPromptView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
- (id)initWithFrame:(CGRect)frame;
@property (nonatomic, copy) void (^sureButtonClick)(void);
@end
