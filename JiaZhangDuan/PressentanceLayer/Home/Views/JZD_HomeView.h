//
//  JZD_HomeView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_HomeView : UIView
@property (nonatomic, copy) void (^courseCellDidSelectedAtIndex)(NSIndexPath *index);
@property (nonatomic, copy) void (^advertisingOneClick)(void);
@property (nonatomic, copy) void (^advertisingTwoClick)(void);
@property (nonatomic, copy) void (^contentCellDidSelectedAtIndex)(NSIndexPath *index);
@property (nonatomic, copy) void (^moreContentButtonClick)(void);
@end
