//
//  JZD_TimeTableSwitchingSureViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_TimeTableSwitchingSureView.h"
#import "JZD_AccountTeacherChildrenPromptView.h"
#import "JZD_TimeTableSwitchingSureViewController.h"

@interface JZD_TimeTableSwitchingSureViewController ()
@property (nonatomic, strong) JZD_AccountTeacherChildrenPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (weak, nonatomic) IBOutlet JZD_TimeTableSwitchingSureView *timeTableSwitchingSureView;
@end

@implementation JZD_TimeTableSwitchingSureViewController

- (JZD_AccountTeacherChildrenPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_AccountTeacherChildrenPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 150)];
        _promptView.titleLabel.text = @"您的调课申请已提交";
        _promptView.subLabel.text = @"调课成功后会给您发送通知";
        @weakify(self);
        _promptView.sureButtonClick = ^{
            @strongify(self);
            [self removePromptView];
        };
    }
    return _promptView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
    }
    return _backGroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.timeTableSwitchingSureView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
    };
    // Do any additional setup after loading the view.
}
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
- (IBAction)sureButtonClick:(id)sender {
    NSLog(@"确认");
    [self addPromptView];
}

#pragma mark - 弹出提示框
- (void)addPromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView];
    self.promptView.center = [UIApplication sharedApplication].keyWindow.center;
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
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
