//
//  JZD_SelectBabyCollectionView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_SelectBabyCollectionView : UIView
@property (nonatomic, strong) NSArray *babyList;
@property (nonatomic, copy) void (^cellDidSelectedAtIndex)(NSIndexPath *index);
@end
