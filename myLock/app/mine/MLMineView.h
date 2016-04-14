//
//  MLMineView.h
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol mineViewDelegate <NSObject>

-(void)pushViewController:(UIViewController*)vc animated:(BOOL)animated;

@end

@interface MLMineView : MLView
@property (nonatomic,weak) id<mineViewDelegate>delegate;
-(id)initWithFrame:(CGRect)frame myself:(UIViewController *)myself;

@end
