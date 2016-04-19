//
//  MLDataObj.h
//  myLock
//
//  Created by laoniu on 16/3/25.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLDataObj : NSObject

@property (nonatomic, strong) NSString * isShowPasswordView;

@property (nonatomic, assign) BOOL isLogin;
+(instancetype)initDataObj;

@end
