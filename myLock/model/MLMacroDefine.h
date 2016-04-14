//
//  MacroDefine.h
//  myLock
//
//  Created by laoniu on 16/3/9.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#ifndef MLMacroDefine_h
#define MLMacroDefine_h
// Get RGBA Color
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
// Get RGB Color
#define RGB(r,g,b)          RGBA(r,g,b,1.0f)
// RGB（hexadecimal->decimal）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define COLOR(R,G,B)      [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1]
#define COLORA(R,G,B,A)   [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#define WHITECOLOR        [UIColor whiteColor]
#define BLACKCOLOR        [UIColor blackColor]
#define YELLOWCOLOR       [UIColor yellowColor]
#define GRAYCOLOR         [UIColor grayColor]
#define DARKGRAY          [UIColor darkGrayColor]
#define LIGHTGRAY         [UIColor lightGrayColor]
#define BLUECOLOR         [UIColor blueColor]
#define REDCOLOR          [UIColor redColor]
#define BROWNCOLOR        [UIColor brownColor]
#define GREENCOLOR        [UIColor greenColor]
#define CLEARCOLOR        [UIColor clearColor]

#define DIC(TITLE,CONTENT) [NSDictionary dictionaryWithObjectsAndKeys:TITLE,@"title",CONTENT,@"content", nil]

#define FONTSIZE(size) [UIFont systemFontOfSize:size]
#define FONTSIZE_NAME(name,size) [UIFont fontWithName:[name intValue] size:size]

#define IMAGENAMED(imageName) [UIImage imageNamed:imageName]

/**
 *  Device
 */
#define isRetina ([[UIScreen mainScreen] scale]==2)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define isRetinaOld ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1536, 2048), [[UIScreen mainScreen] currentMode].size)||CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)||CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define iPhone4 (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define iPhone5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define iPhone6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define iPhone6plus (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


#define isIOS4 ([[[UIDevice currentDevice] systemVersion] intValue]==4)

#define isIOS5 ([[[UIDevice currentDevice] systemVersion] intValue]==5)

#define isIOS6 ([[[UIDevice currentDevice] systemVersion] intValue]==6)

#define isAfterIOS4 ([[[UIDevice currentDevice] systemVersion] intValue] >= 4)

#define isAfterIOS5 ([[[UIDevice currentDevice] systemVersion] intValue] >= 5)

#define isAfterIOS6 ([[[UIDevice currentDevice] systemVersion] intValue] >= 6)

#define IsAfterIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0)

#define iOSCurrentVersion ([[[UIDevice currentDevice] systemVersion]floatValue])

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


// openURL
#define canOpenURL(appScheme) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]])

#define openURL(appScheme) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]])

// telphone

#define canTel   ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]])

#define tel(phoneNumber)       ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])

#define telprompt(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])

//应用尺寸(不包括状态栏,通话时状态栏高度不是20，所以需要知道具体尺寸)

#define kContent_Height   ([UIScreen mainScreen].applicationFrame.size.height)

#define kContent_Width    ([UIScreen mainScreen].applicationFrame.size.width)

#define kContent_Frame    (CGRectMake(0, 0 ,kContent_Width,kContent_Height))

#define kContent_CenterX  kContent_Width/2

#define kContent_CenterY  kContent_Height/2


//设备屏幕尺寸

#define kScreen_Height   ([UIScreen mainScreen].bounds.size.height)

#define kScreen_Width    ([UIScreen mainScreen].bounds.size.width)

#define kScreen_Frame    (CGRectMake(0, 0 ,kScreen_Width,kScreen_Height))

#define kScreen_CenterX  kScreen_Width/2

#define kScreen_CenterY  kScreen_Height/2


//输出frame(frame是结构体，没法%@)

#define LOGRECT(f) NSLog(@"\nx:%f\ny:%f\nwidth:%f\nheight:%f\n",f.origin.x,f.origin.y,f.size.width,f.size.height)

#define LOGBOOL(b)  NSLog(@"%@",b?@"YES":@"NO");

//弹出信息

#define ALERT(msg) [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil] show]

// defineLog pattern
#ifdef DEBUG
#define MyLog(...) NSLog(__VA_ARGS__)
#else
#define MyLog(...)
#endif
#endif /* MacroDefine_h */
