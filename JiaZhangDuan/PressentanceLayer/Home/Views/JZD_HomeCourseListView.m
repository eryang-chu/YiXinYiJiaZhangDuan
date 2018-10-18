//
//  JZD_HomeCourseListView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseListTableViewCell.h"
#import "JZD_HomeLanguageCourseListFooterView.h"
#import "JZD_HomeCourseListView.h"

@interface JZD_HomeCourseListView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_HomeLanguageCourseListFooterView *footerView;
@end

@implementation JZD_HomeCourseListView

- (JZD_HomeLanguageCourseListFooterView *)footerView {
    if (!_footerView) {
        _footerView = [[JZD_HomeLanguageCourseListFooterView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 120)];
        @weakify(self);
        _footerView.cartButtonClick = ^{
            @strongify(self);
            if (self.bottomCartButtonClick) {
                self.bottomCartButtonClick();
            }
        };
    }
    return _footerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeCourseListTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeCourseListTableViewCell"];
        
//        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
}

- (void)setViewType:(JZD_HomeCourseListViewType)viewType {
    _viewType = viewType;
    
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (self.viewType == JZD_HomeCourseListViewTypeCourses) {
//        return 0;
//    }
//    return 120;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    JZD_HomeLanguageCourseListFooterView *footerView = [[JZD_HomeLanguageCourseListFooterView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 120)];
//
//    @weakify(self);
//    footerView.cartButtonClick = ^{
//        @strongify(self);
//        if (self.bottomCartButtonClick) {
//            self.bottomCartButtonClick();
//        }
//    };
//    return footerView;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_HomeCourseListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeCourseListTableViewCell"];
    if (self.viewType == JZD_HomeCourseListViewTypeCourses) {
        cell.cellType = JZD_HomeCourseListTableViewCellTypeGeneralPracticeNormal;
    } else {
        cell.cellType = JZD_HomeCourseListTableViewCellTypeSinglePracticeNormal;
    }
    
    @weakify(self);
    cell.applyButtonClick = ^{
        @strongify(self);
        if (self.applyButtonClick) {
            self.applyButtonClick();
        }
    };
    cell.cartButtonClick = ^{
        @strongify(self);
        if (self.cartButtonClick) {
            self.cartButtonClick();
        }
    };

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellDidSelectedAtIndexPath) {
        self.cellDidSelectedAtIndexPath(indexPath);
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
