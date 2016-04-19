//
//  MLForgetView.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@class MLForgetModel;

typedef void (^phoneCodeBlock)(NSString*phoneCode);

@protocol forgetDelegate <NSObject>
-(void)getPhoneCode:(MLPhoneCodeModel*)model phoneCode:(phoneCodeBlock)phoneCode;

-(void)dismissViewControllerAnimated;
-(void)confirmFindPassword:(MLForgetModel*)model;
@end

@interface MLForgetView : MLView

@property (nonatomic,weak) id<forgetDelegate>delegate;
-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

@end
