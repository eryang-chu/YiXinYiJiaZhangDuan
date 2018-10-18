//
//  JZD_AccountBabyInfoViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountBabySexView.h"
#import "JZD_FirstLoginPromptView.h"
#import "JZD_AccountBabyBasicInfoView.h"

#import "JZD_ModifyPhoneViewController.h"
#import "JZD_AccountBabyInfoViewController.h"

@interface JZD_AccountBabyInfoViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountBabyBasicInfoView *accountBabyInfoView;
@property (nonatomic, strong) JZD_FirstLoginPromptView *promptView;
@property (nonatomic, strong) JZD_AccountBabySexView *babySexView;
@property (nonatomic, strong) UIView *backGroundView;
@end

@implementation JZD_AccountBabyInfoViewController

- (JZD_FirstLoginPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_FirstLoginPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 100)];
        
        
        
        @weakify(self);
        _promptView.sureButtonClick = ^{
            NSLog(@"====确认按钮====");
            @strongify(self);
            [self removePromptView];
        };
    }
    return _promptView;
}
- (JZD_AccountBabySexView *)babySexView {
    if (!_babySexView) {
        _babySexView = [[JZD_AccountBabySexView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 150)];
        
        
        
        @weakify(self);
        _babySexView.sureButtonClick = ^(UIButton *button) {
            NSLog(@"====确认按钮====");
            @strongify(self);
            [self removePromptView];
        };
        _babySexView.cancelButtonClick = ^{
            NSLog(@"====取消按钮====");
            @strongify(self);
            [self removePromptView];
        };
    }
    return _babySexView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [_backGroundView addGestureRecognizer:tap];
    }
    return _backGroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.accountBabyInfoView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountBabyInfoView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        NSLog(@"====account====");
        if (index.row == 4) {
            self.promptView.viewType = JZD_FirstLoginPromptViewTypeAccountInputBabyName;
            self.promptView.height = 160;
            [self addPromptView];
        } else if (index.row == 5) {
            [self addBabySexView];
        } else if (index.row == 1) {
            NSLog(@"====修改手机号====");
            [self setHidesBottomBarWhenPushed:YES];
            [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_ModifyPhoneViewController"];
            [self setHidesBottomBarWhenPushed:YES];
        }
        
    };
    // Do any additional setup after loading the view.
}

#pragma mark - 弹出提示框
- (void)addPromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView];
    self.promptView.center = [UIApplication sharedApplication].keyWindow.center;
}
- (void)addBabySexView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.babySexView];
    self.babySexView.bottom = [UIApplication sharedApplication].keyWindow.bottom;
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
    [self.babySexView removeFromSuperview];
}

#pragma mark - 手势
- (void)tapGesture {
    [self removePromptView];
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
