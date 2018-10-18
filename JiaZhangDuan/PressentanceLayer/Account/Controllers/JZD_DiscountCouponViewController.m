//
//  JZD_DiscountCouponViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountDiscountCouponView.h"
#import "JZD_DiscountCouponViewController.h"

@interface JZD_DiscountCouponViewController ()
@property (weak, nonatomic) IBOutlet UIView *noDiscountCouponView;
@property (weak, nonatomic) IBOutlet JZD_AccountDiscountCouponView *accountDiscountCouponView;

@end

@implementation JZD_DiscountCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self  performSelector:@selector(delayMethod) withObject:nil afterDelay:5.0f];

    @weakify(self);
    self.accountDiscountCouponView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    self.accountDiscountCouponView.enableButtonClick = ^{
        @strongify(self);
        NSLog(@"====可使用====");
    };
    
    self.accountDiscountCouponView.usedButtonClick = ^{
        @strongify(self);
        NSLog(@"====已使用====");
    };
    
    self.accountDiscountCouponView.expiredButtonClick = ^{
        @strongify(self);
        NSLog(@"====已过期====");
    };
    
    // Do any additional setup after loading the view.
}

- (void)delayMethod {
    self.noDiscountCouponView.hidden = YES;
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
