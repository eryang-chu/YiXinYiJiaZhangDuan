//
//  JZD_HomeLanguageViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/8.
//  Copyright © 2018年 楚二洋. All rights reserved.
//\]

#import "JZD_HomeApi.h"

#import "JZD_HomeCourseListView.h"
#import "JZD_HomeCourseDetailsViewController.h"
#import "JZD_HomeLanguageViewController.h"

@interface JZD_HomeLanguageViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *CourseButton;
@property (weak, nonatomic) IBOutlet UIButton *semesterButton;
@property (weak, nonatomic) IBOutlet JZD_HomeCourseListView *homeCourseListView;
@property (nonatomic, strong) UIView *footerView;
@end

@implementation JZD_HomeLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buttonSetImageAndTitle];
    
    self.homeCourseListView.viewType = JZD_HomeCourseListViewTypeLanguage;
    
    @weakify(self);
    self.homeCourseListView.cartButtonClick = ^{
        @strongify(self);
        NSLog(@"====购物车====");
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeOrderCourseListViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    self.homeCourseListView.applyButtonClick = ^{
        @strongify(self);
        NSLog(@"====立即报名====");//在线选座
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeChooseSeatViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    self.homeCourseListView.cellDidSelectedAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        NSLog(@"====课程详情====");
        [self setHidesBottomBarWhenPushed:YES];
//        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeCourseDetailsViewController"];
        //获取storyboard
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
        //获取viewController
        JZD_HomeCourseDetailsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"JZD_HomeCourseDetailsViewController"];
        
        controller.vcType = JZD_HomeCourseDetailsViewControllerTypeLanguage;

        [self.navigationController pushViewController:controller animated:YES];
        
        controller.vcType = JZD_HomeCourseDetailsViewControllerTypeLanguage;
        
        [self setHidesBottomBarWhenPushed:YES];
    };
    
    //获取期段
    [JZD_HomeApi getCourseTimeIntervalSuccess:^(NSDictionary *dict) {
        @strongify(self);
    } failure:^(NSError *error) {
        @strongify(self);
    }];
    // Do any additional setup after loading the view.
}

#pragma mark - 课程
- (IBAction)courseButtonClick:(id)sender {
    NSLog(@"课程");
}
#pragma mark - 期段
- (IBAction)semesterButtonClick:(id)sender {
    NSLog(@"期段");
    
}

#pragma mark - 返回
- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 设置button按钮的文字图片
- (void)buttonSetImageAndTitle {
    UILabel *generalPracticeLabel = self.CourseButton.titleLabel;
    UIImage *generalPracticeImage= self.CourseButton.imageView.image;
    UILabel *timeLabel = self.semesterButton.titleLabel;
    UIImage *timeImage = self.semesterButton.imageView.image;
    self.CourseButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.CourseButton sizeToFit];
    self.CourseButton.titleEdgeInsets = UIEdgeInsetsMake(0, -generalPracticeImage.size.width, 0, generalPracticeImage.size.width);
    self.CourseButton.imageEdgeInsets = UIEdgeInsetsMake(0, generalPracticeLabel.size.width, 0, -generalPracticeLabel.size.width);
    
    self.semesterButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.semesterButton sizeToFit];
    self.semesterButton.titleEdgeInsets = UIEdgeInsetsMake(0, -timeImage.size.width, 0, timeImage.size.width);
    self.semesterButton.imageEdgeInsets = UIEdgeInsetsMake(0, timeLabel.size.width, 0, -timeLabel.size.width);
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
