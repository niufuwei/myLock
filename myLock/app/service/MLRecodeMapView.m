//
//  MLRecodeMapView.m
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLRecodeMapView.h"
#import "MLMapView.h"

@interface MLRecodeMapView ()

@property (nonatomic,strong) MLMapView * mapView;
@end

@implementation MLRecodeMapView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"开锁记录";
    
    self.mapView = [[MLMapView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    [self.view addSubview:self.mapView];
    // Do any additional setup after loading the view.
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
