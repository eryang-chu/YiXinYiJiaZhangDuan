//
//  JZD_ServeClassConditionDetailView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassConditionDetailTableViewCell.h"
#import "JZD_ServeClassConditionDetailView.h"

@interface JZD_ServeClassConditionDetailView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeClassConditionDetailView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeClassConditionDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeClassConditionDetailTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
}

- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_ServeClassConditionDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeClassConditionDetailTableViewCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (!section) {
        return 50;
    }
    return 58;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!section) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 50)];
        headerView.backgroundColor = [UIColor whiteColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, DEVICE_WIDTH, 1)];
        lineView.backgroundColor = HEX_COLOR(0xf2f2f2);
        [headerView addSubview:lineView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, DEVICE_WIDTH - 24, 49)];
        titleLabel.text = @"2018年6月";
        titleLabel.textColor = HEX_COLOR(0x333333);
        titleLabel.font = [UIFont systemFontOfSize:16];
        [headerView addSubview:titleLabel];
        return headerView;
    }
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 58)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 8)];
    topView.backgroundColor = HEX_COLOR(0xf2f2f2);
    [headerView addSubview:topView];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 57, DEVICE_WIDTH, 1)];
    lineView.backgroundColor = HEX_COLOR(0xf2f2f2);
    [headerView addSubview:lineView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 8, DEVICE_WIDTH - 24, 49)];
    titleLabel.text = @"2018年6月";
    titleLabel.textColor = HEX_COLOR(0x333333);
    titleLabel.font = [UIFont systemFontOfSize:16];
    [headerView addSubview:titleLabel];
    return headerView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
