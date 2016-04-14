//
//  XMNavigationController.m
//  XMProject
//
//  Created by admin on 14-3-11.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "MLNavigationController.h"
#import "MLNavCustom.h"

@interface MLNavigationController ()<NavCustomDelegate>
{
    MLNavCustom * customNav;
}

@end

@implementation MLNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        if (iOSCurrentVersion  >= 7.0) {
            self.navigationBar.translucent = NO;
        }
        
//            self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//        else
        
        [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x0095ca)];
        [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0x0095ca)];
        

        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],
                                    NSForegroundColorAttributeName,[UIFont systemFontOfSize:17],NSFontAttributeName, nil];
        self.navigationBar.titleTextAttributes = attributes;
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//        [self.navigationBar
//         setTitleTextAttributes:
//         [NSDictionary dictionaryWithObjectsAndKeys:
//          WHITECOLOR,UITextAttributeTextShadowColor,
//                                                                         
//        [UIColor whiteColor],UITextAttributeTextColor,nil]];
//        
//        if (SYSTME_VERSION < 7.0) {
//            //6.0里这个是控制navbar的背景色，70里是控制字体的颜色
//            
//            [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
//            [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil]
//             setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor],UITextAttributeTextShadowColor:CLEARCOLOR} forState:UIControlStateNormal];
//            [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil]
//             setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor],UITextAttributeTextShadowColor:CLEARCOLOR} forState:UIControlStateHighlighted];
//            UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
//            
//            statusBarView.backgroundColor=UIColorFromRGB(0xf84202);
//            
//            [self.view addSubview:statusBarView];
//            
//            [[UINavigationBar appearance] setTintColor:UIColorFromRGB(0xf84202)];
//        }else
//        {
//            [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xf84202)];
//            self.navigationBar.tintColor = [UIColor whiteColor];
//
//        }
//        
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//        //    [[UINavigationBar appearance] setTintColor:COLOR(252, 150, 81)];
//        
//        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                                         [UIColor whiteColor], UITextAttributeTextColor,
//                                                                         [UIColor whiteColor], UITextAttributeTextShadowColor,[UIColor whiteColor],NSBackgroundColorAttributeName,
//                                                                         [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
//                                                                         [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
//                                                                         nil]];
    }
    
  
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if(self.topViewController != nil && self.topViewController.navigationItem.backBarButtonItem == nil && self.topViewController.navigationItem.leftBarButtonItem ==  nil
//       ){
//        //        [self setLeftItem:self.topViewController];
//        customNav = [[NavCustom alloc] init];
//        [customNav setNavLeftBtnImage:@"backwhite" LeftBtnSelectedImage:nil mySelf:self width:40 height:35];
//        customNav.NavDelegate = self;
//    }
 
    // Do any additional setup after loading the view from its nib.
}

-(void)NavLeftButtononClick{
    
    if([self.viewControllers count]>1){
        [self popViewControllerAnimated:YES];
    }else{
        [self.topViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
