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

@interface MLModifyPasswordViewController ()<modifyPasswordDelegate>

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

-(void)confirmModifyPassword:(MLModifyPasswordModel *)model result:(modifyPasswordBack)result
{
    [ApplicationDelegate showHub:self.view];
    [MLDataManager modifyPasswordManager:model resultString:^(id resultString) {
        NSLog(@"%@",resultString);
        [ApplicationDelegate removeHub];
        
        NSDictionary * dataDic = [MLMethod dataManager:resultString];
        if([dataDic allKeys]==0)
        {
            [MLMethod alertMessage:@"请求数据发生错误！"];
        }
        else
        {
            if([[[dataDic objectForKey:@"obj"] objectForKey:@"code"] intValue] == 1 && [[dataDic objectForKey:@"type"] intValue] == 6)
            {
               
            }
            else if([[dataDic objectForKey:@"type"] intValue] != 6) {
                
            }
            else {
                [MLMethod alertMessage:[[dataDic objectForKey:@"obj"] objectForKey:@"msg"]];
            }
            
        }

    }];
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
