//
//  JZD_ServeClassCommentDetailViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/10.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeClassCommentDetailView.h"
#import "JZD_ServeClassCommentDetailViewController.h"

@interface JZD_ServeClassCommentDetailViewController ()
@property (weak, nonatomic) IBOutlet JZD_ServeClassCommentDetailView *serveClassCommentDetailView;
@end

@implementation JZD_ServeClassCommentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    self.serveClassCommentDetailView.contentButtonClick = ^{
        @strongify(self);
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_ServeClassComentDetailContentViewController"];
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
