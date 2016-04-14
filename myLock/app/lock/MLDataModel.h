//
//  MLDataModel.h
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MLUserModerl.h"

@interface MLDataModel : NSObject

@property (nonatomic,strong) NSString * type;
@property (nonatomic,strong) NSString * uid;
@property (nonatomic,strong) NSString * token;
@property (nonatomic,strong) MLUserModerl * User;
@property (nonatomic,strong) NSString * pktNumber;

@end
