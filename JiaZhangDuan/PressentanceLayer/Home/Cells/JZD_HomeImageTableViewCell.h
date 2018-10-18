//
//  JZD_HomeImageTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_HomeImageTableViewCell : JZD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageTwo;

@property (nonatomic, copy) void (^buttonOneClick)(void);
@property (nonatomic, copy) void (^buttonTwoClick)(void);
@end
