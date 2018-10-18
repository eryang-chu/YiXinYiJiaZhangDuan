//
//  JZD_ServeClassCommentListViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassCommentListView.h"
#import "JZD_ServeClassCommentListViewController.h"

@interface JZD_ServeClassCommentListViewController ()
@property (weak, nonatomic) IBOutlet JZD_ServeClassCommentListView *serveClassCommentListView;

@end

@implementation JZD_ServeClassCommentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.serveClassCommentListView.classCommentDidSelectAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);//JZD_ServeClassCommentDetailViewController
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeClassCommentDetailViewController"];
        [self setHidesBottomBarWhenPushed:YES];
        
    };
    // Do any additional setup after loading the view.
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
