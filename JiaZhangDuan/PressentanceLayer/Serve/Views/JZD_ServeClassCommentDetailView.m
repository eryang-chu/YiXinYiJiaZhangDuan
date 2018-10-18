//
//  JZD_ServeClassCommentDetailView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ClassCommentDetailTableViewCell.h"
#import "JZD_ServeClassCommentDetailEvaluateTableViewCell.h"
#import "JZD_ServeClassCommentDetailEvaluateContentTableViewCell.h"
#import "JZD_ServeClassCommentDetailView.h"

@interface JZD_ServeClassCommentDetailView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation JZD_ServeClassCommentDetailView
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ClassCommentDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ClassCommentDetailTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeClassCommentDetailEvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeClassCommentDetailEvaluateTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ServeClassCommentDetailEvaluateContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ServeClassCommentDetailEvaluateContentTableViewCell"];
        
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
    if (!indexPath.row) {
        return 250;
    } else if (indexPath.row == 1) {
        return 230;
    }
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_ClassCommentDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ClassCommentDetailTableViewCell"];
        @weakify(self);
        cell.contentButtonClick = ^{
            @strongify(self);
            if (self.contentButtonClick) {
                self.contentButtonClick();
            }
        };
        return cell;
    } else if (indexPath.row == 1) {
        JZD_ServeClassCommentDetailEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeClassCommentDetailEvaluateTableViewCell"];
        cell.score = 4;
        
        return cell;
    }
    JZD_ServeClassCommentDetailEvaluateContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ServeClassCommentDetailEvaluateContentTableViewCell"];
    
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
