//
//  MLDataObj.m
//  myLock
//
//  Created by laoniu on 16/3/25.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLDataObj.h"

@implementation MLDataObj

+(instancetype)initDataObj
{
    static MLDataObj * DataObj = nil;
    dispatch_once_t t;
    dispatch_once(&t, ^{
        DataObj = [[self alloc] init];
    });
    return DataObj;
    
}

@end
