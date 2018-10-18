//
//  JZD_AccountObligationViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountObligationView.h"
#import "JZD_AccountObligationViewController.h"

@interface JZD_AccountObligationViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountObligationView *accountObligationView;
@property (weak, nonatomic) IBOutlet UIView *noAccountObligationView;

@end

@implementation JZD_AccountObligationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:5.0f];
    
    @weakify(self);
    self.accountObligationView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountObligationView.obligationButtonClick = ^(NSIndexPath *index) {
        NSLog(@"====待付款详情====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Account" controllerId:@"JZD_ObligationCourseDetailsViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)delayMethod {
    self.noAccountObligationView.hidden = YES;
    [self.noAccountObligationView removeFromSuperview];
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
