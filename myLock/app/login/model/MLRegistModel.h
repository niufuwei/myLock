//
//  MLRegistModel.h
//  myLock
//
//  Created by laoniu on 16/4/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^result)(id resultString);

@interface MLRegistModel : NSObject

@property (nonatomic,strong) NSString * phone;
@property (nonatomic,strong) NSString * password;
@property (nonatomic,strong) NSString * code;
@property (nonatomic,strong) NSString * userName;
@property (nonatomic,strong) NSString * imageUrl;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,strong) NSString * address;

@end
