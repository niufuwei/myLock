//
//  MLListSelectorView.h
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

typedef void (^block)(NSInteger index);

@interface MLListSelectorView : MLView

@property (nonatomic,copy) block backBlock;

+(void)showListSelectorView:(NSArray *)dataArray tag:(NSInteger)tag table_x:(NSInteger)table_x backIndex:(block)backIndex;

+(void)hideSelector;
@end
