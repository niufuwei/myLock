//
//  MLConFirmRegistViewController.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLConFirmRegistViewController.h"
#import "MLConFirmRegist.h"
#import "MLPhoto.h"
#import "MLRegistModel.h"

@interface MLConFirmRegistViewController ()<conFirmDelegate>
@property (nonatomic,strong) MLConFirmRegist * regist;

@end

@implementation MLConFirmRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    
    self.regist = [[MLConFirmRegist alloc] initWithFrame:self.view.frame myself:self];
    self.delegate = self.regist;
    MLRegistModel * registModel = [[MLRegistModel alloc] init];
    registModel.phone = self.phone;
    registModel.password = self.password;
    registModel.code = self.code;
    self.regist.registModel = registModel;
    [self.view addSubview:self.regist];
    // Do any additional setup after loading the view.
}

-(void)event:(UIButton *)btn
{
    if(btn.tag ==101)
    {
        //拍照片
        [MLPhoto onImageSelect:self backImage:^(id image) {
            [_delegate updateUI:image];
        }];
    }
}

-(void)regist:(MLRegistModel *)model
{
    [ApplicationDelegate showHub:self.view];
    [MLDataManager registDataManager:model resultString:^(id resultString) {
        
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
            if([[[dataDic objectForKey:@"obj"] objectForKey:@"code"] intValue] == 1 && [[dataDic objectForKey:@"type"] intValue] == 1)
            {
                [[NSUserDefaults standardUserDefaults] setObject:[[[dataDic objectForKey:@"obj"] objectForKey:@"obj"] objectForKey:@"newToken"] forKey:@"token"];
                
                [MLUserModel shareInstance].userID = [[[[dataDic objectForKey:@"obj"]objectForKey:@"obj"] objectForKey:@"userID"] integerValue];
                [MLUserModel shareInstance].account =[[[dataDic objectForKey:@"obj"]objectForKey:@"obj"] objectForKey:@"account"];
                
                [MLDataObj initDataObj].isLogin = TRUE;
                
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else if([[dataDic objectForKey:@"type"] intValue] != 1) {
                
            }
            else {
                [MLMethod alertMessage:[[dataDic objectForKey:@"obj"] objectForKey:@"msg"]];
            }
            [MLDataObj initDataObj].isLogin = FALSE;

        }

        
    }];
}


-(void)dismissViewControllerAnimated
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
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
