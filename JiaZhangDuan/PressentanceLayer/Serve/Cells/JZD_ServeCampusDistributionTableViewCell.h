//
//  JZD_ServeCampusDistributionTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_ServeCampusDistributionTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^phoneButtonClick)(void);
@end
