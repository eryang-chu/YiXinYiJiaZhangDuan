//
//  JZD_ServeClassConditionListViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/9.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassConditionListView.h"
#import "JZD_ServeClassConditionListViewController.h"

@interface JZD_ServeClassConditionListViewController ()
@property (weak, nonatomic) IBOutlet JZD_ServeClassConditionListView *ServeClassConditionListView;

@end

@implementation JZD_ServeClassConditionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.ServeClassConditionListView.reportDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//JZD_ServeClassConditionDetailViewController
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeClassConditionDetailViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

- (IBAction)backButttonClick:(id)sender {
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
