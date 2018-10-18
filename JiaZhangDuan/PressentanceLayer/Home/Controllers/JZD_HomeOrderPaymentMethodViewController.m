//
//  JZD_HomeOrderPaymentMethodViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderPaymentMethodView.h"
#import "JZD_HomeOrderPayOverTimePromptView.h"
#import "JZD_HomeOrderPaymentMethodViewController.h"

@interface JZD_HomeOrderPaymentMethodViewController ()
@property (weak, nonatomic) IBOutlet JZD_HomeOrderPaymentMethodView *homeOrderPaymentMethodView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) JZD_HomeOrderPayOverTimePromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@end

@implementation JZD_HomeOrderPaymentMethodViewController

- (JZD_HomeOrderPayOverTimePromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_HomeOrderPayOverTimePromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 24, 120)];
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
    
//    [self  performSelector:@selector(delayMethod) withObject:nil afterDelay:3.0f];
    // Do any additional setup after loading the view.
}

- (void)delayMethod {
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

- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
- (IBAction)payButtonClick:(id)sender {
    NSLog(@"立即支付");//
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeOrderPaySuccessViewController"];
    [self setHidesBottomBarWhenPushed:YES];
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
