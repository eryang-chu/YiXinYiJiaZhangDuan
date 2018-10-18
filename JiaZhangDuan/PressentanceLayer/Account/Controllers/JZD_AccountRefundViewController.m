//
//  JZD_AccountRefundViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountRefundView.h"
#import "JZD_AccountRefundViewController.h"

@interface JZD_AccountRefundViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountRefundView *accountRefundView;
@property (weak, nonatomic) IBOutlet UIView *noAccountRefundView;

@end

@implementation JZD_AccountRefundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:3.0f];
    
    @weakify(self);
    self.accountRefundView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountRefundView.refundButtonClick = ^(NSIndexPath *index) {
        NSLog(@"====已退款====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountRefundDetailsViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)delayMethod {
    self.noAccountRefundView.hidden = YES;
    [self.noAccountRefundView removeFromSuperview];
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
