//
//  MLServiceModel.h
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLDictionary.h"

@interface MLServiceModel : MLDictionary

@property (nonatomic,strong) NSString * imageName;
@property (nonatomic,strong) NSString * titleStr;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,assign) NSInteger temp_tag;
@property (nonatomic,strong) NSString * lockName;
@property (nonatomic,strong) NSString * startTime;
@property (nonatomic,strong) NSString * endTime;

@end
