//
//  JZD_HomeAllEvaluatesViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeAllEvaluatesView.h"
#import "JZD_HomeAllEvaluatesViewController.h"

@interface JZD_HomeAllEvaluatesViewController ()
@property (weak, nonatomic) IBOutlet JZD_HomeAllEvaluatesView *homeAllEvaluatesView;

@end

@implementation JZD_HomeAllEvaluatesViewController

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
