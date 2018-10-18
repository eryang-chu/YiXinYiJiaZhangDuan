//
//  JZD_ObligationTableViewCell.h
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BasicTableViewCell.h"

typedef NS_ENUM(NSUInteger, JZD_ObligationTableViewCellType) {
    JZD_ObligationTableViewCellTypeObligation, //待付款
    JZD_ObligationTableViewCellTyperefund, //退款
    JZD_ObligationTableViewCellTypeAccountPaid,//已付款
};

@interface JZD_ObligationTableViewCell : JZD_BasicTableViewCell
@property (nonatomic, assign) JZD_ObligationTableViewCellType cellType;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *obligationButton;

@property (nonatomic, copy) void (^obligationButtonClick)(void);
@end
