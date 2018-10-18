//
//  JZD_ObligationCourseDetailsViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountSetPromptView.h"
#import "JZD_ObligationCourseDetailsView.h"
#import "JZD_ObligationCourseDetailsViewController.h"

@interface JZD_ObligationCourseDetailsViewController ()
@property (weak, nonatomic) IBOutlet JZD_ObligationCourseDetailsView *obligationCourseDetailsView;

@property (nonatomic, strong) JZD_AccountSetPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@end

@implementation JZD_ObligationCourseDetailsViewController

- (JZD_AccountSetPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_AccountSetPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 140)];
        @weakify(self);
        _promptView.cancelButtonClick = ^{
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
    self.obligationCourseDetailsView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.obligationCourseDetailsView.chooseSeatButtonClick = ^{
        NSLog(@"====重新选座====");
    };
    self.obligationCourseDetailsView.obligationButtonClick = ^{
        NSLog(@"====待付款====");
    };
    // Do any additional setup after loading the view.
}

- (IBAction)cancelButtonClick:(id)sender {
    NSLog(@"====取消订单====");
    self.promptView.promptLabel.text = @"你还没有付款，确定要取消订单吗？";
    @weakify(self);;
    self.promptView.sureButtonClick = ^{
        @strongify(self);
        [self removePromptView];
        NSLog(@"取消订单啊啊啊啊");
    };
    [self addPromptView];
}

- (IBAction)payButtonClick:(id)sender {
    NSLog(@"====去付款====");
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
