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

+(void)registDataObj:(NSDictionary *)dataDic registResult:(result)registResult;
@end
