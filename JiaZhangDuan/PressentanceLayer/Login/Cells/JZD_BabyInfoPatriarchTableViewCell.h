//
//  JZD_BabyInfoPatriarchTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@class JZD_BabyInfoPatriarchCollectionViewCell;

@interface JZD_BabyInfoPatriarchTableViewCell : JZD_BasicTableViewCell

@property (nonatomic, strong) NSArray *patriarchList;
@property (nonatomic, copy) void (^patriarchDidSelectAtIndex)(NSIndexPath *index, JZD_BabyInfoPatriarchCollectionViewCell *cell);
@end
