//
//  JZD_HomeView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseTableViewCell.h"
#import "JZD_HomeContentTableViewCell.h"
#import "JZD_HomeMoreTableViewCell.h"
#import "JZD_HomeImageTableViewCell.h"
#import "IJXF_AdvertisingView.h"
#import "JZD_HomeView.h"

@interface JZD_HomeView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) IJXF_AdvertisingView *advertisingView;
@property (nonatomic, strong) NSArray *advertisingArr;
@end

@implementation JZD_HomeView

- (NSArray *)advertisingArr {
    if (!_advertisingArr) {
        _advertisingArr = @[@"ic_guanyuwe", @"ic_tuijan", @"ic_guanyuwe", @"ic_tuijan"];
    }
    return _advertisingArr;
}

- (IJXF_AdvertisingView *)advertisingView {
    if (!_advertisingView) {
        _advertisingView = [[IJXF_AdvertisingView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 170)];
        [_advertisingView _loadDataWithImageArray:self.advertisingArr targetView:self];
        [_advertisingView _startAnimation];
    }
    return _advertisingView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.advertisingView;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeCourseTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeCourseTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeContentTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeImageTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeMoreTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeMoreTableViewCell"];
        
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
    if (!indexPath.row) {
        return 180;
    } else if (indexPath.row == 1) {
        return 135;
    } else if (indexPath.row == 2) {
        return 50;
    }
    return 85;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_HomeCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeCourseTableViewCell"];
        
        @weakify(self);
        cell.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
            @strongify(self);
            if (self.courseCellDidSelectedAtIndex) {
                self.courseCellDidSelectedAtIndex(index);
            }
        };
        
        return cell;
    } else if (indexPath.row == 1) {
        JZD_HomeImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeImageTableViewCell"];
        
        @weakify(self);
        cell.buttonOneClick = ^{
            @strongify(self);
            if (self.advertisingOneClick) {
                self.advertisingOneClick();
            }
        };
        cell.buttonTwoClick = ^{
            @strongify(self);
            if (self.advertisingTwoClick) {
                self.advertisingTwoClick();
            }
        };
        
        return cell;
    } else if (indexPath.row == 2) {
        JZD_HomeMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeMoreTableViewCell"];
        
        @weakify(self);
        cell.moreContentButtonClick = ^{
            @strongify(self);
            if (self.moreContentButtonClick) {
                self.moreContentButtonClick();
            }
        };
        
        return cell;
    } else {
        JZD_HomeContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeContentTableViewCell"];
        
        return cell;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.contentCellDidSelectedAtIndex) {
        self.contentCellDidSelectedAtIndex(indexPath);
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
