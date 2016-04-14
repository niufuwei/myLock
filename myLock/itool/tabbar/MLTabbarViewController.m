//
//  tabbarViewController.m
//  artists
//
//  Created by niufuwei on 13-12-15.
//  Copyright (c) 2013年 niufuwei. All rights reserved.
//

#import "MLTabbarViewController.h"
#import "AppDelegate.h"
#import "MLTabbarItem.h"
@interface MLTabbarViewController ()

@end

@implementation MLTabbarViewController
{
    AppDelegate *app;
    MLTabbarItem * myLockButton;
    MLTabbarItem * messageButton;
    MLTabbarItem * serviceButton;
    MLTabbarItem * mineButton;

    NSInteger tempIndex;
  
}


-(void)setButtonIndex:(NSInteger)index
{
    currentPage =  index;
    [self setButtonType:index];
}
- (void) hideTabBar:(BOOL) hidden{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, SCREEN_HEIGHT, view.frame.size.width, view.frame.size.height)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, SCREEN_HEIGHT-49, view.frame.size.width, view.frame.size.height)];
            }
        }
        else
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, SCREEN_HEIGHT)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width,  SCREEN_HEIGHT-49)];
            }
        }
    }
    
    [UIView commitAnimations];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        [[NSNotificationCenter defaultCenter]addObserver:self
//                                                selector:@selector(loginSuccessNotification:)
//                                                    name:XMBankUserLoginDidSuccessNotification
//                                                  object:nil];
//        
//        [[NSNotificationCenter defaultCenter]addObserver:self
//                                                selector:@selector(loginFailureNotification:)
//                                                    name:XMBankUserLoginDidFailureNotification
//                                                  object:nil];

    }
    return self;
}

- (void)createCustomTabBar
{
    _tabbarBG = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49)];
   
//    tabbarBG.image = [UIImage imageNamed:@"ground_bar.png"];
  
    [_tabbarBG setBackgroundColor:UIColorFromRGB(0x0095ca)];
    
    _tabbarBG.userInteractionEnabled = YES;
    [self.view addSubview:_tabbarBG];
    
    
    
//    UIView * lineImage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
//    lineImage.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1];
//    [_tabbarBG addSubview:lineImage];
//    
    
//    itemBG = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_item_selected.png"]];
    [_tabbarBG addSubview:itemBG];
    
    myLockButton= [[MLTabbarItem alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width/4, 49.0)];
    myLockButton.tag = 1;
//    [myLockButton setBackgroundColor:[UIColor whiteColor]];
//    [homeBtn setBackgroundImage:[UIImage imageNamed:@"首页菜单栏-选中 (1).png"] forState:UIControlStateNormal];
//    [homeBtn setTitle:@"社区购物" forState:UIControlStateNormal];
//    [homeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[homeBtn setTitleColor:[UIColor colorWithRed:235.0/255.0 green:81.0/255.0 blue:17.0/255.0 alpha:1] forState:UIControlStateSelected];
//    homeBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    //[homeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -29, -30, 0)];
    //[homeBtn setImageEdgeInsets:UIEdgeInsetsMake(-11, 25, 0, 18)];
    [myLockButton addTarget:self action:@selector(homeBtn_Click:) forControlEvents:UIControlEventTouchUpInside];
    myLockButton.selected = YES;
    currentPage =0;
    [myLockButton.itemIcon setImage:[UIImage imageNamed:@"mylock_clicked"]];
    myLockButton.itemTitle.text = @"爱锁";
    myLockButton.adjustsImageWhenHighlighted = FALSE;
    myLockButton.itemTitle.textColor =WHITECOLOR;
//    itemBG.frame = CGRectMake(0, 0, 80, 49);
    [_tabbarBG addSubview:myLockButton];
//    [homeBtn setBackgroundColor:[UIColor colorWithRed:37.0/255 green:73.0/255 blue:157.0/255 alpha:1.0]];
    
    
    
    messageButton= [[MLTabbarItem alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 0.0, self.view.frame.size.width/4, 49.0)];
    messageButton.tag = 2;
