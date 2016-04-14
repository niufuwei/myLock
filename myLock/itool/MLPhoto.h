//
//  MLPhoto.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^photoBlock)(id);

@interface MLPhoto : NSObject

@property (nonatomic,strong) photoBlock backData;

+(void)onImageSelect:(UIViewController*)vc backImage:(photoBlock)backImage;

@end
