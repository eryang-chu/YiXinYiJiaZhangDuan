//
//  JZD_ClassCommentDetailTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_ClassCommentDetailTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^contentButtonClick)(void);
@end
