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
#import <CommonCrypto/CommonDigest.h>
#import "SFHFKeychainUtils.h"

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
    }
    else if([obj isKindOfClass:[NSNumber class]])
    {
        return NO;
    }
    else
    {
        if(obj ==nil || [obj isKindOfClass:[NSNull class]] || [obj rangeOfString:@"null"].location != NSNotFound)
        {
            return YES;
        }
        return NO;
    }
}

+(id)dataManager:(id)data
{
    NSLog(@"%@",data);
    if([[data substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"AA"] && [[data substringWithRange:NSMakeRange([data length] - 4, 4)] isEqualToString:@"00BB"])
    {
        NSString * temp_data = [data substringWithRange:NSMakeRange(2, [data length]-6)];
        
        return [self dictionaryWithJsonString:temp_data];
    }
    return @{};
}

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+(BOOL)checkTel:(NSString *)str
{
    if ([str length] == 0) {
        return NO;
    }
    //1[0-9]{10}
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    //    NSString *regex = @"[0-9]{11}";
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if (!isMatch) {
        return NO;
    }
    
    return YES;
}

+(NSString *)stringManager:(id)obj
{
    if([MLMethod isEmpty:obj])
    {
        return @"";
    }
    return obj;
}

+ (NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (unsigned int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+(NSString *)getUUID
{

    NSError * err;
    if([MLMethod isEmpty:[SFHFKeychainUtils getPasswordForUsername:@"UDID" andServiceName:@"ZYB" error:&err]])
    {
        [self setUUID];
    }
    return [SFHFKeychainUtils getPasswordForUsername:@"UDID" andServiceName:@"ZYB" error:nil];
}

+(void)setUUID
{
    [SFHFKeychainUtils storeUsername:@"UDID" andPassword:[self uuid] forServiceName:@"ZYB" updateExisting:1 error:nil];

}

+(NSString*)uuid {
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *cfuuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    return cfuuidString;
}

@end
