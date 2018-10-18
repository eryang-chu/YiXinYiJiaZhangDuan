//
//  JZD_AccountBabyInfoTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_AccountBabyInfoTableViewCellType) {
    JZD_AccountBabyInfoTableViewCellTypeImage, //头像
    JZD_AccountBabyInfoTableViewCellTypeNextWithLabel, //
    JZD_AccountBabyInfoTableViewCellTypeNextNoLabel, //
    JZD_AccountBabyInfoTableViewCellTypeAccountSet,
};

@interface JZD_AccountBabyInfoTableViewCell : JZD_BasicTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (nonatomic, assign) JZD_AccountBabyInfoTableViewCellType cellType;
@end

