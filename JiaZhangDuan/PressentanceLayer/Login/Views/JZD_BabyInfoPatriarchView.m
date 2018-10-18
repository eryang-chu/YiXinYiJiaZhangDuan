//
//  JZD_BabyInfoPatriarchView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BabyInforTableViewCell.h"
#import "JZD_BabyInfoPatriarchTableViewCell.h"
#import "JZD_ForgetPwdTopView.h"
#import "JZD_BabyInfoPatriarchView.h"

@interface JZD_BabyInfoPatriarchView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;
@end
@implementation JZD_BabyInfoPatriarchView
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
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_BabyInfoPatriarchTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_BabyInfoPatriarchTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_BabyInforTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_BabyInforTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"选择身份";
    @weakify(self);
    self.topView.backButtonClick = ^{
        @strongify(self);
        if (self.backButtonClick) {
            self.backButtonClick();
        }
    };
}

- (void)setPatriarchList:(NSArray *)patriarchList {
    _patriarchList = patriarchList;
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        return 300;
    }
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_BabyInforTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_BabyInforTableViewCell"];
        
        @weakify(self);
        cell.errorInfoButtonClick = ^{
            @strongify(self);
            if (self.errorInfoButtonClick) {
                self.errorInfoButtonClick();
            }
        };
        
        return cell;
    } else {
        JZD_BabyInfoPatriarchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_BabyInfoPatriarchTableViewCell"];
        cell.patriarchList = self.patriarchList;
        @weakify(self);
        cell.patriarchDidSelectAtIndex = ^(NSIndexPath *index, JZD_BabyInfoPatriarchCollectionViewCell *cell) {
            @strongify(self);
            if (self.patriarchsDidSelectAtIndex) {
                self.patriarchsDidSelectAtIndex(index, cell);
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