//    [yigou setImage:[UIImage imageNamed:@"首页菜单栏-未选 (2).png"] forState:UIControlStateNormal];
//    [myTaobaoBtn setTitle:@"社区服务" forState:UIControlStateNormal];
//    [myTaobaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[myTaobaoBtn setTitleColor:[UIColor colorWithRed:235.0/255.0 green:81.0/255.0 blue:17.0/255.0 alpha:1] forState:UIControlStateSelected];
//    myTaobaoBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    //[myTaobaoBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -29, -30, 0)];
    //[myTaobaoBtn setImageEdgeInsets:UIEdgeInsetsMake(-11, 25, 0, 18)];
    
    messageButton.adjustsImageWhenHighlighted = FALSE;
    [messageButton addTarget:self action:@selector(myTaobaoBtn_Click:) forControlEvents:UIControlEventTouchUpInside];
    messageButton.itemTitle.text = @"消息";
    [messageButton.itemIcon setImage:[UIImage imageNamed:@"message_normal"]];
    [_tabbarBG addSubview:messageButton];
//    [myTaobaoBtn setBackgroundColor:[UIColor colorWithRed:52.0/255 green:169.0/255 blue:220.0/255 alpha:1.0]];
    
    
    serviceButton= [[MLTabbarItem alloc] initWithFrame: CGRectMake(self.view.frame.size.width/4*2, 0.0, self.view.frame.size.width/4, 49.0)];
    serviceButton.tag = 3;
//    [serviceButton setImage:[UIImage imageNamed:@"首页菜单栏-未选 (3).png"] forState:UIControlStateNormal];
    //[_cartBtn set Title:@"我的" forState:UIControlStateNormal];
    //[_cartBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    //[cartBtn setTitleColor:[UIColor colorWithRed:235.0/255.0 green:81.0/255.0 blue:17.0/255.0 alpha:1] forState:UIControlStateSelected];
    //_cartBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    //[cartBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -27, -30, 0)];
    //[cartBtn setImageEdgeInsets:UIEdgeInsetsMake(-11, 25, 0, 18)];
    [serviceButton addTarget: self action:@selector(cartBtn_Click:) forControlEvents:UIControlEventTouchUpInside];
    serviceButton.adjustsImageWhenHighlighted = FALSE;
    [serviceButton.itemIcon setImage:[UIImage imageNamed:@"service_normal"]];
    serviceButton.itemTitle.text = @"服务";
    [_tabbarBG addSubview:serviceButton];
//    [_cartBtn setBackgroundColor:[UIColor colorWithRed:52.0/255 green:169.0/255 blue:220.0/255 alpha:1.0]];
    
    
    mineButton = [[MLTabbarItem alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4*3, 0.0, self.view.frame.size.width/4, 49.0)];
    mineButton.tag =4;
//    [mineButton setImage:[UIImage imageNamed:@"首页菜单栏-未选 (3).png"] forState:UIControlStateNormal];
//    [_cartBtn setTitle:@"更多" forState:UIControlStateNormal];
//    [_cartBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
//    [_cartBtn setTitleColor:[UIColor colorWithRed:235.0/255.0 green:81.0/255.0 blue:17.0/255.0 alpha:1] forState:UIControlStateSelected];
//    _cartBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
//    [_cartBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -27, -30, 0)];
//    [_cartBtn setImageEdgeInsets:UIEdgeInsetsMake(-11, 25, 0, 18)];
    [mineButton addTarget: self action:@selector(set_Click:) forControlEvents:UIControlEventTouchUpInside];
    mineButton.adjustsImageWhenHighlighted = FALSE;
    [mineButton.itemIcon setImage:[UIImage imageNamed:@"mine_normal"]];
    mineButton.itemTitle.text = @"我滴";
    [_tabbarBG addSubview:mineButton];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self show_custom_view_layer];
    self.tabBar.hidden = YES;
    //[self.tabBar removeFromSuperview];
    app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    [self createCustomTabBar];
}

- (void)homeBtn_Click:(UIButton *)button
{
    tempIndex= 0;
    if(currentPage ==0)
    {
        
    }
    else
    {
        currentPage = 0;
        [self setButtonType:currentPage];

    }
}

- (void)myTaobaoBtn_Click:(UIButton *)button
{
    tempIndex = 1;
    if(currentPage ==1)
    {
        
    }
    else
    {

        
        currentPage =1;
        [self setButtonType:currentPage];
        
    }
    

}

