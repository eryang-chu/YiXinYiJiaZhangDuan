//
//  JZD_BabyInforTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_BabyInforTableViewCell : JZD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *babyImage;
@property (weak, nonatomic) IBOutlet UILabel *babyName;
@property (weak, nonatomic) IBOutlet UILabel *studentNumber;
@property (weak, nonatomic) IBOutlet UILabel *babyCampus;
@property (weak, nonatomic) IBOutlet UILabel *babyClass;
@property (nonatomic, copy) void (^errorInfoButtonClick)(void);
@end
