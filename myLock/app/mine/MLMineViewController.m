//
//  MLMineViewController.m
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMineViewController.h"
#import "MLMineView.h"
#import "AppDelegate.h"

@interface MLMineViewController ()<mineViewDelegate>
@property (nonatomic,strong) MLMineView * mineView;

@end

@implementation MLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
    self.mineView = [[MLMineView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.mineView];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [ApplicationDelegate showTabbar];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    [self.navigationController pushViewController:vc animated:YES];
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
