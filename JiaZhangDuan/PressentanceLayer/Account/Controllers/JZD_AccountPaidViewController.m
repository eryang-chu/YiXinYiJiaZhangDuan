//
//  JZD_AccountPaidViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountPaidView.h"
#import "JZD_AccountPaidViewController.h"

@interface JZD_AccountPaidViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountPaidView *accountPaidView;
@property (weak, nonatomic) IBOutlet UIView *noAccountPaidView;

@end

@implementation JZD_AccountPaidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:3.0f];
    
    @weakify(self);
    self.accountPaidView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountPaidView.cellDidSelectAtIndex = ^(NSIndexPath *index) {
        NSLog(@"====已付款详情====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountPaidDetailsViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    self.accountPaidView.evaluateButtonClick = ^(NSIndexPath *index) {
        NSLog(@"====立即评价====");
    };
    
    // Do any additional setup after loading the view.
}

- (void)delayMethod {
    self.noAccountPaidView.hidden = YES;
    [self.noAccountPaidView removeFromSuperview];
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
