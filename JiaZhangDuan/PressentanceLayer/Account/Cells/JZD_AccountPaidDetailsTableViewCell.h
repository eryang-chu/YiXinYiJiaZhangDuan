//
//  JZD_AccountPaidDetailsTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_AccountPaidDetailsTableViewCellType) {
    JZD_AccountPaidDetailsTableViewCellTypePaid, //已付款
    JZD_AccountPaidDetailsTableViewCellTypeEndClass, //输已结课
};

@interface JZD_AccountPaidDetailsTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_AccountPaidDetailsTableViewCellType cellType;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *classroomLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *seatLabel;
@property (nonatomic, copy) void (^refundButtonClick)(void);
@property (nonatomic, copy) void (^chooseSeatButtonClick)(void);
@end
