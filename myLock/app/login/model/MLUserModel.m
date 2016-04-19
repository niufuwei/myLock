//
//  MLUserModerl.m
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLUserModel.h"

@implementation MLUserModel

static MLUserModel * userModel = nil;

+(instancetype)shareInstance
{
    @synchronized (self) {
        if(!userModel)
        {
            userModel = [[self alloc] init];
        }
    }
    return userModel;
}

+(void)initData
{
    userModel.userID = 0;
    userModel.account = @"0";
    userModel.password = @"0";
    userModel.nickName = @"0";
    userModel.isOnline = 0;
    userModel.imgUrl = @"0";
    userModel.isGirl = 0;
    userModel.personality = @"0";
    userModel.accountMacAddr = @"0";
    userModel.accountImei = @"0";
    userModel.ip = @"0";
    userModel.port = @"0";
    userModel.zGroup = 0;
    userModel.logTime = @"0";
    userModel.regTime = @"0";
    userModel.prop = 0;
    userModel.verifyCode = @"0";
    userModel.area = @"0";
}
@end
