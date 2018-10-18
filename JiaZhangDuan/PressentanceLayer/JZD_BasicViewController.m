//
//  FWEB_BasicViewController.m
//  fuwuEbao
//
//  Created by Jiao on 2018/8/7.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "JZD_BasicViewController.h"

@interface JZD_BasicViewController ()
@property (strong, nonatomic) UIBarButtonItem *leftItem;
@end

@implementation JZD_BasicViewController

- (UIBarButtonItem *)leftItem {
    if (!_leftItem) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [btn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [btn sizeToFit];
        _leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available (iOS 11.0,*)) {
    }else{
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    NSArray *vcs = self.navigationController.viewControllers;
    if (vcs.count && vcs[0] != self) {
        self.navigationItem.leftBarButtonItem = self.leftItem;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }
    
    //设置导航栏状态栏颜色
    self.navigationController.navigationBar.barTintColor = HEX_COLOR(0x0d4da0);
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    // Do any additional setup after loading the view.
}

#pragma mark - 界面跳转
- (void)pushToViewControllerWithStoryBoardName:(NSString *)storyBoardName controllerId:(NSString *)controllerId {
    //获取storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    //获取viewController
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:controllerId];
    //push
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)popViewController {
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
