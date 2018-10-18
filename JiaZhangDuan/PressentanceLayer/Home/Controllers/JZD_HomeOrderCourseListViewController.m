//
//  JZD_HomeOrderCourseListViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderCourseListView.h"
#import "JZD_HomeOrderCourseListViewController.h"

@interface JZD_HomeOrderCourseListViewController ()
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet JZD_HomeOrderCourseListView *homeOrderCourseListView;

@end

@implementation JZD_HomeOrderCourseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.editButton.selected = NO;
    [self.deleteButton layerCornerRadius:nil borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Do any additional setup after loading the view.
}

#pragma mark - 删除按钮
- (IBAction)deleteButtonClick:(id)sender {
}
#pragma mark - 去结算
- (IBAction)payButtonClick:(id)sender {
}
#pragma mark - 全选按钮
- (IBAction)selectButtonClick:(id)sender {
}
#pragma mark - 返回按钮
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
#pragma mark - 编辑按钮
- (IBAction)editButtonClick:(id)sender {
    if (!self.editButton.selected) {
        self.editButton.selected = YES;
    } else {
        self.editButton.selected = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
