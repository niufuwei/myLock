//
//  MLMethod.m
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMethod.h"
#import "MLDataObj.h"
#import "MLPasswordView.h"

@interface MLMethod ()


@end

@implementation MLMethod
@synthesize backBlock;

static UIView * temp_passwordView = nil;

+ (MLMethod *)sharedSingleton
{
    static MLMethod *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[MLMethod alloc] init];
        
        return sharedSingleton;
    }
}

#pragma mark --
#pragma 将UIColor变换为UIImage
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


#pragma mark --
#pragma 弹出输入密码的弹框
+(void)popPassWordView:(block)backStr
{
//    [MLDataObj initDataObj].isShowPasswordView = ![MLDataObj initDataObj].isShowPasswordView;
  
    BOOL isExitWithPasswordView = FALSE;
    [MLMethod sharedSingleton].backBlock = backStr;
    for(UIView * v in [[MLMethod getCurrentVC].view subviews])
    {
        if(123456 == v.tag)
        {
            isExitWithPasswordView = TRUE;
            break;
        }
        else
        {
            isExitWithPasswordView = FALSE;
        }
    }
    if(!isExitWithPasswordView)
    {
        [[MLMethod getCurrentVC].view addSubview:[MLMethod getPasswordView]];
    }
    
    [MLMethod showPasswordView:temp_passwordView];
}

+(void)showPasswordView:(UIView*)view
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect indexYY = view.frame;
        indexYY.origin.y = kScreen_Height-view.frame.size.height;
        view.frame = indexYY;
    }];
}

+(void)hidePasswordView
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect indexYY = temp_passwordView.frame;
        indexYY.origin.y = kScreen_Height;
        temp_passwordView.frame = indexYY;
    }];
    
    
}


#pragma mark --
#pragma 获取当前controller
+(UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

+(UIView * )getPasswordView
{
    UIView * passwordView = [[MLPasswordView alloc] initWithFrame:CGRectMake(0, kScreen_Height, kScreen_Width, kScreen_Height/2+83) savePassword:^{
        
    } back:^{
        
    } input:^(NSInteger index) {
        [MLMethod sharedSingleton].backBlock(index);
    }];
    [passwordView setBackgroundColor:COLORA(0, 0, 0, 0.8)];
    passwordView.tag = 123456;
    temp_passwordView = passwordView;
    return passwordView;
}

+(void)updatePassword:(NSMutableArray *)dataArray
{
    [(MLPasswordView*)temp_passwordView updatePasswordUI:dataArray];
}

+(void)alertMessage:(NSString *)string
{
    UIAlertView * aler = [[UIAlertView alloc] initWithTitle:nil message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [aler show];
}

+(BOOL)isEmpty:(id)obj
{
    if([obj isKindOfClass:[NSString class]])
    {
        if([obj length] ==0)
        {
            return YES;
        }
        return NO;
    }else
    {
        if(obj ==nil || [obj isKindOfClass:[NSNull class]] || [obj rangeOfString:@"null"].location != NSNotFound)
        {
            return YES;
        }
        return NO;
    }
}

@end
