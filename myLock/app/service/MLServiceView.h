//
//  MLServiceView.h
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol serviceDelegate <NSObject>

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated;

@end


@interface MLServiceView : MLView

@property (nonatomic,weak) id<serviceDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;
@end
