//
//  JZD_AccountChaFenResultViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountChaFenResultViewController.h"

@interface JZD_AccountChaFenResultViewController ()
@property (weak, nonatomic) IBOutlet UIView *chaFenLoadingView;
@property (weak, nonatomic) IBOutlet UIView *chafenResultView;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation JZD_AccountChaFenResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self  performSelector:@selector(removeLoadingView) withObject:nil afterDelay:5.0f];
    // Do any additional setup after loading the view.
}

#pragma mark - 添加加载中视图
- (void)addLoadingView {
    
}
#pragma mark - 添加加载中视图
- (void)removeLoadingView {
    [self.chaFenLoadingView removeFromSuperview];
}
#pragma mark - 添加结果视图
- (void)addCheckResultView {
    
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)checkButtonClick:(id)sender {
    NSLog(@"====继续查询====");
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
