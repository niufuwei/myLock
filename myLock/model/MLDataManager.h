//
//  MLDataManager.h
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^result)(id resultString);


@interface MLDataManager : NSObject
//注册
+(void)registDataManager:(id)obj resultString:(result)resultString;

//获取验证码
+(void)getPhoneCodeManager:(id)phone resultString:(result)resultString;

@end
