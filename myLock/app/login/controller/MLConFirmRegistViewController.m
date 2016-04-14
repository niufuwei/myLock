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

@interface MLConFirmRegistViewController ()<conFirmDelegate>
@property (nonatomic,strong) MLConFirmRegist * regist;

@end

@implementation MLConFirmRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册";
    
    self.regist = [[MLConFirmRegist alloc] initWithFrame:self.view.frame myself:self];
    self.delegate = self.regist;
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
