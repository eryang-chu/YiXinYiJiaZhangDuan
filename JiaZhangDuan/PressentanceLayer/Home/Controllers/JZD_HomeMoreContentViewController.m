//
//  JZD_HomeMoreContentViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/29.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeMoreContentView.h"
#import "JZD_HomeMoreContentViewController.h"

@interface JZD_HomeMoreContentViewController ()
@property (weak, nonatomic) IBOutlet JZD_HomeMoreContentView *homeMoreContentView;

@end

@implementation JZD_HomeMoreContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.homeMoreContentView.contentCellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeMoreContentDetailsViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
