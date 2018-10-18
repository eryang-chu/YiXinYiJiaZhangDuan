//
//  JZD_ServeCampusDistributionViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeCampusDistributionListView.h"
#import "JZD_ServeCampusDistributionViewController.h"

@interface JZD_ServeCampusDistributionViewController ()
@property (weak, nonatomic) IBOutlet UIView *locationView;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UIButton *nearbyButton;
@property (weak, nonatomic) IBOutlet JZD_ServeCampusDistributionListView *campusDistributionListView;
@property (weak, nonatomic) IBOutlet UILabel *currentLocationLabel;
@property (weak, nonatomic) IBOutlet UIView *changeLocationView;

@end

@implementation JZD_ServeCampusDistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.changeLocationView.hidden = YES;
    [self buttonSetImageAndTitle];
    [self.locationButton layerCornerRadius:@8 borderWidth:nil borderColor:nil];
    
    @weakify(self);
    self.campusDistributionListView.campusDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        //JZD_ServeCampusDistributionDetailViewController
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeCampusDistributionDetailViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    self.campusDistributionListView.phoneButtonDidClickAtIndexPath = ^(NSIndexPath *index) {
        
    };
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
- (IBAction)locationButtonClick:(id)sender {
    NSLog(@"====定位====");
}
- (IBAction)nearbyButtonClick:(id)sender {
    NSLog(@"====附近====");
}
- (IBAction)changeLocationButtonClick:(id)sender {
    NSLog(@"====切换位置====");
}

#pragma mark - 设置button按钮的文字图片
- (void)buttonSetImageAndTitle {
    UILabel *generalPracticeLabel = self.nearbyButton.titleLabel;
    UIImage *generalPracticeImage= self.nearbyButton.imageView.image;
    
    self.nearbyButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.nearbyButton sizeToFit];
    self.nearbyButton.titleEdgeInsets = UIEdgeInsetsMake(0, -generalPracticeImage.size.width, 0, generalPracticeImage.size.width);
    self.nearbyButton.imageEdgeInsets = UIEdgeInsetsMake(0, generalPracticeLabel.size.width, 0, -generalPracticeLabel.size.width);
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
