//
//  JZD_ServeClassComentDetailContentViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassComentDetailContentView.h"
#import "JZD_ServeClassComentDetailContentViewController.h"

@interface JZD_ServeClassComentDetailContentViewController ()
@property (weak, nonatomic) IBOutlet JZD_ServeClassComentDetailContentView *serveClassComentDetailContentView;

@end

@implementation JZD_ServeClassComentDetailContentViewController

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
