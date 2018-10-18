//
//  JZD_ServeTimeTableViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/12.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import "JZD_ServeTimeTableView.h"
#import "JZD_ServeCalendarView.h"
#import "JZD_ServeTimeTableViewController.h"

@interface JZD_ServeTimeTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UIView *courseView;
@property (weak, nonatomic) IBOutlet UIView *missClassView;
@property (weak, nonatomic) IBOutlet UIView *NoInfoView;
@property (weak, nonatomic) IBOutlet JZD_ServeTimeTableView *serveTimeTableView;
@property (weak, nonatomic) IBOutlet JZD_ServeCalendarView *serveCalendarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarViewHeight;

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSString *currentDate;
@property (nonatomic, assign) NSInteger firstDay;

@property (nonatomic, strong) NSMutableArray *dataListM;

@end

@implementation JZD_ServeTimeTableViewController

- (NSMutableArray *)dataListM {
    if (!_dataListM) {
        _dataListM = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataListM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.courseView layerCornerRadius:@12.5 borderWidth:nil borderColor:nil];
    [self.missClassView layerCornerRadius:@12.5 borderWidth:nil borderColor:nil];
    
    self.NoInfoView.hidden = YES;
    
    self.date = [NSDate date];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.currentDate = [formatter stringFromDate:[NSDate date]];
    
    @weakify(self);
    self.serveTimeTableView.leaveButtonClick = ^(NSIndexPath *index) {
        @strongify(self);//请假
    };
    self.serveTimeTableView.changeClassButtonClick = ^(NSIndexPath *index) {
        @strongify(self);//调课
        [self setHidesBottomBarWhenPushed:YES];
        [self pushToViewControllerWithStoryBoardName:@"Serve" controllerId:@"JZD_TimeTableSwitchingViewController"];
        [self setHidesBottomBarWhenPushed:YES];
    };
    self.serveTimeTableView.cancelLeaveButtonClick = ^(NSIndexPath *index) {
        @strongify(self);//取消请假
    };
    
    self.serveCalendarView.cellDidSelectedAtIndex = ^(NSIndexPath *index) {
        @strongify(self);//选择日期
    };
    
    [self getAllDaysWithCalender];
    
    self.serveCalendarView.firstday = self.firstDay;
    self.serveCalendarView.currentDate = self.currentDate;
    self.serveCalendarView.dataList = self.dataListM;
    
    if ((self.firstDay + self.dataListM.count) % 7) {
        self.calendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7 + 1);
    } else {
        self.calendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7);
    }
    

    NSString *nowString = [formatter stringFromDate:self.date];
    NSArray *nowArray = [nowString componentsSeparatedByString:@"-"];
    self.monthLabel.text = [NSString stringWithFormat:@"%@月", [nowArray objectAtIndex:1]];
    
    // Do any additional setup after loading the view.
}

// 获取当月的天数
- (NSInteger)getNumberOfDaysInMonth{
    // NSRange是一个结构体，其中location是一个以0为开始的index，length是表示对象的长度。他们都是NSUInteger类型。
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self.date];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}
// 获取当月中所有天数
- (void) getAllDaysWithCalender{
    [self.dataListM removeAllObjects];
    
    NSUInteger dayCount = [self getNumberOfDaysInMonth];//一个月的总天数
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString * str = [formatter stringFromDate:self.date];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    for (NSInteger i = 1; i <= dayCount; i++) {
        NSString * sr = [NSString stringWithFormat:@"%@-%ld",str,i];
        
        NSDate *suDate = [formatter dateFromString:sr];
        
        if (i == 1) {
            self.firstDay = [self getweekDayWithDate:suDate];
        }
        [self.dataListM addObject:suDate];
    }
}


- (NSInteger)getweekDayWithDate:(NSDate *) date{
     // 指定日历的算法
    NSDateComponents *comps = [self.calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:date];

    // 直接调用自己weekDay属性
    NSInteger weekday = [comps weekday];

    weekday--;
    NSLog(@"[comps weekday] = %ld",(long)weekday);
    if (weekday == 7) {
        return 0;
    }else
        return weekday;
}

