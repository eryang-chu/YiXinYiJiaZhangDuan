//
//  JZD_PwdOrCodeLoginViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/21.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_PwdOrCodeLoginView.h"

#import "JZD_SelectBabyViewController.h"
#import "JZD_PwdOrCodeLoginViewController.h"

@interface JZD_PwdOrCodeLoginViewController ()
@property (weak, nonatomic) IBOutlet JZD_PwdOrCodeLoginView *pwdOrCodeLoginView;
@end

@implementation JZD_PwdOrCodeLoginViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);

    self.pwdOrCodeLoginView.quickLoginButtonClick = ^{
        NSLog(@"====微信登录====");
    };
    self.pwdOrCodeLoginView.forgetPwdButtonClick = ^{
        NSLog(@"====忘记密码====");
    };
    self.pwdOrCodeLoginView.getCodeButtonClick = ^(NSString *phone, JZD_PhoneCodePwdTableViewCell *cell) {
        [cell startTiming];
    };
    self.pwdOrCodeLoginView.pwdLoginButtonClick = ^(NSString *phone, NSString *pwd) {
        NSLog(@"====密码登录====");
        @strongify(self);
        JZD_SelectBabyViewController *vc = [[JZD_SelectBabyViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    self.pwdOrCodeLoginView.codeLoginButtonClick = ^(NSString *phone, NSString *code) {
        NSLog(@"====短信登录====");
    };
    // Do any additional setup after loading the view from its nib.
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
