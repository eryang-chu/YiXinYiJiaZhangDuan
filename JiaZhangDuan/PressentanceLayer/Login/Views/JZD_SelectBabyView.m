//
//  JZD_SelectBabyView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/23.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_SelectBabyTableViewCell.h"
#import "JZD_ForgetPwdTopView.h"
#import "JZD_SelectBabyView.h"

#define cellHeight 165

@interface JZD_SelectBabyView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;
@end
@implementation JZD_SelectBabyView
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_SelectBabyTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_SelectBabyTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"选择宝贝";
    @weakify(self);
    self.topView.backButtonClick = ^{
        @strongify(self);
        if (self.backButtonClick) {
            self.backButtonClick();
        }
    };
}

- (void)setBabyList:(NSArray *)babyList {
    _babyList = babyList;
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.babyList.count % 2) {
        return ((self.babyList.count / 2 + 1) *120 +cellHeight);
    }
    
    return ((self.babyList.count / 2) *120 +cellHeight);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_SelectBabyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_SelectBabyTableViewCell"];
        cell.babyList = self.babyList;
        @weakify(self);
        cell.babyDidSelectAtIndex = ^(NSIndexPath *index) {
            @strongify(self);
            if (self.babyDidSelectAtIndex) {
                self.babyDidSelectAtIndex(index);
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
