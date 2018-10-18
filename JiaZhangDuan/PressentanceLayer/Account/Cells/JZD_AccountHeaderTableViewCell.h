//
//  JZD_AccountHeaderTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_AccountHeaderTableViewCellType) {
    JZD_AccountHeaderTableViewCellTypeLogined, //已登录
    JZD_AccountHeaderTableViewCellTypeUnLogin, //未登录
};
@interface JZD_AccountHeaderTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_AccountHeaderTableViewCellType cellType;
@property (weak, nonatomic) IBOutlet UILabel *babyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jifenLabel;
@property (nonatomic, copy) void (^changeBabyButtonClick)(void);
@property (nonatomic, copy) void (^loginButtonClick)(void);
@end
