//
//  MLDataManager.h
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^result)(id resultString);

@class MLRegistModel;
@class MLPhoneCodeModel;
@class MLLoginModel;

@interface MLDataManager : NSObject
//注册
+(void)registDataManager:(MLRegistModel*)obj resultString:(result)resultString;
//获取验证码
+(void)getPhoneCodeManager:(MLPhoneCodeModel *)obj resultString:(result)resultString;

+(void)loginManager:(MLLoginModel*)obj resultString:(result)resultString;
@end
