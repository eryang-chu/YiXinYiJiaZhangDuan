//
//  JZD_AccountPaidDetailsCourseViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/28.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountPaidDetailsCourseViewController.h"

@interface JZD_AccountPaidDetailsCourseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;

@end

@implementation JZD_AccountPaidDetailsCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.headerImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    [self.timeButton layerCornerRadius:@8 borderWidth:@1 borderColor:SYSTEM_RED_COLOR];
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)phoneButtonClick:(id)sender {
    NSLog(@"打电话");
}

- (IBAction)sureButtonClick:(id)sender {
    NSLog(@"确定预约");
}

- (IBAction)timeButtonClick:(id)sender {
    NSLog(@"选择时间");
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
