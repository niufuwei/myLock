//
//  MLBlackListViewController.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLBlackListViewController.h"
#import "MLBlackListView.h"

@interface MLBlackListViewController ()<blackListDelegate>

@property (nonatomic,strong) MLBlackListView * blackList;
@end

@implementation MLBlackListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"通讯录黑名单";
    
    self.blackList = [[MLBlackListView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-15)];
    [self.view addSubview:self.blackList];
    
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    
}

-(void)eventClick
{
    
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
