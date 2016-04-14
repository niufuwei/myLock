//
//  MLSetViewController.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLSetViewController.h"
#import "MLSetView.h"
#import "AppDelegate.h"

@interface MLSetViewController ()<setViewDelegate>

@property (nonatomic,strong) MLSetView * setView;

@end

@implementation MLSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    self.setView = [[MLSetView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.setView];
    
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [ApplicationDelegate hideTabbar];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
