//
//  JZD_ModifyPhoneView.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_PhoneCodePwdTableViewCell.h"
#import "JZD_LoginButtonTableViewCell.h"
#import "JZD_ForgetPwdTopView.h"
#import "JZD_ModifyPhoneView.h"

@interface JZD_ModifyPhoneView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *authCode;
@property (nonatomic, strong) JZD_ForgetPwdTopView *topView;
@end
@implementation JZD_ModifyPhoneView
- (JZD_ForgetPwdTopView *)topView {
    if (!_topView) {
        _topView = [[JZD_ForgetPwdTopView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 64)];
    }
    return _topView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y - 20, self.bounds.size.width, self.bounds.size.height + 20)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.topView;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_PhoneCodePwdTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"JZD_LoginButtonTableViewCell" bundle:nil] forCellReuseIdentifier:@"JZD_LoginButtonTableViewCell"];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [_tableView addGestureRecognizer:tap];
        _tableView.tableFooterView = [UIView new];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}
- (void)tapGesture {
    [self endEditing:YES];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.tableView];
    
    self.topView.titleLabel.text = @"修改手机号";
    @weakify(self);
    self.topView.backButtonClick = ^{
        @strongify(self);
        if (self.backButtonClick) {
            self.backButtonClick();
        }
    };
}

#pragma mark - TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        return 95;
    }
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.row) {
        JZD_PhoneCodePwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        cell.cellType = JZD_PhoneCodePwdTableViewCellTypeModifyPhone;
        cell.titleLabel.text = @"新手机号";
        cell.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        cell.inputTextField.placeholder = @"请输入您要绑定的手机号";
        @weakify(self);
        cell.textFieldDidChange = ^(UITextField *textfield) {
            @strongify(self);
            self.phone = textfield.text ?: @"";
        };
        
        return cell;
    } else if (indexPath.row == 1) {
        JZD_PhoneCodePwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_PhoneCodePwdTableViewCell"];
        cell.titleLabel.text = @"验证码";
        cell.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
        cell.cellType = JZD_PhoneCodePwdTableViewCellTypeModifyPhoneCode;
        @weakify(self);
        cell.textFieldDidChange = ^(UITextField *textfield) {
            @strongify(self);
            self.authCode = textfield.text ?: @"";
        };
        cell.codeButtonClick = ^(JZD_PhoneCodePwdTableViewCell *cell) {
            @strongify(self);
            if (self.getCodeButtonClick) {
                self.getCodeButtonClick(self.phone, cell);
            }
        };
        
        return cell;
    } else {
        JZD_LoginButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JZD_LoginButtonTableViewCell"];
        [cell.loginButton setTitle:@"确认绑定" forState:UIControlStateNormal];
        @weakify(self);
        cell.loginButtonClick = ^{
            @strongify(self);
            if (self.sureButtonClick) {
                self.sureButtonClick(self.phone, self.authCode);
            }
        };
        
        return cell;
    }
    return 0;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
