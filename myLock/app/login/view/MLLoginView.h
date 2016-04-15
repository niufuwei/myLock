//
//  MLLoginView.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"


@class MLLoginModel;
@protocol loginDelegate <NSObject>


-(void)pushViewController:(UIViewController*)vc animated:(BOOL)animated;
-(void)dismissViewControllerAnimated;
-(void)login:(MLLoginModel*)model;
@end

@interface MLLoginView : MLView

@property (nonatomic,weak) id<loginDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

@end
