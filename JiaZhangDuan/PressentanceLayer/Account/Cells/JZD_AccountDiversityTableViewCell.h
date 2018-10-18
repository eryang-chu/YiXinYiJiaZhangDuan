//
//  JZD_AccountDiversityTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_AccountDiversityTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^youhuiquanButtonClick)(void);
@property (nonatomic, copy) void (^chafenButtonClick)(void);
@property (nonatomic, copy) void (^jifenButtonClick)(void);
@property (nonatomic, copy) void (^helpButtonClick)(void);
@property (nonatomic, copy) void (^setButtonClick)(void);
@property (nonatomic, copy) void (^jiaoshizinvButtonClick)(void);
@end
