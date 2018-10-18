//
//  JZD_CourseEvaluateTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_CourseEvaluateTableViewCellType) {
    JZD_CourseEvaluateTableViewCellTypeNoImage, //无图
    JZD_CourseEvaluateTableViewCellTypeImages, //有图
    JZD_CourseEvaluateTableViewCellTypeNoImageEvaluate, //无图有分
    JZD_CourseEvaluateTableViewCellTypeImagesEvaluate, //有图有分
};

@interface JZD_CourseEvaluateTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_CourseEvaluateTableViewCellType cellType;
@property (weak, nonatomic) IBOutlet UILabel *childernNameLabel;
@property (weak, nonatomic) IBOutlet UIView *childrenNameView;
@end
