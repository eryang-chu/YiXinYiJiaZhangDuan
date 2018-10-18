//
//  JZD_AccountChangeBabyView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountChangeBabyTableViewCell.h"

#import "JZD_ForgetPwdTopView.h"
#import "JZD_AccountChangeBabyView.h"

#define cellHeight 160

@interface JZD_AccountChangeBabyView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;

@end

@implementation JZD_AccountChangeBabyView
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
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_AccountChangeBabyTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_AccountChangeBabyTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"切换宝贝";
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
    JZD_AccountChangeBabyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_AccountChangeBabyTableViewCell"];
    
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
