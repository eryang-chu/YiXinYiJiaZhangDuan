//
//  JZD_GroupChatMemberTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

@interface JZD_GroupChatMemberTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, copy) void (^moreButtonClick)(void);
@property (nonatomic, copy) void (^cellDidSelectAtIndexPath)(NSIndexPath *index);
@end
