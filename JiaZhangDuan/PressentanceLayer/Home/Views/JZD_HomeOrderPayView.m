//
//  JZD_HomeOrderPayView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderlistTableViewCell.h"
#import "JZD_HomeOrderPriceTableViewCell.h"
#import "JZD_HomeOrderPayView.h"

@interface JZD_HomeOrderPayView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_HomeOrderPayView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeOrderlistTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeOrderlistTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeOrderPriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeOrderPriceTableViewCell"];
        
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
    if (indexPath.row == 1 || !indexPath.row) {
        return 200;
    }
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        JZD_HomeOrderPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeOrderPriceTableViewCell"];
        @weakify(self);
        cell.discountCouponButtonClick = ^{
            @strongify(self);
            if (self.discountCouponButtonClick) {
                self.discountCouponButtonClick();
            }
        };
        
        return cell;
    }
    JZD_HomeOrderlistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeOrderlistTableViewCell"];
    
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
