//
//  JZD_AccountRefundDetailsViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountRefundDetailsView.h"
#import "JZD_AccountRefundDetailsViewController.h"

@interface JZD_AccountRefundDetailsViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountRefundDetailsView *accountRefundDetailsView;

@end

@implementation JZD_AccountRefundDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.accountRefundDetailsView.backButtonClick = ^{
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
