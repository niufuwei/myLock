
//
//  MLMapView.m
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件

#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件

#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件

#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件


@interface MLMapView ()<BMKMapViewDelegate> {
  
}

@property (strong, nonatomic) BMKMapView * mapView;

@end

@implementation MLMapView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //获得nib视图数组
        //得到第一个UIView
        NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"MLRecodeListWithInforCell" owner:nil options:nil];
        UIView * v = [nibView objectAtIndex:0];
        v.frame = CGRectMake(0, 0, kScreen_Width, 92);
        [self addSubview:v];
        
        self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 73, kScreen_Width, kScreen_Height - 73)];
        self.mapView.mapType = BMKMapTypeStandard;
        //mapView.mapType = MKMapTypeSatellite;
        //mapView.mapType = MKMapTypeHybrid;
//        [_mapView setTrafficEnabled:YES];
        [self addSubview:self.mapView];
        
        BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = 39.915;
        coor.longitude = 116.404;
        annotation.coordinate = coor;
        annotation.title = @"这是一个测试";
        [_mapView addAnnotation:annotation];
        
        
    }
    return self;
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

@end
