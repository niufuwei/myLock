//
//  MLConFirmRegistViewController.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLViewController.h"

@protocol confirmEventDelegate <NSObject>
-(void)updateUI:(UIImage*)image;

@end
@interface MLConFirmRegistViewController : MLViewController

@property (nonatomic,strong) NSString * phone;
@property (nonatomic,strong) NSString * password;
@property (nonatomic,strong) NSString * code;

@property (nonatomic,weak) id<confirmEventDelegate>delegate;
@end
