//
//  FWEB_ServeViewController.m
//  fuwuEbao
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "JZD_ServeViewController.h"

@interface JZD_ServeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *serviceButton;

@end

@implementation JZD_ServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"服务";
    
    self.serviceButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    // Do any additional setup after loading the view.
}

#pragma mark - 客服
- (IBAction)serviceButtonClick:(id)sender {
}
#pragma mark - 课程表
- (IBAction)classScheduleButtonClick:(id)sender {
    //JZD_TimeTableSwitchingViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeTimeTableViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}
#pragma mark - 到课情况
- (IBAction)conditionButtonClick:(id)sender {
    //JZD_ServeClassConditionListViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeClassConditionListViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}
#pragma mark - 教学报告
- (IBAction)reportButtonClick:(id)sender {
    //JZD_ServeTeachingReportViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeTeachingReportViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}
#pragma mark - 校区分布
- (IBAction)campusButtonClick:(id)sender {
    //JZD_ServeCampusDistributionViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeCampusDistributionViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}
#pragma mark - 课堂点评
- (IBAction)calssCommentButtonClick:(id)sender {
    //JZD_ServeClassCommentListViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeClassCommentListViewController"];
    [self setHidesBottomBarWhenPushed:NO];
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
