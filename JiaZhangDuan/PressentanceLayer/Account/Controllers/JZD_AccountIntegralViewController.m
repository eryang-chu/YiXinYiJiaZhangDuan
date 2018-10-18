//
//  JZD_AccountIntegralViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/27.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountIntegralView.h"
#import "JZD_AccountIntegralViewController.h"

@interface JZD_AccountIntegralViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountIntegralView *accountIntegralVie;

@end

@implementation JZD_AccountIntegralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.accountIntegralVie.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.accountIntegralVie.timeButtonClick = ^{
        NSLog(@"选择日期");
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
