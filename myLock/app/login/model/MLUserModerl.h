//
//  MLUserModerl.h
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLUserModerl : NSObject

@property (nonatomic,strong) NSString * userID;
@property (nonatomic,strong) NSString * account;
@property (nonatomic,strong) NSString * password;
@property (nonatomic,strong) NSString * nickName;
@property (nonatomic,strong) NSString * isOnline;//是否在线
@property (nonatomic,strong) NSString * img;
@property (nonatomic,strong) NSString * personality;//个性签名
@property (nonatomic,strong) NSString * accountMacAddr;
@property (nonatomic,strong) NSString * accountImei;
@property (nonatomic,strong) NSString * ip;
@property (nonatomic,strong) NSString * port;
@property (nonatomic,strong) NSString * zGroup;
@property (nonatomic,strong) NSString * logTime;
@property (nonatomic,strong) NSString * regTime;
@property (nonatomic,strong) NSString * prop;
@property (nonatomic,strong) NSString * res;

@end
