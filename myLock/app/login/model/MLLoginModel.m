//
//  MLLoginModel.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLLoginModel.h"
#import "MLDataManager.h"
#import "MLUserModerl.h"

@interface MLLoginModel ()
@end

@implementation MLLoginModel



+(instancetype)shareInstan
{
    static MLLoginModel * loginModel;
    @synchronized (self) {
        if(!loginModel)
        {
            loginModel = [[self alloc]init];

        }
    }
    return loginModel;
}

+(void)loginDataObj:(NSDictionary *)dataDic registResult:(result)registResult
{
    MLUserModerl * userModel = [[MLUserModerl alloc] init];
    userModel.userID = @"0";
    userModel.account = @"18600135086";
    userModel.password = @"123456";
    userModel.nickName = @"laoniu";
    userModel.isOnline = @"1";
    userModel.img = @"0";
    userModel.personality = @"我固自我在";
    userModel.accountMacAddr = @"0";
    userModel.accountImei = @"0";
    userModel.ip = @"192.168.0.1";
    userModel.port = @"7777";
    userModel.zGroup = @"0";
    userModel.logTime = @"0";
    userModel.regTime = @"0";
    userModel.prop = @"0";
    userModel.res = @"0";
    
    [MLDataManager registDataManager:userModel resultString:^(id resultString) {
        registResult(resultString);
    }
     ];
}

@end
