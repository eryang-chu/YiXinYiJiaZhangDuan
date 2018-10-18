//
//  JZD_TimeTableSwitchingViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_TimeTableSelectTimePromptView.h"
#import "JZD_TimeTableSwitchingViewController.h"

@interface JZD_TimeTableSwitchingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectTimeLabel;

@property (nonatomic, strong) JZD_TimeTableSelectTimePromptView *promptView;
@property (nonatomic, strong) UIView *backGroundView;

@end

@implementation JZD_TimeTableSwitchingViewController

- (JZD_TimeTableSelectTimePromptView *)promptView {
    if (!_promptView) {
        _promptView = [[JZD_TimeTableSelectTimePromptView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 200, DEVICE_WIDTH, 200)];
        @weakify(self);
        _promptView.cellDidSelectAtIndexPath = ^(NSIndexPath *index) {
            @strongify(self);
            [self removePromptView];
            self.selectTimeLabel.text = @"6月1日（周二）  09:00—11:00";
        };
    }
    return _promptView;
}

- (UIView *)backGroundView {
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:.3 alpha:.6];
    }
    return _backGroundView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.headImage layerCornerRadius:@20 borderWidth:nil borderColor:nil];
    // Do any additional setup after loading the view.
}
- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
- (IBAction)switchTimeButtonClick:(id)sender {
    NSLog(@"====选择时间====");
    [self addPromptView];
}
- (IBAction)doneButtonClick:(id)sender {
    NSLog(@"====下一步====");//JZD_TimeTableSwitchingSureViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_TimeTableSwitchingSureViewController"];
    [self setHidesBottomBarWhenPushed:YES];
}

#pragma mark - 弹出提示框
- (void)addPromptView {
    [[UIApplication sharedApplication].keyWindow addSubview:self.backGroundView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.promptView];
}

#pragma mark - 移除提示框
- (void)removePromptView {
    [self.backGroundView removeFromSuperview];
    [self.promptView removeFromSuperview];
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
