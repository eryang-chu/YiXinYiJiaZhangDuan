//
//  JZD_HomeMoreContentView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeContentTableViewCell.h"
#import "IJXF_AdvertisingView.h"
#import "JZD_HomeMoreContentView.h"

@interface JZD_HomeMoreContentView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) IJXF_AdvertisingView *advertisingView;
@property (nonatomic, strong) NSArray *advertisingArr;
@end

@implementation JZD_HomeMoreContentView
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
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeContentTableViewCell"];
        
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
    return 85;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZD_HomeContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeContentTableViewCell"];
    
    return cell;
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
