//
//  JZD_SelectBabyTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_SelectBabyTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, strong) NSArray *babyList;
@property (nonatomic, copy) void (^babyDidSelectAtIndex)(NSIndexPath *index);
@end
