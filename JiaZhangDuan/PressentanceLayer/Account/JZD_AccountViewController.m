//
//  JZD_AccountViewController.m
//  fuwuEbao
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "JZD_AccountView.h"

#import "JZD_AccountBabyInfoViewController.h"
#import "JZD_AccountChangeBabyViewController.h"
#import "JZD_AccountViewController.h"

@interface JZD_AccountViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountView *accountView;
@end

@implementation JZD_AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    //登录状态
    self.accountView.viewType = JZD_AccountViewTypeLogined;
    
    @weakify(self);
    self.accountView.changeBabyButtonClick = ^{
        NSLog(@"====更换baby====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountChangeBabyViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.loginButtonClick = ^{
        NSLog(@"====登录====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountBabyInfoViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.goukedanButtonClick = ^{
        NSLog(@"====购课单====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountLessonForSingleViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.daifukuanButtonClick = ^{
        NSLog(@"====待付款====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountObligationViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.yifukuanButtonClick = ^{
        NSLog(@"====已付款====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountPaidViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.tuihuanButtonClick = ^{
        NSLog(@"====退款====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountRefundViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.youhuiquanButtonClick = ^{
        NSLog(@"====优惠券====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_DiscountCouponViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.chafenButtonClick = ^{
        NSLog(@"====查分====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountChaFenViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.jifenButtonClick = ^{
        NSLog(@"====积分====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountIntegralViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.helpButtonClick = ^{
        NSLog(@"====帮助与反馈====");
    };
    self.accountView.setButtonClick = ^{
        NSLog(@"====设置====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountSetViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.accountView.jiaoshizinvButtonClick = ^{
        NSLog(@"====教师子女====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountTeacherChildrenViewController"];
        [self setHidesBottomBarWhenPushed:NO];
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
