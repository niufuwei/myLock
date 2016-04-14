//
//  MLRegistView.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol nextDelegate <NSObject>

-(void)pushViewController:(UIViewController*)vc animated:(BOOL)animated;
@end


@interface MLRegistView : MLView
@property (nonatomic,weak) id<nextDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

@end
