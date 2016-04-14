//
//  MLTextFieldButton.h
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^blockBB)(id);

@interface MLTextFieldView : UIButton

@property (nonatomic,strong) UITextField * textfield;

@property (nonatomic,copy) blockBB backBlock;
-(id)initWithFrame:(CGRect)frame title:(NSString *)title lineFromX:(NSInteger)lineFromX lineColor:(UIColor*)lineColor textColor:(UIColor*)textColor backBlock:(blockBB)backBlock;
@end
