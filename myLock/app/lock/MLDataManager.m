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

@implementation MLDataManager

+(void)registDataManager:(id)obj
{
    MLDataModel * dataModel = (MLDataModel*)obj;
    NSDictionary * dic = @{@"type":dataModel.type,
                           @"uid":dataModel.uid,
                           @"token":dataModel.token,
                           @"obj":@{
                                   @"userID":dataModel.User.userID,
                                   @"account":dataModel.User.account,
                                   @"password":dataModel.User.password,
                                   @"nickName":dataModel.User.nickName,
                                   @"isOnline":dataModel.User.isOnline,
                                   @"img":dataModel.User.img,
                                   @"personality":dataModel.User.personality,
                                   @"accountMacAddr":dataModel.User.accountMacAddr,
                                   @"accountImei":dataModel.User.accountImei,
                                   @"ip":dataModel.User.ip,
                                   @"port":dataModel.User.port,
                                   @"zGroup":dataModel.User.zGroup,
                                   @"logTime":dataModel.User.logTime,
                                   @"regTime":dataModel.User.regTime,
                                   @"prop":dataModel.User.prop,
                                   @"res":dataModel.User.res
                                   },
                           @"pktNumber":dataModel.pktNumber

                          
                           };
    [ApplicationDelegate writeData:dic];
}
@end
