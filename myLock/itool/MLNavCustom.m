//
//  NavCustom.m
//  ELiuYan
//
//  Created by laoniu on 14-4-29.
//  Copyright (c) 2014年 chaoyong.com. All rights reserved.
//

#import "MLNavCustom.h"

@implementation MLNavCustom
@synthesize NavDelegate;

-(void)setNavWithText:(NSString *)NavTitile mySelf:(UIViewController *)mySelf
{
    UILabel * lab;
    if(iOSCurrentVersion<7.0)
    {
        lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 21)];
    }
    else
    {
        lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 21, 21)];
    }
    
    [lab setFont:[UIFont systemFontOfSize:20]];
    lab.textColor = COLOR(90, 90, 90);
    lab.text = NavTitile;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.backgroundColor = [UIColor clearColor];
    mySelf.navigationItem.titleView = lab;
    
}

-(void)setNavWithImage:(NSString *)imgName mySelf:(UIViewController *)mySelf width:(int)width height:(int)height
{
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(150, 0, width, height)];
    [image setImage:[UIImage imageNamed:imgName]];
    mySelf.navigationItem.titleView = image;
}

-(void)setNavRightBtnTitle:(NSString *)RightBtnTitle mySelf:(UIViewController *)mySelf width:(int)width height:(int)height
{
    //创建右边按钮
    UIButton *rightBackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    rightBackBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBackBtn setTitle:RightBtnTitle forState:UIControlStateNormal];
    [rightBackBtn setTitleColor:COLOR(90, 90, 90) forState:UIControlStateNormal];
    [rightBackBtn addTarget:self action:@selector(NavRightButtononClick) forControlEvents:UIControlEventTouchUpInside];
    
    //添加进BARBUTTONITEM
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBackBtn];
    
    //右按钮
    mySelf.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)setNavRightBtnImage:(NSString *)RightBtnImage RightBtnSelectedImage:(NSString *)RightBtnSelectedImage mySelf:(UIViewController *)mySelf width:(int)width height:(int)height
{
    //创建右边按钮
    UIButton *rightBackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    [rightBackBtn setBackgroundImage:[UIImage imageNamed:RightBtnImage] forState:UIControlStateNormal];
    [rightBackBtn setBackgroundImage:[UIImage imageNamed:RightBtnSelectedImage] forState:UIControlStateHighlighted];
    [rightBackBtn addTarget:self action:@selector(NavRightButtononClick) forControlEvents:UIControlEventTouchUpInside];
    
    //添加进BARBUTTONITEM
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBackBtn];
    
    //右按钮
    mySelf.navigationItem.rightBarButtonItem = rightBtn;
    
}

- (void) NavRightButtononClick{
    
    if ([NavDelegate respondsToSelector:@selector(NavRightButtononClick)])
    {//判断方法是否实现
        [NavDelegate NavRightButtononClick];
    }
}


-(void)setNavLeftBtnTitle:(NSString *)LeftBtnTitle mySelf:(UIViewController *)mySelf width:(int)width height:(int)height
{
    //创建右边按钮
    UIButton *LeftBackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    [LeftBackBtn setTitle:LeftBtnTitle forState:UIControlStateNormal];
    [LeftBackBtn setTitleColor:COLOR(90, 90, 90) forState:UIControlStateNormal];
    [LeftBackBtn addTarget:self action:@selector(NavLeftButtononClick) forControlEvents:UIControlEventTouchUpInside];
    
    //添加进BARBUTTONITEM
    UIBarButtonItem *LeftBtn = [[UIBarButtonItem alloc] initWithCustomView:LeftBackBtn];
    
    //右按钮
    mySelf.navigationItem.leftBarButtonItem = LeftBtn;
}

-(void)setNavLeftBtnImage:(NSString *)LeftBtnImage LeftBtnSelectedImage:(NSString *)LeftBtnSelectedImage mySelf:(UIViewController *)mySelf width:(int)width height:(int)height
{
    //创建右边按钮
    UIButton *LeftBackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width-5, height)];
    
    [LeftBackBtn setBackgroundImage:[UIImage imageNamed:LeftBtnImage] forState:UIControlStateNormal];
    [LeftBackBtn setBackgroundImage:[UIImage imageNamed:LeftBtnSelectedImage] forState:UIControlStateHighlighted];
    [LeftBackBtn addTarget:self action:@selector(NavLeftButtononClick) forControlEvents:UIControlEventTouchUpInside];
    
    //添加进BARBUTTONITEM
    UIBarButtonItem *LeftBtn = [[UIBarButtonItem alloc] initWithCustomView:LeftBackBtn];
    
    //右按钮
    mySelf.navigationItem.leftBarButtonItem = LeftBtn;
    
}

-(void)NavLeftButtononClick{
    
    if ([NavDelegate respondsToSelector:@selector(NavLeftButtononClick)])
    {//判断方法是否实现
        [NavDelegate NavLeftButtononClick];
    }
}

-(void)setNavTitleBackImage:(NSString *)title mySelf:(UIViewController*)mySelf width:(int)width
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, width, 19);
    button.backgroundColor = CLEARCOLOR;
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:COLOR(90, 90, 90) forState:UIControlStateNormal];
    
    UIImageView *backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backwhite"]];
    backImageView.backgroundColor = CLEARCOLOR;
    backImageView.frame = CGRectMake(0, 0, 11, 17);
    [button addSubview:backImageView];
    backImageView.userInteractionEnabled = YES;

    UIBarButtonItem *LeftBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    mySelf.navigationItem.leftBarButtonItem = LeftBtn;

    [button addTarget:self action:@selector(NavLeftButtononClick) forControlEvents:UIControlEventTouchUpInside];

}



@end
