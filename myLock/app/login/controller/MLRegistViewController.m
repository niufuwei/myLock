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

-(void)getPhoneCode:(NSString *)phone phoneCode:(phoneCodeBlock)phoneCode
{
    [MLPhoneCodeModel getPhoneCode:phone phoneCode:^(id resultString) {
        NSLog(@"%@",resultString);
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
