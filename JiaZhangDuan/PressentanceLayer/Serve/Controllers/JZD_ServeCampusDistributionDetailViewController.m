//
//  JZD_ServeCampusDistributionDetailViewController.m
//  JiaZhangDuan
//
//  Created by 楚二洋 on 2018/10/11.
//  Copyright © 2018年 楚二洋. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "JZD_ServeCampusDistributionDetailViewController.h"

//系统版本号是否大于8.0
#define IS_SystemVersionGreaterThanEight  ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)

@interface JZD_ServeCampusDistributionDetailViewController () <MKMapViewDelegate, CLLocationManagerDelegate, MKAnnotation>
@property (weak, nonatomic) IBOutlet MKMapView *locationView;
@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;  //!< 要导航的坐标
@end

@implementation JZD_ServeCampusDistributionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationView.delegate = self;
    
    //导航到深圳火车站
    self.coordinate = CLLocationCoordinate2DMake(29.50251, 106.450218);
    
//    [self.locationView setUserTrackingMode:MKUserTrackingModeFollow];
//
//    self.locationManager = [[CLLocationManager alloc] init];
//    [self.locationManager requestAlwaysAuthorization];
//
//    CLLocationCoordinate2D coordinate = {30.26667, 120.20000};
//    [self.locationView setCenterCoordinate:coordinate animated:YES];
    
    //设置位置
    
    self.locationView.region = MKCoordinateRegionMake(self.coordinate, MKCoordinateSpanMake(1.8, 1));
    
    self.locationView.mapType = MKMapTypeStandard;
    
    //初始化一个大头针类
    
    MKPointAnnotation * ann = [[MKPointAnnotation alloc]init];
    
    //设置大头针坐标
    
    ann.coordinate = self.coordinate;
    
    ann.title = @"重庆北站";
    
//    ann.subtitle=@"看这里";
    
    [self.locationView addAnnotation:ann];
    

    // Do any additional setup after loading the view.
}

//- addAnnotation {
//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//}

- (IBAction)backButtonClick:(id)sender {
    [self popViewController];
}
- (IBAction)navigationButtonClic:(id)sender {
    NSLog(@"====导航====");
    //系统版本高于8.0，使用UIAlertController
    if (IS_SystemVersionGreaterThanEight) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"导航到重庆北站" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        //自带地图
        [alertController addAction:[UIAlertAction actionWithTitle:@"自带地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"alertController -- 自带地图");
            
            //使用自带地图导航
            MKMapItem *currentLocation =[MKMapItem mapItemForCurrentLocation];
            
            MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:self.coordinate addressDictionary:nil]];
            
            [MKMapItem openMapsWithItems:@[currentLocation,toLocation] launchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsShowsTrafficKey:[NSNumber numberWithBool:YES]}];
            
            
        }]];
        
        //判断是否安装了高德地图，如果安装了高德地图，则使用高德地图导航
        if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
            [alertController addAction:[UIAlertAction actionWithTitle:@"高德地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                NSLog(@"alertController -- 高德地图");
                NSString *urlsting =[[NSString stringWithFormat:@"iosamap://navi?sourceApplication= &backScheme= &lat=%f&lon=%f&dev=0&style=2",self.coordinate.latitude,self.coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [[UIApplication  sharedApplication]openURL:[NSURL URLWithString:urlsting]];
                
            }]];
        }
        
        //判断是否安装了百度地图，如果安装了百度地图，则使用百度地图导航
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
            [alertController addAction:[UIAlertAction actionWithTitle:@"百度地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                NSLog(@"alertController -- 百度地图");
                NSString *urlsting =[[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=driving&coord_type=gcj02",self.coordinate.latitude,self.coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlsting]];
                
            }]];
        }
        
        //添加取消选项
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            [alertController dismissViewControllerAnimated:YES completion:nil];
            
        }]];
        
        //显示alertController
        [self presentViewController:alertController animated:YES completion:nil];
        
    } else {  //系统版本低于8.0，则使用UIActionSheet
        UIActionSheet * actionsheet = [[UIActionSheet alloc] initWithTitle:@"导航到故宫" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"自带地图", nil];
        //如果安装高德地图，则添加高德地图选项
        if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
            [actionsheet addButtonWithTitle:@"高德地图"];
        }
        
        //如果安装百度地图，则添加百度地图选项
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
            [actionsheet addButtonWithTitle:@"百度地图"];
        }
        
        [actionsheet showInView:self.view];
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    NSLog(@"ActionSheet - 取消了");
    [actionSheet removeFromSuperview];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"numberOfButtons == %ld",actionSheet.numberOfButtons);
    NSLog(@"buttonIndex == %ld",buttonIndex);
    
    if (buttonIndex == 0) {
        
        NSLog(@"自带地图触发了");
        
        MKMapItem *currentLocation =[MKMapItem mapItemForCurrentLocation];
        
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:self.coordinate addressDictionary:nil]];
        
        [MKMapItem openMapsWithItems:@[currentLocation,toLocation] launchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsShowsTrafficKey:[NSNumber numberWithBool:YES]}];
        
    }
    //既安装了高德地图，又安装了百度地图
    if (actionSheet.numberOfButtons == 4) {
        if (buttonIndex == 2) {
            NSLog(@"高德地图触发了");
            
            NSString *urlsting =[[NSString stringWithFormat:@"iosamap://navi?sourceApplication= &backScheme= &lat=%f&lon=%f&dev=0&style=2",self.coordinate.latitude,self.coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication  sharedApplication]openURL:[NSURL URLWithString:urlsting]];
        }
        if (buttonIndex == 3) {
            NSLog(@"百度地图触发了");
            NSString *urlsting =[[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=driving&coord_type=gcj02",self.coordinate.latitude,self.coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlsting]];
        }
        
    }
    //安装了高德地图或安装了百度地图
    if (actionSheet.numberOfButtons == 3) {
        if (buttonIndex == 2) {
            
            if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]) {
                
                NSLog(@"只安装的高德地图触发了");
                NSString *urlsting =[[NSString stringWithFormat:@"iosamap://navi?sourceApplication= &backScheme= &lat=%f&lon=%f&dev=0&style=2",self.coordinate.latitude,self.coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [[UIApplication  sharedApplication]openURL:[NSURL URLWithString:urlsting]];
                
            }
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
                NSLog(@"只安装的百度地图触发了");
                NSString *urlsting =[[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=driving&coord_type=gcj02",self.coordinate.latitude,self.coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlsting]];
            }
            
        }
        
    }
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
