//
//  JZD_AccountChangeBabyViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/26.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_AccountChangeBabyView.h"
#import "JZD_AccountChangeBabyViewController.h"

@interface JZD_AccountChangeBabyViewController ()
@property (weak, nonatomic) IBOutlet JZD_AccountChangeBabyView *changeBabyView;
@property (nonatomic, strong) NSArray *babyList;
@end

@implementation JZD_AccountChangeBabyViewController

- (NSArray *)babyList {
    if (!_babyList) {
        _babyList = @[@{@"image":@"ic_head",@"name":@"张小天"},@{@"image":@"ic_head",@"name":@"张小天"},@{@"image":@"ic_morenhead",@"name":@"张小爱"}];
    }
    return _babyList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.changeBabyView.babyList = self.babyList;
    @weakify(self);
    self.changeBabyView.babyDidSelectAtIndex = ^(NSIndexPath *index) {
        NSLog(@"====选择baby====");
    };
    
    
    self.changeBabyView.backButtonClick = ^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    };
    // Do any additional setup after loading the view.
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
