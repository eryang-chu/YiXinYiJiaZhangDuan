//
//  JZD_ServeClassCommentDetailEvaluateContentTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_ServeClassCommentDetailEvaluateContentTableViewCellType) {
    JZD_ServeClassCommentDetailEvaluateContentTableViewCellTypeNormal, //详情
    JZD_ServeClassCommentDetailEvaluateContentTableViewCellTypeContent, //上课内容
};

@interface JZD_ServeClassCommentDetailEvaluateContentTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_ServeClassCommentDetailEvaluateContentTableViewCellType cellType;
@end
