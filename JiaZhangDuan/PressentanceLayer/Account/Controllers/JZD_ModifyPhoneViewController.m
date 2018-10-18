//
//  JZD_ModifyPhoneViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_ModifyPhoneView.h"
#import "JZD_ModifyPhoneViewController.h"

@interface JZD_ModifyPhoneViewController ()
@property (weak, nonatomic) IBOutlet JZD_ModifyPhoneView *modifyPhoneView;

@end

@implementation JZD_ModifyPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.modifyPhoneView.getCodeButtonClick = ^(NSString *phone, JZD_PhoneCodePwdTableViewCell *cell) {
        NSLog(@"====获取验证码====");
    };
    self.modifyPhoneView.sureButtonClick = ^(NSString *phone, NSString *code) {
        NSLog(@"====确认绑定====");
    };
    self.modifyPhoneView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    // Do any additional setup after loading the view.
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
