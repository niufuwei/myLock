//
//  MLInformationView.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol inforDelegate <NSObject>

-(void)eventClick:(NSInteger)index;

@end

@interface MLInformationView : MLView

@property (nonatomic,weak) id<inforDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

-(void)updateUI:(NSInteger)index string:(NSString*)string;
-(void)updateUI:(UIImage*)image;
@end
