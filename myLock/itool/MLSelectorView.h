//
//  MLSelectorView.h
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^lockBlock)(id);

@interface MLSelectorView : UIButton

@property (nonatomic,copy) lockBlock backBlock;
-(id)initWithFrame:(CGRect)frame title:(NSString *)title lineFromX:(NSInteger)lineFromX lineColor:(UIColor*)lineColor textColor:(UIColor*)textColor backBlock:(lockBlock)backBlock;

@end
