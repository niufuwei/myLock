//
//  MLLoginViewController.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLLoginViewController.h"
#import "MLLoginView.h"

@interface MLLoginViewController ()<loginDelegate>

@property (nonatomic,strong) MLLoginView * loginView;
@end

@implementation MLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    
    self.loginView = [[MLLoginView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.loginView];
    // Do any additional setup after loading the view.
}


-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    [self.navigationController pushViewController:vc animated:animated];
}

-(void)dismissViewControllerAnimated
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)login:(MLLoginModel *)model
{
    [ApplicationDelegate showHub:self.view];

    [MLDataManager loginManager:model resultString:^(id resultString) {
        [ApplicationDelegate removeHub];
        
        NSLog(@"%@",resultString);
        NSDictionary * dataDic = [MLMethod dataManager:resultString];
        if([dataDic allKeys]==0)
        {
            [MLMethod alertMessage:@"请求数据发生错误！"];
            [MLDataObj initDataObj].isLogin = FALSE;
            
        }
        else
        {
            if([[[dataDic objectForKey:@"obj"] objectForKey:@"code"] intValue] == 1 && [[dataDic objectForKey:@"type"] intValue] == 3)
            {
                [[NSUserDefaults standardUserDefaults] setObject:[[[dataDic objectForKey:@"obj"] objectForKey:@"obj"] objectForKey:@"newToken"] forKey:@"token"];
                
                [MLUserModel shareInstance].userID = [[[[dataDic objectForKey:@"obj"]objectForKey:@"obj"] objectForKey:@"userID"] integerValue];
                [MLUserModel shareInstance].account =[[[dataDic objectForKey:@"obj"]objectForKey:@"obj"] objectForKey:@"account"];
                
                [MLDataObj initDataObj].isLogin = TRUE;
                
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else if([[dataDic objectForKey:@"type"] intValue] != 3) {
                
            }
            else {
                [MLMethod alertMessage:[[dataDic objectForKey:@"obj"] objectForKey:@"msg"]];
            }
            [MLDataObj initDataObj].isLogin = FALSE;
            
        }

        
    }];
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
