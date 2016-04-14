//
//  MLRegistModel.m
//  myLock
//
//  Created by laoniu on 16/4/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLRegistModel.h"
#import "MLDataModel.h"
#import "MLDataManager.h"
#import "MLUserModerl.h"

@interface MLRegistModel ()

@property (nonatomic,strong) MLDataModel * dataModel;
@end

@implementation MLRegistModel

+(instancetype)shareInstan
{
    static MLRegistModel * registModel;
    @synchronized (self) {
        if(!registModel)
        {
            registModel = [[self alloc]init];

        }
    }
    return registModel;
}



+(void)registDataObj:(NSDictionary *)dataDic registResult:(result)registResult
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
    }];
}


@end
