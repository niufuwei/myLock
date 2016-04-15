//
//  MLUserModerl.h
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLUserModerl : NSObject

@property (nonatomic,assign) NSInteger userID;//用户id
@property (nonatomic,strong) NSString * account;//用户账号
@property (nonatomic,strong) NSString * password;//用户密码
@property (nonatomic,strong) NSString * nickName;//用户昵称
@property (nonatomic,assign) NSInteger isOnline;//是否在线，1在线，2离线
@property (nonatomic,strong) NSString * imgUrl;//图片序号
@property (nonatomic,assign) NSInteger  isGirl;//男孩女孩
@property (nonatomic,strong) NSString * personality;//个性签名
@property (nonatomic,strong) NSString * accountMacAddr;//mac地址
@property (nonatomic,strong) NSString * accountImei;//imei
@property (nonatomic,strong) NSString * ip;//IP地址
@property (nonatomic,strong) NSString * port;//端口号
@property (nonatomic,assign) NSInteger zGroup;//用户分组
@property (nonatomic,strong) NSString * logTime;//最近的登录时间
@property (nonatomic,strong) NSString * regTime;//注册时间
@property (nonatomic,assign) NSInteger prop;//用户属性、
@property (nonatomic,strong) NSString * verifyCode;//验证码
@property (nonatomic,strong) NSString * area;//区域

-(void)initData;
@end
