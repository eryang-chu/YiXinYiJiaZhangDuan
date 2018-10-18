//
//  JZD_AccountPaidDetailsApplyRefundViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountSetPromptView.h"
#import "JZD_AccountPaidDetailsApplyRefundView.h"
#import "JZD_AccountPaidDetailsApplyRefundViewController.h"

@interface JZD_AccountPaidDetailsApplyRefundViewController ()
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet JZD_AccountPaidDetailsApplyRefundView *accountPaidDetailsApplyRefundView;
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (nonatomic, strong) JZD_AccountSetPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@end

@implementation JZD_AccountPaidDetailsApplyRefundViewController

- (JZD_AccountSetPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_AccountSetPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 140)];
        _promptView.promptLabel.text = @"是否确定申请退款？";
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
    
    self.allSelectButton.selected = NO;
    @weakify(self);
    self.accountPaidDetailsApplyRefundView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    // Do any additional setup after loading the view.
}
- (IBAction)applyRefundButtonClick:(id)sender {
    NSLog(@"申请退款");
    @weakify(self);
    self.promptView.sureButtonClick = ^{
        @strongify(self);
        [self removePromptView];
        NSLog(@"申请退款");
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountRefundDetailsViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    [self addPromptView];
}
- (IBAction)allSelectButtonClick:(id)sender {
    NSLog(@"全选按钮点击");
    if (!self.allSelectButton.selected) {
        self.allSelectButton.selected = YES;
    } else {
        self.allSelectButton.selected = NO;
    }
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
