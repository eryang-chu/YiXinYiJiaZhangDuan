//
//  JZD_ServeTimeTableView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/12.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeTimeTableTableViewCell.h"
#import "JZD_ServeTimeTableView.h"

@interface JZD_ServeTimeTableView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeTimeTableView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeTimeTableTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeTimeTableTableViewCell"];
        
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
    return 105;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_ServeTimeTableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeTimeTableTableViewCell"];
    
    @weakify(self);
    cell.changeClassButtonClick = ^{
        @strongify(self);
        if (self.changeClassButtonClick) {
            self.changeClassButtonClick(indexPath);
        }
    };
    
    if (!indexPath.row) {
        cell.cellType = JZD_ServeTimeTableTableViewCellTypeleave;
        @weakify(self);
        cell.leaveButtonClick = ^{
            @strongify(self);
            if (self.leaveButtonClick) {
                self.leaveButtonClick(indexPath);
            }
        };
    } else {
        cell.cellType = JZD_ServeTimeTableTableViewCellTypeCancelLeave;
        @weakify(self);
        cell.leaveButtonClick = ^{
            @strongify(self);
            if (self.cancelLeaveButtonClick) {
                self.cancelLeaveButtonClick(indexPath);
            }
        };
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
