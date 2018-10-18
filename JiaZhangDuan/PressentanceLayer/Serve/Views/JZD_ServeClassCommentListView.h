//
//  JZD_ServeClassCommentListView.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_ServeClassCommentListView : UIView
@property (nonatomic, copy) void (^classCommentDidSelectAtIndexPath)(NSIndexPath *index);
@end
