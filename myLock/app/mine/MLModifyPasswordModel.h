//
//  MLModifyPasswordModel.h
//  myLock
//
//  Created by laoniu on 16/4/19.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLModifyPasswordModel : NSObject

@property (nonatomic,assign) NSInteger psdMdyID;
@property (nonatomic,assign) NSInteger userID;
@property (nonatomic,strong) NSString * account;
@property (nonatomic,strong) NSString * oldPsd;
@property (nonatomic,strong) NSString * nowPsd;
@property (nonatomic,strong) NSString * userImei;
@end
