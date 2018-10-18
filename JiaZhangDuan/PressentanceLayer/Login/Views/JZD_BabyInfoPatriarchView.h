//
//  JZD_BabyInfoPatriarchView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZD_BabyInfoPatriarchCollectionViewCell;

@interface JZD_BabyInfoPatriarchView : UIView
@property (nonatomic, strong) NSArray *patriarchList;
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^errorInfoButtonClick)(void);
@property (nonatomic, copy) void (^patriarchsDidSelectAtIndex)(NSIndexPath *index, JZD_BabyInfoPatriarchCollectionViewCell *cell);
@end
