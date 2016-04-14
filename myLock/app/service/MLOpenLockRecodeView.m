//
//  MLOpenLockRecodeView.m
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLOpenLockRecodeView.h"
#import "MLRecodeView.h"
#import "AppDelegate.h"

@interface MLOpenLockRecodeView ()<recodeDelegate>

@property (nonatomic,strong) MLRecodeView * recode;
@end

@implementation MLOpenLockRecodeView
@synthesize recode;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    recode = [[MLRecodeView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-64) myself:self];
    [self.view addSubview:recode];
    
    self.title = @"开锁记录";
    
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [ApplicationDelegate hideTabbar];
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
