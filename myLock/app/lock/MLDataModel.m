//
//  MLDataModel.m
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLDataModel.h"

@implementation MLDataModel


-(id)init
{
    if(self = [super init])
    {
        self.User = [[MLUserModerl alloc] init];

    }
    return self;
}

@end
