//
//  JZD_AccountChangeBabyTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_AccountChangeBabyTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^babyDidSelectAtIndex)(NSIndexPath *index);
@property (nonatomic, strong) NSArray *babyList;
@end
