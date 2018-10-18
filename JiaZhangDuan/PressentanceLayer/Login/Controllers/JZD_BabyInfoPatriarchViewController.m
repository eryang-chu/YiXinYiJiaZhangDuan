//
//  JZD_BabyInfoPatriarchViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_BabyInfoPatriarchCollectionViewCell.h"
#import "JZD_FirstLoginPromptView.h"
#import "JZD_BabyInfoPatriarchView.h"

#import "MainTabBarController.h"
#import "JZD_BabyInfoPatriarchViewController.h"

@interface JZD_BabyInfoPatriarchViewController ()
@property (weak, nonatomic) IBOutlet JZD_BabyInfoPatriarchView *babyInfoPatriarchView;
@property (nonatomic, strong) NSArray *patriarchList;
@property (nonatomic, strong) JZD_FirstLoginPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UIButton *inputClassButton;
@end

@implementation JZD_BabyInfoPatriarchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

/**
 * 让状态栏样式为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSArray *)patriarchList {
    if (!_patriarchList) {
        _patriarchList = @[@"爸爸", @"妈妈", @"爷爷", @"奶奶",@"外公", @"外婆", @"其他人"];
    }
    return _patriarchList;
}

- (UIButton *)inputClassButton {
    if (!_inputClassButton) {
        _inputClassButton = [[UIButton alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 50, DEVICE_WIDTH, 50)];
        [_inputClassButton setTitle:@"进入课堂" forState:UIControlStateNormal];
        _inputClassButton.backgroundColor = SYSTEM_RED_COLOR;
        _inputClassButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_inputClassButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_inputClassButton addTarget:self action:@selector(inputClassButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _inputClassButton;
}

- (JZD_FirstLoginPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_FirstLoginPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 100)];
        
        
        
        @weakify(self);
        _promptView.servicerButtonClick = ^{
            NSLog(@"====客服电话====");
            @strongify(self);
            [self removePromptView];
        };
        
        _promptView.sureButtonClick = ^{
            NSLog(@"====确认按钮====");
            @strongify(self);
            [self removePromptView];
            
            [self.view addSubview:self.inputClassButton];
        };
    }
    return _promptView;
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
    
    self.babyInfoPatriarchView.patriarchList = self.patriarchList;
    
    @weakify(self);
    self.babyInfoPatriarchView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.babyInfoPatriarchView.patriarchsDidSelectAtIndex = ^(NSIndexPath *index, JZD_BabyInfoPatriarchCollectionViewCell *cell) {
        
        @strongify(self);
        if (index.row == 6) {
            self.promptView.viewType = JZD_FirstLoginPromptViewTypeRelationship;
            self.promptView.height = 160;
            [self addPromptView];
            
            [self.inputClassButton removeFromSuperview];
        } else {
            [self.view addSubview:self.inputClassButton];
        }
    };
    self.babyInfoPatriarchView.errorInfoButtonClick = ^{
        NSLog(@"====弹出信息有误提示框====");
        @strongify(self);
        self.promptView.viewType = JZD_FirstLoginPromptViewTypeError;
        self.promptView.height = 100;
        [self addPromptView];
    };
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - 手势
- (void)tapGesture {
    [self removePromptView];
}

#pragma mark - 进入课堂
- (void)inputClassButtonClick {
    NSLog(@"====进入课堂====");
    
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MainTabBarController *tab = [story instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tab;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
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
