//
//  MLConFirmRegist.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"
#import "MLRegistModel.h"

@protocol conFirmDelegate <NSObject>

-(void)dismissViewControllerAnimated;
-(void)event:(UIButton*)btn;
-(void)regist:(MLRegistModel*)model;
@end

@interface MLConFirmRegist : MLView

@property (nonatomic,strong) MLRegistModel * registModel;

@property (nonatomic,weak) id<conFirmDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

@end
