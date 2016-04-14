//
//  MLOpenLockRecodeList.m
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLOpenLockRecodeList.h"
#import "MLRecodeListView.h"

@interface MLOpenLockRecodeList ()<recodeListDelegate>

@property (nonatomic,strong) MLRecodeListView * listView;

@end

@implementation MLOpenLockRecodeList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"开锁记录";
    
    self.listView = [[MLRecodeListView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-20) myself:self];
    [self.view addSubview:self.listView];
    // Do any additional setup after loading the view.
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
