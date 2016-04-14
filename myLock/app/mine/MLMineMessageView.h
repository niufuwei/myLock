//
//  MLMessageView.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLView.h"

@protocol messageDelegate <NSObject>

-(void)clickEvent:(NSInteger)index;

@end

@interface MLMineMessageView : MLView

@property (nonatomic,weak) id<messageDelegate>delegate;

-(void)updateUI:(NSInteger)index isOpen:(BOOL)isOpen;
-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself;
@end
