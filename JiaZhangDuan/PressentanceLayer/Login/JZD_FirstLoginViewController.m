//
//  JZD_FirstLoginViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 楚二洋. All rights reserved.
//
#import "JZD_UserApi.h"

#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_FirstLoginView.h"
#import "JZD_FirstLoginPromptView.h"

#import "JZD_ForgetPwdPhoneViewController.h"
#import "JZD_PwdOrCodeLoginViewController.h"
#import "JZD_FirstLoginViewController.h"

@interface JZD_FirstLoginViewController ()
@property (weak, nonatomic) IBOutlet JZD_FirstLoginView *firstLoginView;
@property (nonatomic, strong) JZD_FirstLoginPromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) JZD_PhoneCodePwdTableViewCell *cell;
@end

@implementation JZD_FirstLoginViewController

- (JZD_FirstLoginPromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_FirstLoginPromptView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH - 30, 160)];
        
        _promptView.viewType = JZD_FirstLoginPromptViewTypeModifyPwd;
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
    self.firstLoginView.quickLoginButtonClick = ^{
        NSLog(@"====快捷登录====");
    };
    
    self.firstLoginView.loginButtonClick = ^(NSString *phone, NSString *code) {
        NSLog(@"====登录====");
        [self addPromptView];
    };
    
    self.firstLoginView.getCodeButtonClick = ^(NSString *account, JZD_PhoneCodePwdTableViewCell *cell) {
        NSLog(@"====获取验证码====");
        if (![FWEB_CommonTools isMobileNumber:account]) {
            //提示
            [self.view makeToast:@"请输入正确的手机号码" duration:1 position:CSToastPositionCenter];
        } else {
            [cell startTiming];
            self.cell = cell;
            [JZD_UserApi sendMsgCodeWithPhone:account success:^{
                [self.view makeToast:@"验证码已发送" duration:1 position:CSToastPositionCenter];
            } failure:^(NSError *error) {
                
            }];
        }
    };
    
    self.promptView.modifyPwdButtonClick = ^{
        NSLog(@"====好的====");
        @strongify(self);
        [self removePromptView];
        JZD_ForgetPwdPhoneViewController *vc = [[JZD_ForgetPwdPhoneViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    self.promptView.noModifyPwdButtonClick = ^{
        NSLog(@"====不了，下次再说====");
        @strongify(self);
        [self removePromptView];
        JZD_PwdOrCodeLoginViewController *vc = [[JZD_PwdOrCodeLoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
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

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
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
