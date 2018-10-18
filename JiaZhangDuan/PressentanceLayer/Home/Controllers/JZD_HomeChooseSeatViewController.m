//
//  JZD_HomeChooseSeatViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/17.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeChooseSeatCollectionView.h"
#import "JZD_HomeChooseSeatViewController.h"

@interface JZD_HomeChooseSeatViewController ()
@property (weak, nonatomic) IBOutlet JZD_HomeChooseSeatCollectionView *chooseSeatCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *campusLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *classroomLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@end

@implementation JZD_HomeChooseSeatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.chooseSeatCollectionView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);
    };
    // Do any additional setup after loading the view.
}

- (IBAction)sureButtonClick:(id)sender {
    NSLog(@"====确认选座====");
}
- (IBAction)backButtonClick:(id)sender {
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
