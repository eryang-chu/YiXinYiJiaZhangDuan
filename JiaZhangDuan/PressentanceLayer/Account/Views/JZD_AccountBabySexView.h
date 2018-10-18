//
//  JZD_AccountBabySexView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountBabySexView : UIView
@property (nonatomic, copy) void (^cancelButtonClick)(void);
@property (nonatomic, copy) void (^sureButtonClick)(UIButton *button);
- (instancetype)initWithFrame:(CGRect)frame;
@end
