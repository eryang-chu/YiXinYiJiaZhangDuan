//
//  JZD_HomeOrderPaymentMethodView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderPayCourseTableViewCell.h"
#import "JZD_HomeOrderPaymentMethodTableViewCell.h"
#import "JZD_HomeOrderPaymentMethodView.h"

@interface JZD_HomeOrderPaymentMethodView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_HomeOrderPaymentMethodView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeOrderPayCourseTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeOrderPayCourseTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeOrderPaymentMethodTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeOrderPaymentMethodTableViewCell"];
        
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
        return 65;
    }
    return 238;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        JZD_HomeOrderPaymentMethodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeOrderPaymentMethodTableViewCell"];
        
        return cell;
    }
    JZD_HomeOrderPayCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeOrderPayCourseTableViewCell"];
    
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
