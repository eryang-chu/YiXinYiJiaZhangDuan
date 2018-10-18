//
//  JZD_IntegralNormalTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_IntegralNormalTableViewCellType) {
    JZD_IntegralNormalTableViewCellTypeCourse, //输入手机号
    JZD_IntegralNormalTableViewCellTypeHeader, //输入验证码
};

@interface JZD_IntegralNormalTableViewCell : JZD_BasicTableViewCell

@property (nonatomic, assign) JZD_IntegralNormalTableViewCellType cellType;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *integralLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, copy) void (^timeButtonClick)(void);

@end
