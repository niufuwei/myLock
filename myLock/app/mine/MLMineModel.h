//
//  MLMineModel.h
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLDictionary.h"

@interface MLMineModel : MLDictionary

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) NSMutableDictionary * dataDic;

@property (nonatomic,assign)  BOOL isOpenPush;
@property (nonatomic,assign)  BOOL isOpenMessage;
@end
