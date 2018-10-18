//
//  JZD_HomeOrderPaySuccessViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeOrderPaySuccessViewController.h"

@interface JZD_HomeOrderPaySuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *timetableButton;
@property (weak, nonatomic) IBOutlet UIButton *classButton;
@property (weak, nonatomic) IBOutlet UIButton *gradeButton;

@end

@implementation JZD_HomeOrderPaySuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.timetableButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.classButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    [self.gradeButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
- (IBAction)timetableButtonClick:(id)sender {
    NSLog(@"课程表");
}
- (IBAction)classButtonClick:(id)sender {
    NSLog(@"班级群");
}
- (IBAction)gradeButtonClick:(id)sender {
    NSLog(@"年级群");
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
