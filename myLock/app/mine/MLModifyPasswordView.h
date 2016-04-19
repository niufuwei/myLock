//
//  MLModifyPasswordView.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@class MLModifyPasswordModel;

typedef void (^modifyPasswordBack)(id result);
@protocol modifyPasswordDelegate <NSObject>

-(void)confirmModifyPassword:(MLModifyPasswordModel*)model result:(modifyPasswordBack)result;
@end


@interface MLModifyPasswordView : MLView

@property (nonatomic,weak) id<modifyPasswordDelegate>delegate;
-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;
@end
