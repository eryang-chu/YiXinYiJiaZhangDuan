//
//  JZD_AccountPaidDetailsViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountPaidDetailsView.h"
#import "JZD_AccountPaidDetailsViewController.h"

@interface JZD_AccountPaidDetailsViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountPaidDetailsView *accountPaidDetailsView;

@end

@implementation JZD_AccountPaidDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.accountPaidDetailsView.viewType = JZD_AccountPaidDetailsViewTypePaid;
    
    @weakify(self);
    self.accountPaidDetailsView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountPaidDetailsView.refundButtonClick = ^{
        NSLog(@"退款");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountPaidDetailsApplyRefundViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    self.accountPaidDetailsView.chooseSeatButtonClick = ^{
        NSLog(@"选座");
    };
    // Do any additional setup after loading the view.
}

- (IBAction)evaluateButtonClick:(id)sender {
    NSLog(@"立即评价");
}
- (IBAction)orderCourseButtonClick:(id)sender {
    NSLog(@"在线约课");
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_AccountPaidDetailsCourseViewController"];
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
