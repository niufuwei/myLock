//
//  MLRegistView.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@class MLPhoneCodeModel;
typedef void (^phoneCodeBlock)(NSString*phoneCode);

@protocol nextDelegate <NSObject>

-(void)pushViewController:(UIViewController*)vc animated:(BOOL)animated;

-(void)getPhoneCode:(MLPhoneCodeModel*)model phoneCode:(phoneCodeBlock)phoneCode;
@end


@interface MLRegistView : MLView
@property (nonatomic,weak) id<nextDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

@end
