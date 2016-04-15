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
#import "MLRegistModel.h"
#import "MLPhoneCodeModel.h"
#import <objc/runtime.h>
#import "MLLoginModel.h"

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

+(void)registDataManager:(MLRegistModel*)obj resultString:(result)resultString
{
    MLUserModerl * userModel = [[MLUserModerl alloc] init];
    [userModel initData];
    
    userModel.account = obj.phone;//用户账号
    userModel.password = obj.password;//用户密码
    userModel.nickName = obj.userName;//用户昵称
    userModel.imgUrl = obj.imageUrl;//图片序号
    userModel.isGirl = obj.sex;//男孩女孩
    userModel.regTime = [NSString stringWithFormat:@"%@",[NSDate date]];//注册时间
    userModel.verifyCode = obj.code;//验证码
    userModel.area=obj.address;//区域
    
    [MLDataManager writeDic:[MLDataManager getUserData:userModel] type:@"1" resultString:^(id resultS) {
        resultString(resultS);
    }];
}

+(void)getPhoneCodeManager:(MLPhoneCodeModel *)obj resultString:(result)resultString
{
    NSDictionary * dic = @{
                            @"account":obj.phone
                           
                           };
    [MLDataManager writeDic:dic type:@"5" resultString:^(id resultS) {
        resultString(resultS);
    }];

}

+(void)loginManager:(MLLoginModel *)obj resultString:(result)resultString
{
    MLUserModerl * userModel = [[MLUserModerl alloc] init];
    [userModel initData];
    
    userModel.account = obj.phone;//用户账号
    userModel.password = obj.password;//用户密码
    
    [MLDataManager writeDic:[MLDataManager getUserData:userModel] type:@"3" resultString:^(id resultS) {
        resultString(resultString);
    }];
}

+(NSMutableDictionary*)getUserData:(MLUserModerl*)userModel
{
    unsigned int numberObj = 0;
    
    Ivar * vars = class_copyIvarList(NSClassFromString(@"MLUserModerl"), &numberObj);
    
    NSMutableArray * nameArray = [[NSMutableArray alloc] init];
    NSMutableArray * valueArray = [[NSMutableArray alloc] init];
    for(int i= 0;i<numberObj;i++)
    {
        Ivar thisIvar = vars[i];
        NSString * name = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        [nameArray addObject:[name substringWithRange:NSMakeRange(1, [name length]-1)]];
        
        [valueArray addObject:[MLMethod stringManager:[userModel valueForKey:name]]];
    }
    free(vars);
    
    NSMutableDictionary * dic =[[NSMutableDictionary alloc] init];
    
    for(int i = 0; i<[nameArray count] ; i++)
    {
        [dic setObject:valueArray[i] forKey:nameArray[i]];
    }

    return dic;
}

@end
