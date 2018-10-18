//
//  JZD_ServeTeachingReportDetailViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeTeachingReportEvaluateView.h"
#import "JZD_ServeTeachingReportDetailViewController.h"

@interface JZD_ServeTeachingReportDetailViewController ()

@property (weak, nonatomic) IBOutlet JZD_ServeTeachingReportEvaluateView *serveTeachingReportEvaluateView;
@end

@implementation JZD_ServeTeachingReportDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
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
