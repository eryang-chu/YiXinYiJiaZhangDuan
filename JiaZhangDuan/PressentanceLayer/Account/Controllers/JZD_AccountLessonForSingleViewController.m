//
//  JZD_AccountLessonForSingleViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountLessonForSingleView.h"
#import "JZD_AccountLessonForSingleViewController.h"

@interface JZD_AccountLessonForSingleViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountLessonForSingleView *accountLessonForSingleView;
@property (weak, nonatomic) IBOutlet UIView *noLessonForSingleView;
@end

@implementation JZD_AccountLessonForSingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:5.0f];
    
    @weakify(self);
    self.accountLessonForSingleView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountLessonForSingleView.actionButtonClick = ^(NSIndexPath *index) {
        NSLog(@"====查看课程====");
        
    };
    self.accountLessonForSingleView.allButtonClick = ^{
        NSLog(@"====全部====");
    };
    self.accountLessonForSingleView.obligationButtonClick = ^{
        NSLog(@"====待付款====");
    };
    self.accountLessonForSingleView.paidButtonClick = ^{
        NSLog(@"====已付款====");
    };
    self.accountLessonForSingleView.refundButtonClick = ^{
        NSLog(@"====退款====");
    };
    // Do any additional setup after loading the view.
}
- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)delayMethod {
    self.noLessonForSingleView.hidden = YES;
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
