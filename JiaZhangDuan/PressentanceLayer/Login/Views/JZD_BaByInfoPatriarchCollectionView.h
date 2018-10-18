//
//  JZD_BaByInfoPatriarchCollectionView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZD_BabyInfoPatriarchCollectionViewCell;

@interface JZD_BaByInfoPatriarchCollectionView : UIView
@property (nonatomic, strong) NSArray *patriarchList;
@property (nonatomic, copy) void (^cellDidSelectedAtIndex)(NSIndexPath *index, JZD_BabyInfoPatriarchCollectionViewCell *cell);
@end
