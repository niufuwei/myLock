//
//  AppDelegate.h
//  myLock
//
//  Created by laoniu on 16/3/9.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AsyncSocket;
@class MLTabbarViewController;

enum{
    SocketOfflineByServer,// 服务器掉线，默认为0
    SocketOfflineByUser,  // 用户主动cut
};

typedef void (^result)(id resultString);


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) AsyncSocket *asyncSocket;
@property (nonatomic,strong) MLTabbarViewController * tabbar;
@property (nonatomic,copy) result backDataResult;

-(void)connectService;
-(void)writeData:(NSDictionary*)data resultS:(result)resultS;

-(void)hideTabbar;
-(void)showTabbar;
@end

