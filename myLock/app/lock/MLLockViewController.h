//
//  MLLockViewController.h
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLViewController.h"

@protocol updatePassWordDelegate <NSObject>

-(void)updatePassowrd:(NSMutableArray*)dataArray;
-(void)hidePasswordView;

@end


@interface MLLockViewController : MLViewController
@property (nonatomic,weak) id<updatePassWordDelegate>delegate;

@end
