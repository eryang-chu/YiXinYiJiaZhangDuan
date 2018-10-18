//
//  JZD_HomeCourseDetailsView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ClassIntroduceTableViewCell.h"
#import "JZD_CourseEvaluateTableViewCell.h"
#import "JZD_HomeCourseListTableViewCell.h"
#import "JZD_HomeCourseHeaderView.h"
#import "JZD_HomeCourseDetailsView.h"

@interface JZD_HomeCourseDetailsView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JZD_HomeCourseHeaderView *headerView;
@property (nonatomic, strong) NSString *introduce;
@end

@implementation JZD_HomeCourseDetailsView
- (JZD_HomeCourseHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[JZD_HomeCourseHeaderView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 100)];
    }
    return _headerView;
}

- (void)setViewType:(JZD_HomeCourseDetailsViewType)viewType {
    _viewType = viewType;
    
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = HEX_COLOR(0xf2f2f2);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_ClassIntroduceTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_ClassIntroduceTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_CourseEvaluateTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_CourseEvaluateTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_HomeCourseListTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_HomeCourseListTableViewCell"];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    
    @weakify(self);
    self.headerView.languageButtonClick = ^{
        @strongify(self);
        if (self.languageButtonClick) {
            self.languageButtonClick();
        }
        
        [self.tableView reloadData];
    };
    self.headerView.mathButtonClick = ^{
        @strongify(self);
        if (self.mathButtonClick) {
            self.mathButtonClick();
        }
        
        [self.tableView reloadData];
    };
    self.headerView.classButtonClick = ^{
        @strongify(self);
        if (self.classButtonClick) {
            self.classButtonClick();
        }
        self.introduce = @"class";
        
        [self.tableView reloadData];
    };
    self.headerView.teacherButtonClick = ^{
        @strongify(self);
        if (self.teacherButtonClick) {
            self.teacherButtonClick();
        }
        self.introduce = @"teacher";
        
        [self.tableView reloadData];
    };
    self.headerView.courseButtonClick = ^{
        @strongify(self);
        if (self.courseButtonClick) {
            self.courseButtonClick();
        }
        self.introduce = @"course";
        
        [self.tableView reloadData];
    };
}

#pragma mark - TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.section) {
        return 180;
    }else {
        if ([self.introduce isEqualToString:@"course"]) {
            if (!indexPath.row) {
                return 180;
            }
            return 90;
        } else {
            return 150;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!section) {
        return 1;
    } else {
        if ([self.introduce isEqualToString:@"course"]) {
            return 2;
        }
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.section) {
        JZD_HomeCourseListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_HomeCourseListTableViewCell"];
        cell.cellType = JZD_HomeCourseListTableViewCellTypeGeneralPracticeDetails;
        
        return cell;
    } else {
        if ([self.introduce isEqualToString:@"course"]) {
            JZD_CourseEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_CourseEvaluateTableViewCell"];
            
            if (!indexPath.row) {
                //
                cell.cellType = JZD_CourseEvaluateTableViewCellTypeImages;
            } else {
                cell.cellType = JZD_CourseEvaluateTableViewCellTypeNoImage;
            }
            return cell;
        } else {
            //
            JZD_ClassIntroduceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_ClassIntroduceTableViewCell"];
            return cell;
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section) {
        if (self.viewType == JZD_HomeCourseDetailsViewTypeCourses) {
            self.headerView.viewType = JZD_HomeCourseHeaderViewTypeCourses;
        } else {
            self.headerView.viewType = JZD_HomeCourseHeaderViewTypeLanguage;
        }
        return self.headerView;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section) {
        return 100;
    }
    return 0;
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
