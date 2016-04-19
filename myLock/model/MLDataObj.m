//
//  MLDataObj.m
//  myLock
//
//  Created by laoniu on 16/3/25.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLDataObj.h"

@implementation MLDataObj

static MLDataObj * DataObj = nil;

+(instancetype)initDataObj
{
    @synchronized (self) {
        if(!DataObj)
        {
            DataObj = [[self alloc] init];

        }
    }
    return DataObj;
    
}

@end
