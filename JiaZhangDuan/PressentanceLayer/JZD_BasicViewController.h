//
//  FWEB_BasicViewController.h
//  fuwuEbao
//
//  Created by Jiao on 2018/8/7.
//  Copyright © 2018年 bornsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZD_BasicViewController : UIViewController
- (void)pushToViewControllerWithStoryBoardName:(NSString *)storyBoardName controllerId:(NSString *)controllerId;
- (void)popViewController;

@end
