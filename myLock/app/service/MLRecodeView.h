//
//  MLRecodeView.h
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol recodeDelegate <NSObject>

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated;

@end

@interface MLRecodeView : MLView

@property (nonatomic,weak) id<recodeDelegate>delegate;


-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;
@end
