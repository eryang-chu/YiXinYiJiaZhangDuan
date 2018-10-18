//
//  JZD_AccountTeacherChildrenViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountTeacherChildrenPromptView.h"
#import "JZD_AccountTeacherChildrenView.h"
#import "JZD_AccountTeacherChildrenViewController.h"

@interface JZD_AccountTeacherChildrenViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountTeacherChildrenView *teacherChildrenView;

@property (nonatomic, strong) JZD_AccountTeacherChildrenPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, assign) BOOL isSelected;
@end

@implementation JZD_AccountTeacherChildrenViewController

- (JZD_AccountTeacherChildrenPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_AccountTeacherChildrenPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 150)];
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
    
    self.isSelected = NO;
    @weakify(self);
    /*@property (nonatomic, copy) void(^backButtonClick)(void);
     @property (nonatomic, copy) void(^certificationButtonClick)(void);
     @property (nonatomic, copy) void(^teacherButtonClick)(void);
     @property (nonatomic, copy) void(^studentButtonClick)(void);
     @property (nonatomic, copy) void(^incumbencyCertificationButtonClick)(void);*/
    self.teacherChildrenView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.teacherChildrenView.certificationButtonClick = ^{
        @strongify(self);
        NSLog(@"====资格证====");
    };
    self.teacherChildrenView.teacherButtonClick = ^{
        @strongify(self);
        NSLog(@"====家长====");
    };
    self.teacherChildrenView.studentButtonClick = ^{
        @strongify(self);
        NSLog(@"====孩子====");
    };
    self.teacherChildrenView.incumbencyCertificationButtonClick = ^{
        @strongify(self);
        NSLog(@"====在职证明====");
    };
    // Do any additional setup after loading the view.
}

- (IBAction)submitButtonClick:(id)sender {
    [self addPromptView];
    if (self.isSelected) {
        self.promptView.titleLabel.text = @"提交成功";
        self.promptView.subLabel.text = @"我们会尽快对您的资料进行审核";
        self.isSelected = NO;
    } else {
        self.promptView.titleLabel.text = @"您的资料正在审核中";
        self.promptView.subLabel.text = @"请勿重复提交";
        self.isSelected = YES;
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
