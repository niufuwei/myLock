//
//  MLConFirmRegist.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol conFirmDelegate <NSObject>

-(void)dismissViewControllerAnimated;
-(void)event:(UIButton*)btn;
@end

@interface MLConFirmRegist : MLView
@property (nonatomic,weak) id<conFirmDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

@end
