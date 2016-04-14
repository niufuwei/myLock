//
//  MLMethod.h
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLObject.h"
#import <UIKit/UIKit.h>


typedef void (^block)(NSInteger index);

@interface MLMethod : MLObject


@property (nonatomic,strong) block backBlock;
/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color;


+ (MLMethod *)sharedSingleton;

//弹出密码输入框
+(void)popPassWordView:(block)backStr;

//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentVC;

+(void)updatePassword:(NSMutableArray *)dataArray;

+(void)hidePasswordView;

+(void)alertMessage:(NSString*)string;

+(BOOL)isEmpty:(id)obj;
@end
