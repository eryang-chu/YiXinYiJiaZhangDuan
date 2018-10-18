//
//  JZD_AccountIntegralView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_IntegralHeaderTableViewCell.h"
#import "JZD_IntegralNormalTableViewCell.h"
#import "JZD_ForgetPwdTopView.h"
#import "JZD_AccountIntegralView.h"

@interface JZD_AccountIntegralView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;
@end

@implementation JZD_AccountIntegralView
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
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_IntegralHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_IntegralHeaderTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_IntegralNormalTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_IntegralNormalTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"我的积分";
    @weakify(self);
    self.topView.backButtonClick = ^{
        @strongify(self);
        if (self.backButtonClick) {
            self.backButtonClick();
        }
    };
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        return 160;
    } else if (indexPath.row == 1) {
        return 50;
    }
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_IntegralHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_IntegralHeaderTableViewCell"];
        
        return cell;
    } else if (indexPath.row == 1) {
        JZD_IntegralNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_IntegralNormalTableViewCell"];
        cell.cellType = JZD_IntegralNormalTableViewCellTypeHeader;
        @weakify(self);
        cell.timeButtonClick = ^{
            @strongify(self);
            if (self.timeButtonClick) {
                self.timeButtonClick();
            }
        };
        
        return cell;
    }
    JZD_IntegralNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_IntegralNormalTableViewCell"];
    cell.cellType = JZD_IntegralNormalTableViewCellTypeCourse;
    
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
