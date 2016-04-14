//
//  MLLoginModel.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^result)(id resultString);

@interface MLLoginModel : NSObject

+(void)loginDataObj:(NSDictionary *)dataDic registResult:(result)registResult;

@end
