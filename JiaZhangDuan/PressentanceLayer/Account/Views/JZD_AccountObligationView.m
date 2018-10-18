//
//  JZD_AccountObligationView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ObligationTableViewCell.h"
#import "JZD_ForgetPwdTopView.h"
#import "JZD_AccountObligationView.h"

@interface JZD_AccountObligationView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;
@property (nonatomic, strong) NSIndexPath *index;

@end

@implementation JZD_AccountObligationView
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
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ObligationTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ObligationTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"待付款";
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
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_ObligationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ObligationTableViewCell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.index = indexPath;
    if (self.obligationButtonClick) {
        self.obligationButtonClick(self.index);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
