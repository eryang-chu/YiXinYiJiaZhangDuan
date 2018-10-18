//
//  JZD_AccountDiscountCouponView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_DiscountCouponTableViewCell.h"
#import "JZD_DiscountCouponHeaderTableViewCell.h"
#import "JZD_ForgetPwdTopView.h"
#import "JZD_AccountDiscountCouponView.h"

@interface JZD_AccountDiscountCouponView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;

@end

@implementation JZD_AccountDiscountCouponView
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
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_DiscountCouponTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_DiscountCouponTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_DiscountCouponHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_DiscountCouponHeaderTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"优惠券";
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
        return 50;
    }
    return 130;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_DiscountCouponHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_DiscountCouponHeaderTableViewCell"];
        
        @weakify(self);
        cell.enableButtonClick = ^{
            @strongify(self);
            if (self.enableButtonClick) {
                self.enableButtonClick();
            }
        };
        cell.usedButtonClick = ^{
            @strongify(self);
            if (self.usedButtonClick) {
                self.usedButtonClick();
            }
        };
        cell.expiredButtonClick = ^{
            @strongify(self);
            if (self.expiredButtonClick) {
                self.expiredButtonClick();
            }
        };
        return cell;
    }
    
    JZD_DiscountCouponTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_DiscountCouponTableViewCell"];
    
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
