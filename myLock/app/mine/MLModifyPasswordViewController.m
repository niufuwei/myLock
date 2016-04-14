//
//  MLModifyPasswordViewController.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLModifyPasswordViewController.h"
#import "MLModifyPasswordView.h"
#import "AppDelegate.h"

@interface MLModifyPasswordViewController ()

@property (nonatomic,strong) MLModifyPasswordView * modifyPasswordView;

@end

@implementation MLModifyPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    
    self.modifyPasswordView = [[MLModifyPasswordView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.modifyPasswordView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [ApplicationDelegate hideTabbar];
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
