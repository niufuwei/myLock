//
//  MLMyCardViewController.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMyCardViewController.h"
#import "MLMyCardView.h"
#import "AppDelegate.h"

@interface MLMyCardViewController ()

@property (nonatomic,strong) MLMyCardView * myCard;

@end

@implementation MLMyCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"名片";
    
    self.myCard = [[MLMyCardView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.myCard];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [ApplicationDelegate hideTabbar];
    [self.navigationController setNavigationBarHidden:NO animated:NO];

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
