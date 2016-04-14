//
//  MLPrivacyView.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol PrivacyDelegate <NSObject>

-(void)pushViewController:(UIViewController*)vc animated:(BOOL)animated;
-(void)clickEvent:(NSInteger)index;

@end

@interface MLPrivacyView : MLView

@property (nonatomic,weak) id<PrivacyDelegate>delegate;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;

-(void)updateUI:(NSInteger)index isOpen:(BOOL)isOpen;
@end
