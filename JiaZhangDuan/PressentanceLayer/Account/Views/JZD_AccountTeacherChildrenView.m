//
//  JZD_AccountTeacherChildrenView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_TeacherChildernResidenceTableViewCell.h"
#import "JZD_TeacherChildrenCertificationTableViewCell.h"
#import "JZD_TeacherChildrenIncumbencyCertificationTableViewCell.h"
#import "JZD_ForgetPwdTopView.h"
#import "JZD_AccountTeacherChildrenView.h"

@interface JZD_AccountTeacherChildrenView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;
@end

@implementation JZD_AccountTeacherChildrenView
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
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_TeacherChildernResidenceTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_TeacherChildernResidenceTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_TeacherChildrenCertificationTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_TeacherChildrenCertificationTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_TeacherChildrenIncumbencyCertificationTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_TeacherChildrenIncumbencyCertificationTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"教师子女";
    @weakify(self);
    self.topView.backButtonClick = ^{
        @strongify(self);
        if (self.backButtonClick) {
            self.backButtonClick();
        }
    };
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        return 290;
    } else if (indexPath.row == 1) {
        return 180;
    }
    return 255;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_TeacherChildrenCertificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_TeacherChildrenCertificationTableViewCell"];
        
        @weakify(self);
        cell.certificationButtonClick = ^{
            @strongify(self);
            if (self.certificationButtonClick) {
                self.certificationButtonClick();
            }
        };
        
        return cell;
    } else if (indexPath.row == 1) {
        JZD_TeacherChildernResidenceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_TeacherChildernResidenceTableViewCell"];
        @weakify(self);
        cell.teacherButtonClick = ^{
            @strongify(self);
            if (self.teacherButtonClick) {
                self.teacherButtonClick();
            }
        };
        cell.studentButtonClick = ^{
            @strongify(self);
            if (self.studentButtonClick) {
                self.studentButtonClick();
            }
        };
        
        return cell;
    }
    JZD_TeacherChildrenIncumbencyCertificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_TeacherChildrenIncumbencyCertificationTableViewCell"];
    @weakify(self);
    cell.incumbencyCertificationButtonClick = ^{
        @strongify(self);
        if (self.incumbencyCertificationButtonClick) {
            self.incumbencyCertificationButtonClick();
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
