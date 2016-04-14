//
//  MLPhoneCode.h
//  myLock
//
//  Created by laoniu on 16/4/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^result)(id resultString);

@interface MLPhoneCodeModel : NSObject

@property (nonatomic,strong) NSString * account;

+(void)getPhoneCode:(NSString * )phone phoneCode:(result)phoneCode;

@end
