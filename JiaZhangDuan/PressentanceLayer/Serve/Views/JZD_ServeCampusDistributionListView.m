//
//  JZD_ServeCampusDistributionListView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeCampusDistributionTableViewCell.h"
#import "JZD_ServeCampusDistributionListView.h"

@interface JZD_ServeCampusDistributionListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeCampusDistributionListView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeCampusDistributionTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeCampusDistributionTableViewCell"];
        
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
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_ServeCampusDistributionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeCampusDistributionTableViewCell"];
    
    @weakify(self);
    cell.phoneButtonClick = ^{
        @strongify(self);
        if (self.phoneButtonDidClickAtIndexPath) {
            self.phoneButtonDidClickAtIndexPath(indexPath);
        }
    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.campusDidSelectAtIndexPath) {
        self.campusDidSelectAtIndexPath(indexPath);
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
