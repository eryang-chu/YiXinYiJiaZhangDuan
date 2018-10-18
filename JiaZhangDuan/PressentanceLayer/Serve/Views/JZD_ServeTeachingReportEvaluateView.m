//
//  JZD_ServeTeachingReportEvaluateView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeTeachingReportListTableViewCell.h"
#import "JZD_ServeTeachingReportEvaluateTableViewCell.h"
#import "JZD_ServeTeachingReportTotalEvaluateTableViewCell.h"
#import "JZD_ServeTeachingReportEvaluateView.h"

@interface JZD_ServeTeachingReportEvaluateView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeTeachingReportEvaluateView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeTeachingReportListTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeTeachingReportListTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeTeachingReportEvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeTeachingReportEvaluateTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeTeachingReportTotalEvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeTeachingReportTotalEvaluateTableViewCell"];
        
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        return 95;
    } else if (indexPath.row == 3) {
        return 80;
    }
    return 115;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_ServeTeachingReportListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeTeachingReportListTableViewCell"];
        cell.cellType = JZD_ServeTeachingReportListTableViewCellTypeDetail;
        
        return cell;
    } else if (indexPath.row == 3) {
        JZD_ServeTeachingReportTotalEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeTeachingReportTotalEvaluateTableViewCell"];
        
        return cell;
    } else {
        JZD_ServeTeachingReportEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeTeachingReportEvaluateTableViewCell"];
        cell.score = 3;
        
        return cell;
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
