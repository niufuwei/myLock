//
//  MLLockViewController.m
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLLockViewController.h"
#import "MLLockView.h"
#import "MLLockModel.h"
#import "MLNavCustom.h"
#import "AppDelegate.h"
#import "MLDataModel.h"
#import "MLDataManager.h"
#import "MLLoginViewController.h"
#import "MLNavigationController.h"
#import "MLListSelectorView.h"


@interface MLLockViewController ()<lockDelegate,NavCustomDelegate>

@property (nonatomic,strong) MLLockModel * lockModel;
@property (nonatomic,strong) MLLockView * lockView;
@property (nonatomic,strong) MLDataModel * dataModel;
@end

@implementation MLLockViewController
@synthesize lockModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"爱锁";
    
    MLLoginViewController * login = [[MLLoginViewController alloc] init];
    MLNavigationController * navLogin = [[MLNavigationController alloc] initWithRootViewController:login];
    [self.navigationController presentViewController:navLogin animated:NO completion:^{
        
    }];
    
    self.lockView = [[MLLockView alloc] initWithFrame:self.view.frame myself:self];
    self.delegate = self.lockView;
    [self.view addSubview:self.lockView];
    
    
    lockModel = [[MLLockModel alloc] init];
    lockModel.dataArray = [[NSMutableArray alloc] init];
        
    self.dataModel = [[MLDataModel alloc] init];
    self.dataModel.type = @"1";
    self.dataModel.uid = @"0";
    self.dataModel.token = @"0";
    self.dataModel.User.userID = @"0";
    self.dataModel.User.account = @"18600135086";
    self.dataModel.User.password = @"123456";
    self.dataModel.User.nickName = @"laoniu";
    self.dataModel.User.isOnline = @"1";
    self.dataModel.User.img = @"0";
    self.dataModel.User.personality = @"我固自我在";
    self.dataModel.User.accountMacAddr = @"0";
    self.dataModel.User.accountImei = @"0";
    self.dataModel.User.ip = @"192.168.0.1";
    self.dataModel.User.port = @"7777";
    self.dataModel.User.zGroup = @"0";
    self.dataModel.User.logTime = @"0";
    self.dataModel.User.regTime = @"0";
    self.dataModel.User.prop = @"0";
    self.dataModel.User.res = @"0";
    self.dataModel.pktNumber = @"0";
    
    [MLDataManager registDataManager:self.dataModel];
    // Do any additional setup after loading the view.
}

-(void)leftMenuButtonClick:(UIButton*)btn {
    [MLListSelectorView showListSelectorView:@[@"修改密码",@"重置设备"] tag:3 table_x:20 backIndex:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
}
-(void)rightMenuButtonClick:(UIButton*)btn {
    [MLListSelectorView showListSelectorView:@[@"附近的锁",@"我的爱锁"] tag:1 table_x:kScreen_Width - (180.f/320.f*kScreen_Width)-20 backIndex:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
}
-(void)findLockList {
    
}
-(void)openLock {
    
}
-(void)closeLock {
    
}

-(UIViewController*)getTopViewController
{
    return self;
}

-(void)NavRightButtononClick
{
    
}

-(void)NavLeftButtononClick{
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [MLListSelectorView hideSelector];
}

-(void)inputPassword:(NSInteger)index
{
    if(index <7)
    {
        //密码填充
    }
    else if(index ==7)
    {
        //记住密码？
        
    }
    else if(index ==38)
    {
        //隐藏密码输入框
        [lockModel.dataArray removeAllObjects];
        [_delegate updatePassowrd:lockModel.dataArray];
        [_delegate hidePasswordView];
    }
    else if(index >7)
    {
        //点击数字键盘
        NSInteger temp_index = index -100;

        if(temp_index ==11)
        {
            //后退
            [lockModel.dataArray removeLastObject];

        }
        else
        {
            if([lockModel.dataArray count] >= 6)
            {
                
            }
            else
            {
                
                if(temp_index ==9)
                {
                    
                }
                else if(temp_index ==10)
                {
                    [lockModel.dataArray addObject:@"0"];
                }
                else{
                    [lockModel.dataArray addObject:[NSString stringWithFormat:@"%ld",temp_index+1]];
                }
            }
        }
        [_delegate updatePassowrd:lockModel.dataArray];

        

    }

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
