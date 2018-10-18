//
//  JZD_HomeCourseDetailsViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/9/30.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_HomeCourseDetailsView.h"
#import "JZD_HomeCourseDetailsViewController.h"

@interface JZD_HomeCourseDetailsViewController ()
@property (weak, nonatomic) IBOutlet JZD_HomeCourseDetailsView *homeCourseDetailsView;
@property (nonatomic, strong) UIButton *applyButton;
@property (nonatomic, strong) UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation JZD_HomeCourseDetailsViewController

- (UIView *)bottomView {
    if (!_bottomView) {
        
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICE_HEIGHT - 50, DEVICE_WIDTH, 50)];
        _bottomView.backgroundColor = SYSTEM_RED_COLOR;
        UIButton *applyButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, DEVICE_WIDTH - 10, 40)];
        applyButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [applyButton setTitle:@"立即报名" forState:UIControlStateNormal];
        [applyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [applyButton addTarget:self action:@selector(applyButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:applyButton];
    }
    return _bottomView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.bottomView];
    
    switch (self.vcType) {
        case JZD_HomeCourseDetailsViewControllerTypeCourses:
            self.titleLabel.text = @"全科课程";
            self.homeCourseDetailsView.viewType = JZD_HomeCourseDetailsViewTypeCourses;
            break;
        case JZD_HomeCourseDetailsViewControllerTypeLanguage:
            self.titleLabel.text = @"语文课程";
            self.homeCourseDetailsView.viewType = JZD_HomeCourseDetailsViewTypeLanguage;
            break;
        case JZD_HomeCourseDetailsViewControllerTypeEnglish:
            self.titleLabel.text = @"外教课程";
            self.homeCourseDetailsView.viewType = JZD_HomeCourseDetailsViewTypeLanguage;
            break;
            
        default:
            break;
    }
    
    /*@property (nonatomic, copy) void (^languageButtonClick)(void);
     @property (nonatomic, copy) void (^mathButtonClick)(void);
     @property (nonatomic, copy) void (^classButtonClick)(void);
     @property (nonatomic, copy) void (^teacherButtonClick)(void);
     @property (nonatomic, copy) void (^courseButtonClick)(void);*/
    @weakify(self);
    self.homeCourseDetailsView.languageButtonClick = ^{
        
    };
    self.homeCourseDetailsView.mathButtonClick = ^{
        
    };
    self.homeCourseDetailsView.classButtonClick = ^{
        
    };
    self.homeCourseDetailsView.teacherButtonClick = ^{
        
    };
    self.homeCourseDetailsView.courseButtonClick = ^{
        
    };
    self.homeCourseDetailsView.cellDidSelectedAtIndexPath = ^(NSIndexPath *index) {
        @strongify(self);
        if (index.section) {
            [self setHidesBottomBarWhenPushed:YES];
            [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeAllEvaluatesViewController"];
            [self setHidesBottomBarWhenPushed:YES];
        }
    };
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 立即报名
- (void)applyButtonClick {
    NSLog(@"====立即报名====");
    [self setHidesBottomBarWhenPushed:YES];
    [self pushToViewControllerWithStoryBoardName:@"Home" controllerId:@"JZD_HomeOrderPayViewController"];
    [self setHidesBottomBarWhenPushed:YES];
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
