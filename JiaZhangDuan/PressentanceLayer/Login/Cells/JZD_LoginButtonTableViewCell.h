//
//  JZD_LoginButtonTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_LoginButtonTableViewCell : JZD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic, copy) void (^loginButtonClick)(void);
@end
