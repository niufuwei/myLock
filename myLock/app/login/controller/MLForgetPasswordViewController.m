//
//  MLForgetPasswordViewController.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLForgetPasswordViewController.h"
#import "MLForgetView.h"

@interface MLForgetPasswordViewController ()<forgetDelegate>

@property (nonatomic,strong) MLForgetView * forgetView;

@end

@implementation MLForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"忘记密码";
    self.forgetView = [[MLForgetView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.forgetView];
    // Do any additional setup after loading the view.
}

-(void)dismissViewControllerAnimated
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)getPhoneCode:(MLPhoneCodeModel *)model phoneCode:(phoneCodeBlock)phoneCode
{
    [MLDataManager getPhoneCodeManager:model resultString:^(id resultString) {
        NSLog(@"%@",resultString);
        NSDictionary * dataDic = [MLMethod dataManager:resultString];
        if([dataDic allKeys]==0)
        {
            [MLMethod alertMessage:@"请求数据发生错误！"];
            
        }
        else
        {
            [MLMethod alertMessage:[[dataDic objectForKey:@"obj"] objectForKey:@"msg"]];
        }
        
    }];
}

-(void)confirmFindPassword:(MLForgetModel *)model
{
    [ApplicationDelegate showHub:self.view];
    [MLDataManager findPasswordManager:model resultString:^(id resultString) {
       
        [ApplicationDelegate removeHub];
        NSLog(@"%@",resultString);
        NSDictionary * dataDic = [MLMethod dataManager:resultString];
        if([dataDic allKeys]==0)
        {
            [MLMethod alertMessage:@"请求数据发生错误！"];
            
        }
        else
        {
            if([[[dataDic objectForKey:@"obj"] objectForKey:@"code"] intValue] == 1 && [[dataDic objectForKey:@"type"] intValue] == 9)
            {
                [MLMethod alertMessage:@"密码修改成功，请重新登录"];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else if([[dataDic objectForKey:@"type"] intValue] != 9) {
                
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
