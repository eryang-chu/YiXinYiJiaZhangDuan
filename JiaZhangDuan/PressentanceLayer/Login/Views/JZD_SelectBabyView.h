//
//  JZD_SelectBabyView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/23.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_SelectBabyView : UIView
@property (nonatomic, strong) NSArray *babyList;
@property (nonatomic, copy) void (^backButtonClick)(void);
@property (nonatomic, copy) void (^babyDidSelectAtIndex)(NSIndexPath *index);
@end
