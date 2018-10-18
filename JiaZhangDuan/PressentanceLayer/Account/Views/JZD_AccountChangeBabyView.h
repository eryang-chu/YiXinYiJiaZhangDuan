//
//  JZD_AccountChangeBabyView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_AccountChangeBabyView : UIView
@property (nonatomic, copy) void(^backButtonClick)(void);
@property (nonatomic, strong) NSArray *babyList;
@property (nonatomic, copy) void (^babyDidSelectAtIndex)(NSIndexPath *index);
@end
