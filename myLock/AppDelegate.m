//
//  AppDelegate.m
//  myLock
//
//  Created by laoniu on 16/3/9.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "AppDelegate.h"
#import "AsyncSocket.h"
#import "MLLockViewController.h"
#import "MLMessageViewController.h"
#import "MLMineViewController.h"
#import "MLServiceViewController.h"
#import "MLTabbarViewController.h"
#import "MLNavigationController.h"
#import "JSONKit.h"
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
#import "MLDataModel.h"

@interface AppDelegate ()<AsyncSocketDelegate>
{
    BMKMapManager * _mapManager;
}

@property (nonatomic, retain) NSTimer        *connectTimer; // 计时器
@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    MLLockViewController * lock= [[MLLockViewController alloc] init];
    MLNavigationController * navLock = [[MLNavigationController alloc] initWithRootViewController:lock];
    
    MLMessageViewController * message= [[MLMessageViewController alloc] init];
    MLNavigationController * navMessage = [[MLNavigationController alloc] initWithRootViewController:message];
    
    MLServiceViewController * service= [[MLServiceViewController alloc] init];
    MLNavigationController * navService = [[MLNavigationController alloc] initWithRootViewController:service];
    
    MLMineViewController * mine= [[MLMineViewController alloc] init];
    MLNavigationController * navMine = [[MLNavigationController alloc] initWithRootViewController:mine];
    
    _tabbar  = [[MLTabbarViewController alloc] init];
    _tabbar.viewControllers = @[navLock,navMessage,navService,navMine];
    
    [_window setRootViewController:_tabbar];

    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"Z0aGXjMHxnpS4BLWE6Hktamx"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    
    //链接服务器
    [self connectService];
    
    //初始化header数据源
    [MLDataModel initData];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(void)hideTabbar
{
    [_tabbar hideTabBar];
}
-(void)showTabbar
{
    [_tabbar showTabBar];
}

#define connect socket service
#define mark --

-(void)connectService
{
    self.asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    NSError * err = nil;
    if(![self.asyncSocket connectToHost:NET_WORK_CONNECT_ADDR_IP onPort:PORT error:&err])
    {
        NSLog(@"%@",err);
    }
    
    [self.asyncSocket readDataWithTimeout:60 tag:0];
}

-(void)writeData:(NSDictionary*)data resultS:(result)resultS
{
    self.backDataResult = resultS;
    [self.asyncSocket writeData:[[[@"AA" stringByAppendingString:[data JSONString]] stringByAppendingString:@"00BB"] dataUsingEncoding:NSUTF8StringEncoding] withTimeout:60 tag:0];

}

//建立链接
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    
    //    NSData   *dataStream  = [@8 dataUsingEncoding:NSUTF8StringEncoding];
    
    //    [self.socket writeData:dataStream withTimeout:1 tag:1];
    
    [sock readDataWithTimeout:60 tag:0];
    
    // 每隔30s像服务器发送心跳包
    self.connectTimer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(longConnectToSocket) userInfo:nil repeats:YES];// 在longConnectToSocket方法中进行长连接需要向服务器发送的讯息
    
    [self.connectTimer fire];
}

//读取数据
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSString *aStr=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"aStr==%@",aStr);
    self.backDataResult(aStr);
    [self.asyncSocket readDataWithTimeout:60 tag:0];

}

//是否加密
-(void)onSocketDidSecure:(AsyncSocket *)sock
{
    NSLog(@"onSocket:%p did go a secure line:YES",sock);
}

//遇到错误时关闭连接
-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    if (sock.userData == SocketOfflineByServer) {
            // 服务器掉线，重连
        NSLog(@"%@",@"服务器掉线");
        [self connectService];
    }
    else if (sock.userData == SocketOfflineByUser) {
    
        NSLog(@"%@",@"用户断开");
            // 如果由用户断开，不进行重连
        return;
    }

    NSLog(@"onSocket:%p will disconnect with error:%@",sock,err);
}

//断开连接
-(void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    self.asyncSocket.userData = 1;
    [self.asyncSocket disconnect];
    NSLog(@"%@",@"网络已断开");
}

// 心跳连接
-(void)longConnectToSocket{
    
    // 根据服务器要求发送固定格式的数据，假设为指令@"longConnect"，但是一般不会是这么简单的指令
    
    NSString *longConnect = @"longConnect";
    
    NSData   *dataStream  = [longConnect dataUsingEncoding:NSUTF8StringEncoding];
    
    [self.asyncSocket writeData:dataStream withTimeout:60 tag:0];
    
}

@end
