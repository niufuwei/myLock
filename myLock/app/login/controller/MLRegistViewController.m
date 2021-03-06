//
//  MLRegistViewController.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLRegistViewController.h"
#import "MLRegistView.h"
#import "MLPhoneCodeModel.h"

@interface MLRegistViewController ()<nextDelegate>

@property (nonatomic,strong) MLRegistView * regist;

@end

@implementation MLRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    
    self.regist = [[MLRegistView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.regist];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    [self.navigationController pushViewController:vc animated:YES];
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
