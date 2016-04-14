//
//  MLLockView.h
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"
#import "MLLockViewController.h"

@class MLLockModel;

@protocol lockDelegate <NSObject>

//****
//*
//*导航栏左菜单按钮触发事件
//*
-(void)leftMenuButtonClick:(UIButton*)btn;

//****
//*
//*导航栏右菜单按钮触发事件
//*
-(void)rightMenuButtonClick:(UIButton*)btn;

//****
//*
//*查询锁列表
//*
-(void)findLockList;

//****
//*
//*开锁指令
//*
-(void)openLock;

//****
//*
//*关锁指令
//*
-(void)closeLock;

//****
//*
//*处理密码
//*
-(void)inputPassword:(NSInteger)index;

//****
//*
//*获取上一级视图控制器
//*
-(UIViewController*)getTopViewController;

@end

@interface MLLockView : MLView<updatePassWordDelegate>

@property (nonatomic,weak) id<lockDelegate>delegate;
@property (nonatomic,strong) MLLockModel * lockModel;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

@end
