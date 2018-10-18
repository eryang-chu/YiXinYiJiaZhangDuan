//
//  JZD_SelectBabyViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/24.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_SelectBabyView.h"
#import "JZD_BabyInfoPatriarchViewController.h"
#import "JZD_SelectBabyViewController.h"

@interface JZD_SelectBabyViewController ()
@property (weak, nonatomic) IBOutlet JZD_SelectBabyView *selectBabyView;
@property (nonatomic, strong) NSArray *babyList;
@end

@implementation JZD_SelectBabyViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

/**
 * 让状态栏样式为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSArray *)babyList {
    if (!_babyList) {
        _babyList = @[@{@"image":@"ic_head",@"name":@"张小天"},@{@"image":@"ic_head",@"name":@"张小天"},@{@"image":@"ic_morenhead",@"name":@"张小爱"}];
    }
    return _babyList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.selectBabyView.babyDidSelectAtIndex = ^(NSIndexPath *index) {
        NSLog(@"====选择baby====");
        @strongify(self);
        JZD_BabyInfoPatriarchViewController *vc = [[JZD_BabyInfoPatriarchViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    
    self.selectBabyView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    
    self.selectBabyView.babyList = self.babyList;
    // Do any additional setup after loading the view from its nib.
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
