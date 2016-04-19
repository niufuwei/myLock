//
//  MLDataModel.m
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLDataModel.h"

@implementation MLDataModel

+(instancetype)shareInstance
{
    static MLDataModel * dataModel  = nil;
    
    @synchronized (self) {
        if(!dataModel)
        {
            dataModel = [[self alloc] init];

        }
    }
    return dataModel;
}

+(void)initData
{
    [MLDataModel shareInstance].uid = @"0";
    [MLDataModel shareInstance].token = @"0";
    [MLDataModel shareInstance].pktNumber = @"0";
}

@end
