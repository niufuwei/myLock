//
//  MLMessageViewController.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMineMessageViewController.h"
#import "MLMineMessageView.h"
#import "AppDelegate.h"
#import "MLMineModel.h"

@interface MLMineMessageViewController ()<messageDelegate>

@property (nonatomic,strong) MLMineMessageView * messageView;
@property (nonatomic,strong) MLMineModel * mineModel;

@end

@implementation MLMineMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息通知";
    
    self.messageView = [[MLMineMessageView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.messageView];
    
    self.mineModel = [[MLMineModel alloc] init];
    
    self.mineModel.isOpenMessage = FALSE;
    self.mineModel.isOpenPush = FALSE;
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [ApplicationDelegate hideTabbar];
}

-(void)clickEvent:(NSInteger)index
{
    BOOL isOpen = FALSE;
    if(index ==1)
    {
       self.mineModel.isOpenPush = !self.mineModel.isOpenPush;
        isOpen = self.mineModel.isOpenPush;
    }
    else
    {
        self.mineModel.isOpenMessage = !self.mineModel.isOpenMessage;
        isOpen = self.mineModel.isOpenMessage;
    }
 

    [self.messageView updateUI:index isOpen:isOpen];
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
