//
//  MLSetView.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol setViewDelegate <NSObject>

-(void)pushViewController:(UIViewController*)vc animated:(BOOL)animated;

@end

@interface MLSetView : MLView

@property (nonatomic,weak) id<setViewDelegate>delegate;


-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;
@end
