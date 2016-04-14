//
//  MLBlackListView.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol blackListDelegate <NSObject>

-(void)pushViewController:(UIViewController*)vc animated:(BOOL)animated;
-(void)eventClick;

@end

@interface MLBlackListView : MLView

@property (nonatomic,weak) id<blackListDelegate>delegate;
@end