- (void)cartBtn_Click:(UIButton *)button
{
    tempIndex= 2;
    if(currentPage ==2)
    {
        
    }
    else
    {
//        XMUserInfo * infor = [XMUserInfo currentUserInfo];
//        if(infor.hasLogIn)
//        {
            currentPage = 2;
            [self setButtonType:currentPage];

//        }
//        else
//        {
//            [self login];
//
//        }
        
    }
}

-(void)set_Click:(UIButton*)button
{
    tempIndex = 3;

    if(currentPage ==3)
    {
        
    }
    else
    {
        currentPage = 3;
        [self setButtonType:currentPage];
    }
}

-(void)setButtonType:(NSInteger)index
{
    //投资按钮
    mineButton.itemTitle.textColor = [UIColor whiteColor];
    [mineButton.itemIcon setImage:[UIImage imageNamed:@"mine_normal"]];
    
    //已购按钮
    serviceButton.itemTitle.textColor = [UIColor whiteColor];
    [serviceButton.itemIcon setImage:[UIImage imageNamed:@"service_normal"]];
    
    //已投产品
    myLockButton.itemTitle.textColor = [UIColor whiteColor];
    [myLockButton.itemIcon setImage:[UIImage imageNamed:@"mylock_normal"]];
    
    //其他设置
    messageButton.itemTitle.textColor = [UIColor whiteColor];
    [messageButton.itemIcon setImage:[UIImage imageNamed:@"message_normal"]];
    
    switch (index) {
        case 0:
        {
            //投资按钮
            myLockButton.itemTitle.textColor = WHITECOLOR;
            [myLockButton.itemIcon setImage:[UIImage imageNamed:@"mylock_clicked"]];
        }
            break;
        case 1:
        {
            //账户按钮
            messageButton.itemTitle.textColor = WHITECOLOR;
            [messageButton.itemIcon setImage:[UIImage imageNamed:@"message_clicked"]];
        }
            break;
        case 2:
        {
            //投资按钮
            serviceButton.itemTitle.textColor = WHITECOLOR;
            [serviceButton.itemIcon setImage:[UIImage imageNamed:@"service_clicked"]];
        }
            break;
        case 3:
        {
            //投资按钮
            mineButton.itemTitle.textColor = WHITECOLOR;
            [mineButton.itemIcon setImage:[UIImage imageNamed:@"mine_clicked"]];
        }
            break;
        default:
            break;
    }
    
    NSLog(@"%d",index);
    self.selectedIndex = index;

}
- (void)showTabBar
{

    [UIView setAnimationDuration:0.35];
    _tabbarBG.frame = CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49);
    [UIView commitAnimations];
    [self makeTabBarHidden:NO];
}
- (void)hideTabBar
{
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:0.35];
    _tabbarBG.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 49);
    [UIView commitAnimations];
    
    [self makeTabBarHidden:YES];
}


- (void)hideTabBarWithNoAnimation
{
    _tabbarBG.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 49);
    
    [self makeTabBarHidden:YES];
}


- (void)showTabBarWithNoAnimation
{
    _tabbarBG.frame = CGRectMake(0, self.view.frame.size.height-49, self.view.frame.size.width, 49);
    
    [self makeTabBarHidden:NO];
}



-(void)login
{
//    [appDelegate loginButtonPress];
    
}

-(void)loginSuccessNotification:(NSNotification*)noti
{
    NSLog(@"%d",tempIndex);
    currentPage = tempIndex;
    [self setButtonType:tempIndex];

}

-(void)loginFailureNotification:(NSNotification*)noti
{
        [self setButtonType:currentPage];

}

-(void)makeTabBarHidden:(BOOL)hide {
    // Custom code to hide TabBar
    if ( [self.view.subviews count] < 2 ) {
        return;
    }
    
    UIView *contentView;
    if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] ) {
        contentView = [self.view.subviews objectAtIndex:1];
    } else {
        contentView = [self.view.subviews objectAtIndex:0];
    }
    
    if (hide) {
        contentView.frame = self.view.bounds;
    } else {
        contentView.frame = CGRectMake(self.view.bounds.origin.x,
                                       self.view.bounds.origin.y,
                                       self.view.bounds.size.width,
                                       self.view.bounds.size.height -
                                       self.tabBar.frame.size.height);
    }
    
    self.tabBar.hidden = hide;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
