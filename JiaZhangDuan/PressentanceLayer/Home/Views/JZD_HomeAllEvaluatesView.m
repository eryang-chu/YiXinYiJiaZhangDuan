//
//  JZD_HomeAllEvaluatesView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_CourseEvaluateTableViewCell.h"
#import "JZD_HomeAllEvaluatesView.h"

@interface JZD_HomeAllEvaluatesView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *evaluateNum;
@end

@implementation JZD_HomeAllEvaluatesView

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 50)];
        _headerView.backgroundColor = [UIColor whiteColor];
        self.evaluateNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 50)];
        self.evaluateNum.font = [UIFont systemFontOfSize:16];
        self.evaluateNum.textColor = HEX_COLOR(0x333333);
        self.evaluateNum.text = @"全部评论（10）";
        self.evaluateNum.textAlignment = NSTextAlignmentCenter;
        [_headerView addSubview:self.evaluateNum];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, DEVICE_WIDTH, 1)];
        bottomView.backgroundColor = HEX_COLOR(0xf2f2f2);
        [_headerView addSubview:bottomView];
        
    }
    return _headerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_CourseEvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_CourseEvaluateTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row || indexPath.row == 1) {
        return 185;
    }
    return 103;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_CourseEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_CourseEvaluateTableViewCell"];
    
    if (!indexPath.row || indexPath.row == 1) {
        cell.cellType = JZD_CourseEvaluateTableViewCellTypeImages;
    } else {
        cell.cellType = JZD_CourseEvaluateTableViewCellTypeNoImage;
    }
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
