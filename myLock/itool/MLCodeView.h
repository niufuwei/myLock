//
//  MLCodeButton.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^codeBlock)(id);

@interface MLCodeView : UIView
@property (nonatomic,strong) UITextField * textfield;
@property (nonatomic,strong) NSString * phone;
@property (nonatomic,copy) codeBlock backBlock;
-(id)initWithFrame:(CGRect)frame title:(NSString *)title lineFromX:(NSInteger)lineFromX lineColor:(UIColor*)lineColor textColor:(UIColor*)textColor backgroundColor:(UIColor*)backgroundColor backBlock:(codeBlock)backBlock;

@end
