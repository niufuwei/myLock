//
//  MLLockView.m
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLLockView.h"
#import "MLScrollview.h"
#import "MLMethod.h"
#import "MLDataObj.h"
#import "MLNavCustom.h"

@interface MLLockView ()<NavCustomDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) MLScrollview * bgScrollview;
@property (nonatomic,strong) UIImageView * lockImageView;
@property (nonatomic,strong) UIButton * openLockView;
@property (nonatomic,strong) MLNavCustom * navCustom;

@end

@implementation MLLockView
@synthesize bgScrollview;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame myself:( UIViewController *)myself
{
    if(self = [super initWithFrame:frame])
    {
        self.delegate =  myself;
        
        bgScrollview = [[MLScrollview alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, self.frame.size.height)];
        bgScrollview.delegate =self;
        bgScrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"lockBgBackGroundImage"]];
//        bgScrollview.contentSize = CGSizeMake(kScreen_Width, self.frame.size.height);
        
        UIImageView * imageBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, self.frame.size.height)];
        [imageBG setImage:IMAGENAMED(@"lockBgBackGroundImage")];
        
        self.navCustom = [[MLNavCustom alloc] init];
        self.navCustom.NavDelegate = self;
        
        [self addSubview:bgScrollview];
        
        [self loadLockView];
        
        [self loadOpenWithConnectView];
        
        [self loadLeftMenu];
        [self loadRightMenu];
    }
    return self;
}

-(void)loadLeftMenu
{
    [self.navCustom setNavLeftBtnImage:@"first_left_menu" LeftBtnSelectedImage:nil mySelf:[_delegate getTopViewController] width:20 height:15];

}


-(void)loadRightMenu
{
    [self.navCustom setNavRightBtnImage:@"first_add_menu" RightBtnSelectedImage:nil mySelf:[_delegate getTopViewController] width:15 height:15];
}

-(void)NavLeftButtononClick
{
    [_delegate leftMenuButtonClick:nil];
}

-(void)NavRightButtononClick
{
    [_delegate rightMenuButtonClick:nil];
}


-(void)loadLockView
{
    self.lockImageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreen_Width - 90)/2, 70, 90, 90)];
    [self.lockImageView setImage:[UIImage imageNamed:@"lockIcon"]];
    [self.bgScrollview addSubview:self.lockImageView];
    
}

-(void)loadOpenWithConnectView
{
    self.openLockView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.openLockView.frame =CGRectMake((kScreen_Width - 90)/2, self.lockImageView.frame.size.height+self.lockImageView.frame.origin.y + 80, 90, 90);
    [self.openLockView setBackgroundImage:[UIImage imageNamed:@"lockConnect"] forState:UIControlStateNormal];
    [self.openLockView addTarget:self action:@selector(openLockViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgScrollview addSubview:self.openLockView];
}

-(void)openLockViewClick:(id)sender
{
    
    UIButton * btn = (UIButton*)sender;
    NSLog(@"%@",btn);
    [MLMethod popPassWordView:^(NSInteger index) {
        [_delegate inputPassword:index];
    }];
    
}


-(void)hidePasswordView
{
    [MLMethod hidePasswordView];
}

-(void)updatePassowrd:(NSMutableArray *)dataArray
{
    [MLMethod updatePassword:dataArray];
}
@end
