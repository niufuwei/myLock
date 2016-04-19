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
#import "MLUserModel.h"
#import "MLRegistModel.h"
#import "MLPhoneCodeModel.h"
#import <objc/runtime.h>
#import "MLLoginModel.h"
#import "MLForgetModel.h"
#import "MLModifyPasswordModel.h"

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
    [MLUserModel initData];
    
    [MLUserModel shareInstance].account = obj.phone;//用户账号
    [MLUserModel shareInstance].password = obj.password;//用户密码
    [MLUserModel shareInstance].nickName = obj.userName;//用户昵称
    [MLUserModel shareInstance].imgUrl = obj.imageUrl;//图片序号
    [MLUserModel shareInstance].isGirl = obj.sex;//男孩女孩
    [MLUserModel shareInstance].regTime = [NSString stringWithFormat:@"%@",[NSDate date]];//注册时间
    [MLUserModel shareInstance].verifyCode = obj.code;//验证码
    [MLUserModel shareInstance].area=obj.address;//区域
    //imei
    [MLUserModel shareInstance].accountImei = [MLMethod getUUID];

    [MLDataManager writeDic:[MLDataManager dataCheck:[MLUserModel shareInstance] class_Name:@"MLUserModel"] type:@"1" resultString:^(id resultS) {
        resultString(resultS);
    }];
}

+(void)getPhoneCodeManager:(MLPhoneCodeModel *)obj resultString:(result)resultString
{
    [MLDataManager writeDic:[self dataCheck:obj class_Name:@"MLPhoneCodeModel"] type:@"5" resultString:^(id resultS) {
        resultString(resultS);
    }];

}

+(void)loginManager:(MLLoginModel *)obj resultString:(result)resultString
{
    [MLUserModel initData];
    
    [MLUserModel shareInstance].account = obj.phone;//用户账号
    [MLUserModel shareInstance].password = obj.password;//用户密码
    //imei
    [MLUserModel shareInstance].accountImei = [MLMethod getUUID];

    [MLDataManager writeDic:[MLDataManager dataCheck:[MLUserModel shareInstance] class_Name:@"MLUserModel"] type:@"3" resultString:^(id resultS) {
        resultString(resultS);
    }];
}

+(void)findPasswordManager:(MLForgetModel *)obj resultString:(result)resultString
{
    [MLUserModel initData];
    
    [MLUserModel shareInstance].account = obj.phone;//用户账号
    [MLUserModel shareInstance].password = obj.password;//用户密码
    [MLUserModel shareInstance].verifyCode = obj.code;//验证码
    //imei
    [MLUserModel shareInstance].accountImei = [MLMethod getUUID];
    
    [MLDataManager writeDic:[MLDataManager dataCheck:[MLUserModel shareInstance] class_Name:@"MLUserModel"] type:@"9" resultString:^(id resultS) {
        resultString(resultS);
    }];

}

+(void)modifyPasswordManager:(MLModifyPasswordModel *)obj resultString:(result)resultString
{
    NSLog(@"%@",[self dataCheck:obj class_Name:@"MLModifyPasswordModel"]);
    [MLDataManager writeDic:[self dataCheck:obj class_Name:@"MLModifyPasswordModel"] type:@"6" resultString:^(id resultS) {
        resultString(resultS);
    }];

}

+(NSMutableDictionary*)dataCheck:(id)obj class_Name:(NSString*)className
{
  
    unsigned int numberObj = 0;
    
    Ivar * vars = class_copyIvarList(NSClassFromString(className), &numberObj);
    
    NSMutableArray * nameArray = [[NSMutableArray alloc] init];
    NSMutableArray * valueArray = [[NSMutableArray alloc] init];
    for(int i= 0;i<numberObj;i++)
    {
        Ivar thisIvar = vars[i];
        NSString * name = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        [nameArray addObject:[name substringWithRange:NSMakeRange(1, [name length]-1)]];
        
        [valueArray addObject:[MLMethod stringManager:[obj valueForKey:name]]];
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
