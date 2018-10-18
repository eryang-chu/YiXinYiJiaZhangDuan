//
//  JZD_HomeCourseListViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseListView.h"
#import "JZD_HomeCourseListViewController.h"

@interface JZD_HomeCourseListViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet JZD_HomeCourseListView *homeCourseListView;
@property (weak, nonatomic) IBOutlet UIButton *generalPracticeButton;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;

@end

@implementation JZD_HomeCourseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buttonSetImageAndTitle];
    
    @weakify(self);
    self.homeCourseListView.cellDidSelectedAtIndexPath = ^(NSIndexPath *index) {
        NSLog(@"点击");//
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeCourseDetailsViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    
    // Do any additional setup after loading the view.
}
- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)generalPracticeButtonClick:(id)sender {
    NSLog(@"====课程====");//
}
- (IBAction)timeButtonClick:(id)sender {
    NSLog(@"====期段====");
}

- (void)buttonSetImageAndTitle {
    UILabel *generalPracticeLabel = self.generalPracticeButton.titleLabel;
    UIImage *generalPracticeImage= self.generalPracticeButton.imageView.image;
    UILabel *timeLabel = self.timeButton.titleLabel;
    UIImage *timeImage = self.timeButton.imageView.image;
    self.generalPracticeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.generalPracticeButton sizeToFit];
    self.generalPracticeButton.titleEdgeInsets = UIEdgeInsetsMake(0, -generalPracticeImage.size.width, 0, generalPracticeImage.size.width);
    self.generalPracticeButton.imageEdgeInsets = UIEdgeInsetsMake(0, generalPracticeLabel.size.width, 0, -generalPracticeLabel.size.width);
    
    self.timeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.timeButton sizeToFit];
    self.timeButton.titleEdgeInsets = UIEdgeInsetsMake(0, -timeImage.size.width, 0, timeImage.size.width);
    self.timeButton.imageEdgeInsets = UIEdgeInsetsMake(0, timeLabel.size.width, 0, -timeLabel.size.width);
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
