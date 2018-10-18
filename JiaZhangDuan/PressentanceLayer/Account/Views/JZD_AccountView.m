//
//  JZD_AccountView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/25.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountHeaderTableViewCell.h"
#import "JZD_AccountPaymentTableViewCell.h"
#import "JZD_AccountDiversityTableViewCell.h"

#import "JZD_ForgetPwdTopView.h"
#import "JZD_AccountView.h"

@interface JZD_AccountView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;
@end
@implementation JZD_AccountView
- (JZD_ForgetPwdTopView *)topView {
    if (!_topView) {
        _topView = [[JZD_ForgetPwdTopView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 64)];
    }
    return _topView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y - 20, self.bounds.size.width, self.bounds.size.height + 20)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.topView;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_AccountHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_AccountHeaderTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_AccountPaymentTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_AccountPaymentTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_AccountDiversityTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_AccountDiversityTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"我的";
    self.topView.backButton.hidden = YES;
}

- (void)setViewType:(JZD_AccountViewType)viewType {
    _viewType = viewType;
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        return 240;
    } else if (indexPath.row == 1) {
        return 90;
    }
    return 310;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_AccountHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_AccountHeaderTableViewCell"];
        if (self.viewType == JZD_AccountViewTypeLogined) {
            cell.cellType = JZD_AccountHeaderTableViewCellTypeLogined;
        } else {
            cell.cellType = JZD_AccountHeaderTableViewCellTypeUnLogin;
        }
        
        @weakify(self);
        cell.changeBabyButtonClick = ^{
            @strongify(self);
            if (self.changeBabyButtonClick) {
                self.changeBabyButtonClick();
            }
        };
        
        cell.loginButtonClick = ^{
            @strongify(self);
            if (self.loginButtonClick) {
                self.loginButtonClick();
            }
        };
        
        return cell;
    } else if (indexPath.row == 1) {
        JZD_AccountPaymentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_AccountPaymentTableViewCell"];
        
        @weakify(self);
        cell.goukedanButtonClick = ^{
            @strongify(self);
            if (self.goukedanButtonClick) {
                self.goukedanButtonClick();
            }
        };
        cell.daifukuanButtonClick = ^{
            @strongify(self);
            if (self.daifukuanButtonClick) {
                self.daifukuanButtonClick();
            }
        };
        cell.yifukuanButtonClick = ^{
            @strongify(self);
            if (self.yifukuanButtonClick) {
                self.yifukuanButtonClick();
            }
        };
        cell.tuihuanButtonClick = ^{
            @strongify(self);
            if (self.tuihuanButtonClick) {
                self.tuihuanButtonClick();
            }
        };
        
        return cell;
    } else {
        JZD_AccountDiversityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_AccountDiversityTableViewCell"];
        
        @weakify(self);
        cell.youhuiquanButtonClick = ^{
            @strongify(self);
            if (self.youhuiquanButtonClick) {
                self.youhuiquanButtonClick();
            }
        };
        cell.chafenButtonClick = ^{
            @strongify(self);
            if (self.chafenButtonClick) {
                self.chafenButtonClick();
            }
        };
        cell.jifenButtonClick = ^{
            @strongify(self);
            if (self.jifenButtonClick) {
                self.jifenButtonClick();
            }
        };
        cell.helpButtonClick = ^{
            @strongify(self);
            if (self.helpButtonClick) {
                self.helpButtonClick();
            }
        };
        cell.setButtonClick = ^{
            @strongify(self);
            if (self.setButtonClick) {
                self.setButtonClick();
            }
        };
        cell.jiaoshizinvButtonClick = ^{
            @strongify(self);
            if (self.jiaoshizinvButtonClick) {
                self.jiaoshizinvButtonClick();
            }
        };
        
        return cell;
    }
    return 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
