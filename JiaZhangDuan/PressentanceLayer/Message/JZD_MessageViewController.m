//
//  JZD_MessageViewController.m
//  fuwuEbao
//
//  Created by 楚二洋 on 2018/9/20.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import "JZD_MessageListView.h"
#import "JZD_MessageViewController.h"

@interface JZD_MessageViewController ()
@property (weak, nonatomic) IBOutlet JZD_MessageListView *messageListView;
@property (weak, nonatomic) IBOutlet UIView *noMessagesView;

@end

@implementation JZD_MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"消息";
    
    [self  performSelector:@selector(delayMethod) withObject:nil afterDelay:3.0f];
    // Do any additional setup after loading the view.
}

- (IBAction)addressBookButtonClick:(id)sender {
    NSLog(@"====通讯录====");//JZD_MessageAddressBookListViewController
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Message" controllerId:@"JZD_MessageAddressBookListViewController"];
    [self setHidesBottomBarWhenPushed:NO];
}

- (void)delayMethod {
    self.noMessagesView.hidden = YES;
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
