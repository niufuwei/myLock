//
//  MLDataManager.m
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLDataManager.h"
#import "AppDelegate.h"
#import "MLDataModel.h"
#import "MLUserModerl.h"

@implementation MLDataManager

+(void)writeDic:(NSDictionary *)dic type:(NSString*)type resultString:(result)resultString
{
    NSDictionary * WriteDic = @{
                                @"type":type,
                            
                                @"uid":[MLDataModel shareInstance].uid,
                            
                                @"token":[MLDataModel shareInstance].token,
                                       
                                @"obj":dic,
                                       
                                @"pktNumber":[MLDataModel shareInstance].pktNumber
                                       };

    NSLog(@"%@",WriteDic);
    [ApplicationDelegate writeData:WriteDic resultS:^(id resultS) {
        resultString(resultS);
    }];
}

+(void)registDataManager:(id)obj resultString:(result)resultString
{
    MLUserModerl * userModel = (MLUserModerl*)obj;
    NSDictionary * dic = @{
                               @"userID":userModel.userID,
                               @"account":userModel.account,
                               @"password":userModel.password,
                               @"nickName":userModel.nickName,
                               @"isOnline":userModel.isOnline,
                               @"img":userModel.img,
                               @"personality":userModel.personality,
                               @"accountMacAddr":userModel.accountMacAddr,
                               @"accountImei":userModel.accountImei,
                               @"ip":userModel.ip,
                               @"port":userModel.port,
                               @"zGroup":userModel.zGroup,
                               @"logTime":userModel.logTime,
                               @"regTime":userModel.regTime,
                               @"prop":userModel.prop,
                               @"res":userModel.res
                           };
    
    [MLDataManager writeDic:dic type:@"1" resultString:^(id resultS) {
        resultString(resultS);
    }];
}

+(void)getPhoneCodeManager:(id)phone resultString:(result)resultString
{
    NSDictionary * dic = @{
                            @"account":phone
                           
                           };
    [MLDataManager writeDic:dic type:@"5" resultString:^(id resultS) {
        resultString(resultS);
    }];

}
@end
