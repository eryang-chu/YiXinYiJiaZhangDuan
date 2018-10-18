//
//  JZD_AccountChaFenViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountChaFenViewController.h"

@interface JZD_AccountChaFenViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *campusView;
@property (weak, nonatomic) IBOutlet UIButton *campusButton;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *campusRightImage;

@property (weak, nonatomic) IBOutlet UIView *courseView;
@property (weak, nonatomic) IBOutlet UIButton *courseButton;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UIImageView *courseRightImage;

@property (weak, nonatomic) IBOutlet UIView *numberView;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@end

@implementation JZD_AccountChaFenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.campusView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.courseView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.numberView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    self.campusButton.selected = NO;
    self.courseButton.selected = NO;
    
    [self.checkButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    self.numberTextField.delegate = self;
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 校区
- (IBAction)campusButtonClick:(UIButton *)sender {
    [self.numberTextField resignFirstResponder];

    if (!self.campusButton.selected) {
        [UIView animateWithDuration:0.5f animations:^{
            self.campusRightImage.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        self.campusButton.selected = YES;
    } else {
        [UIView animateWithDuration:0.5f animations:^{
            self.campusRightImage.transform = CGAffineTransformIdentity;
        }];
        self.campusButton.selected = NO;
    }
}
#pragma mark - 科目
- (IBAction)courseButtonClick:(UIButton *)sender {
    [self.numberTextField resignFirstResponder];
    
    if (!self.courseButton.selected) {
        [UIView animateWithDuration:0.5f animations:^{
            self.courseRightImage.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        self.courseButton.selected = YES;
    } else {
        [UIView animateWithDuration:0.5f animations:^{
            self.courseRightImage.transform = CGAffineTransformIdentity;
        }];
        self.courseButton.selected = NO;
    }
    
}

#pragma mark - 查询
- (IBAction)checkButtonClick:(id)sender {
    NSLog(@"====查询====");
    [self.numberTextField resignFirstResponder];
    
    //JZD_AccountChaFenResultViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountChaFenResultViewController"];
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
