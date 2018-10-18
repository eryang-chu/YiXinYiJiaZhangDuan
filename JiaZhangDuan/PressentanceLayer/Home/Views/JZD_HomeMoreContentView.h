//
//  JZD_HomeMoreContentView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_HomeMoreContentView : UIView
@property (nonatomic, copy) void (^contentCellDidSelectedAtIndex)(NSIndexPath *index);
@end
