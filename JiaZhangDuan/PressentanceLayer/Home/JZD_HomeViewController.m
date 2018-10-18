//
//  JZD_HomeViewController.m
//  fuwuEbao
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "JZD_HomeApi.h"

#import "JZD_HomeView.h"
#import "JZD_HomeViewController.h"

@interface JZD_HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *campusButton;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet JZD_HomeView *mainHomeView;

@end

@implementation JZD_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.campusButton.selected = NO;
    [self.searchView layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    @weakify(self);
    self.mainHomeView.courseCellDidSelectedAtIndex = ^(NSIndexPath *index) {
        NSLog(@"====课程====");//
        if (index.row == 2) {
            @strongify(self);
            [self setHidesBottomBarWhenPushed:YES];
            [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeCourseListViewController"];
            [self setHidesBottomBarWhenPushed:NO];
        } else if (!index.row) {
            @strongify(self);
            [self setHidesBottomBarWhenPushed:YES];
            [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeLanguageViewController"];
            [self setHidesBottomBarWhenPushed:NO];
        } else if (index.row == 1) {
            @strongify(self);
            [self setHidesBottomBarWhenPushed:YES];
            [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeLanguageViewController"];
            [self setHidesBottomBarWhenPushed:NO];
        }
    };
    self.mainHomeView.advertisingOneClick = ^{
        NSLog(@"====广告一====");
    };
    self.mainHomeView.advertisingTwoClick = ^{
        NSLog(@"====广告二====");
    };
    self.mainHomeView.contentCellDidSelectedAtIndex = ^(NSIndexPath *index) {
        NSLog(@"====内容推荐====");//
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeMoreContentDetailsViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    self.mainHomeView.moreContentButtonClick = ^{
        NSLog(@"====更多====");
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeMoreContentViewController"];
        [self setHidesBottomBarWhenPushed:NO];
    };
    
    //获取轮播图
    [JZD_HomeApi getBannerSuccess:^(NSDictionary *dict) {
        @strongify(self);
    } failure:^(NSError *error) {
        @strongify(self);
    }];
    
    //获取通知
    [JZD_HomeApi getNoticeWithStartRows:@5 rows:@5 success:^(NSDictionary *dict) {
        @strongify(self);
    } failure:^(NSError *error) {
        @strongify(self);
    }];
    
    //推荐内容
    [JZD_HomeApi getArticleWithStartRows:@10 rows:@10 success:^(NSDictionary *dict) {
        @strongify(self);
    } failure:^(NSError *error) {
        @strongify(self);
    }];
    
    //获取学科信息
    [JZD_HomeApi getSubjectSuccess:^(NSDictionary *dict) {
        @strongify(self);
    } failure:^(NSError *error) {
        @strongify(self);
    }];
    // Do any additional setup after loading the view.
}

- (IBAction)campusButtonClick:(id)sender {
    if (!self.campusButton.selected) {
        [UIView animateWithDuration:0.5f animations:^{
            self.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        self.campusButton.selected = YES;
    } else {
        [UIView animateWithDuration:0.5f animations:^{
            self.arrowImage.transform = CGAffineTransformIdentity;
        }];
        self.campusButton.selected = NO;
    }
}

- (IBAction)searchButtonClick:(id)sender {
    NSLog(@"====跳转到搜索界面====");
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
