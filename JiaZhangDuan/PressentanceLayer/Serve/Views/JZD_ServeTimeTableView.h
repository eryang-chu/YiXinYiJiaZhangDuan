//
//  JZD_ServeTimeTableView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/12.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ServeTimeTableView : UIView
@property (nonatomic, copy) void (^leaveButtonClick)(NSIndexPath *index);
@property (nonatomic, copy) void (^changeClassButtonClick)(NSIndexPath *index);
@property (nonatomic, copy) void (^cancelLeaveButtonClick)(NSIndexPath *index);
@end