//-(NSDate *)getNextMonthframDate:(NSDate*)date {
//    // 指定日历单位，如日期和月份。(这里指定了年月日，还有其他字段添加单位.特别齐全 ：世纪，年月日时分秒等等等)
//    NSCalendarUnit dayInfoUnits  = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//    // NSDateComponents封装了日期的组件,年月日时分秒等(个人感觉像是平时用的model模型)
//    NSDateComponents *components = [self.currentCalendar components: dayInfoUnits fromDate:date];
//    // 指定1号
//    components.day = 1;
//    // 指定月份(我这里是获取当前月份的下1个月的1号的date对象,所以用的++，其上个月或者其他同理)
//    components.month++;
//    // 转成需要的date对象return
//    NSDate * nextMonthDate =[self.currentCalendar dateFromComponents:components];
//    return nextMonthDate;
//}
//
//- (NSDate *)getLastMonthFromDate:(NSDate *)date {
//    // 指定日历单位，如日期和月份。(这里指定了年月日，还有其他字段添加单位.特别齐全 ：世纪，年月日时分秒等等等)
//    NSCalendarUnit dayInfoUnits  = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//    // NSDateComponents封装了日期的组件,年月日时分秒等(个人感觉像是平时用的model模型)
//    NSDateComponents *components = [self.currentCalendar components: dayInfoUnits fromDate:date];
//    // 指定1号
//    components.day = 1;
//    // 指定月份(我这里是获取当前月份的下1个月的1号的date对象,所以用的++，其上个月或者其他同理)
//    components.month--;
//    // 转成需要的date对象return
//    NSDate * lastMonthDate =[self.calendar dateFromComponents:components];
//    return lastMonthDate;
//}

- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}

- (IBAction)nextMonthButtonClick:(id)sender {
    NSLog(@"下个月");
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *currentMonth = [formatter stringFromDate:self.date];
    NSArray *monthArr = [currentMonth componentsSeparatedByString:@"-"];
    NSMutableArray *monthArrM = [NSMutableArray arrayWithArray:monthArr];
    NSString *monthString = [monthArrM objectAtIndex:1];
    NSString *yearString = [monthArrM objectAtIndex:0];
    
    NSString *nextStr = nil;
    if (monthString.integerValue == 12) {
        NSString *monthString2 = @"1";
        NSString *yearString2 = [NSString stringWithFormat:@"%ld", yearString.integerValue + 1];
        [monthArrM replaceObjectAtIndex:1 withObject:monthString2];
        [monthArrM replaceObjectAtIndex:0 withObject:yearString2];
        nextStr = [monthArrM componentsJoinedByString:@"-"];
    } else {
        NSString *nextString = [NSString stringWithFormat:@"%ld", monthString.integerValue + 1];
        [monthArrM replaceObjectAtIndex:1 withObject:nextString];
        nextStr = [monthArrM componentsJoinedByString:@"-"];
    }
    
    
    NSDate *nextDate = [formatter dateFromString:nextStr];
    self.date = nextDate;
    [self getAllDaysWithCalender];
    
    if ((self.firstDay + self.dataListM.count) % 7) {
        self.calendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7 + 1);
    } else {
        self.calendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7);
    }
    
    self.serveCalendarView.firstday = self.firstDay;
    self.serveCalendarView.dataList = self.dataListM;
    
    NSString *nowString = [formatter stringFromDate:self.date];
    NSArray *nowArray = [nowString componentsSeparatedByString:@"-"];
    self.monthLabel.text = [NSString stringWithFormat:@"%@月", [nowArray objectAtIndex:1]];
}

- (IBAction)lastButtonClick:(id)sender {
    NSLog(@"上个月");
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *currentMonth = [formatter stringFromDate:self.date];
    NSArray *monthArr = [currentMonth componentsSeparatedByString:@"-"];
    NSMutableArray *monthArrM = [NSMutableArray arrayWithArray:monthArr];
    NSString *monthString = [monthArrM objectAtIndex:1];
    NSString *yearString = [monthArrM objectAtIndex:0];
    NSString *lastStr = nil;
    if (monthString.integerValue == 1) {
        NSString *monthString2 = @"12";
        NSString *yearString2 = [NSString stringWithFormat:@"%ld", yearString.integerValue - 1];
        [monthArrM replaceObjectAtIndex:1 withObject:monthString2];
        [monthArrM replaceObjectAtIndex:0 withObject:yearString2];
        lastStr = [monthArrM componentsJoinedByString:@"-"];
    } else {
        NSString *monthString2 = [NSString stringWithFormat:@"%ld", monthString.integerValue - 1];
        [monthArrM replaceObjectAtIndex:1 withObject:monthString2];
        lastStr = [monthArrM componentsJoinedByString:@"-"];
    }
    
    
    NSDate *lastDate = [formatter dateFromString:lastStr];
    self.date = lastDate;
    [self getAllDaysWithCalender];
    
    if ((self.firstDay + self.dataListM.count) % 7) {
        self.calendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7 + 1);
    } else {
        self.calendarViewHeight.constant = 50 * ((self.firstDay + self.dataListM.count) / 7);
    }
    
    self.serveCalendarView.firstday = self.firstDay;
    self.serveCalendarView.dataList = self.dataListM;
    

    NSString *nowString = [formatter stringFromDate:self.date];
    NSArray *nowArray = [nowString componentsSeparatedByString:@"-"];
    self.monthLabel.text = [NSString stringWithFormat:@"%@月", [nowArray objectAtIndex:1]];
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
