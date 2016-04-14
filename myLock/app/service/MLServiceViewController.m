//
//  MLServiceViewController.m
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLServiceViewController.h"
#import "MLServiceView.h"
#import "AppDelegate.h"

@interface MLServiceViewController ()<serviceDelegate>
@property (nonatomic,strong)  MLServiceView * service;
@end

@implementation MLServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.service = [[MLServiceView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.service];
    
    self.title = @"服务";
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [ApplicationDelegate showTabbar];
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
