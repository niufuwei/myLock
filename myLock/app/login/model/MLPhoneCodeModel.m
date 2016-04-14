//
//  MLPhoneCode.m
//  myLock
//
//  Created by laoniu on 16/4/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLPhoneCodeModel.h"
#import "MLDataManager.h"

@interface MLPhoneCodeModel ()

@end

@implementation MLPhoneCodeModel

+(instancetype)shareInstan
{
    static MLPhoneCodeModel * phoneCodeModel;
    @synchronized (self) {
        if(!phoneCodeModel)
        {
            phoneCodeModel = [[self alloc]init];

        }
    }
    return phoneCodeModel;
}

+(void)getPhoneCode:(NSString * )phone phoneCode:(result)phoneCode
{
    [MLPhoneCodeModel shareInstan].account = phone;
    
    [MLDataManager getPhoneCodeManager:phone resultString:^(id resultString) {
        phoneCode(resultString);
    }];
}

@end
