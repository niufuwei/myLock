//
//  MLTextFieldButton.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLTextFieldView.h"

@implementation MLTextFieldView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame title:(NSString *)title lineFromX:(NSInteger)lineFromX lineColor:(UIColor *)lineColor textColor:(UIColor *)textColor backBlock:(blockBB)backBlock
{
    if(self = [super initWithFrame:frame])
    {
        
        _backBlock = backBlock;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, frame.size.height)];
        label.text = title;
        label.font = FONTSIZE(13);
        label.textColor = textColor;
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        
        
        self.textfield =  [[UITextField alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width +5, 10, kScreen_Width-100, frame.size.height -20)];
        self.textfield.font = FONTSIZE(15);
        self.textfield.textColor = textColor;
        [self.textfield addTarget:self  action:@selector(valueChanged:)  forControlEvents:UIControlEventAllEditingEvents];
        [self addSubview:self.textfield];
        
        
        UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(lineFromX, frame.size.height-1, frame.size.width-lineFromX*2, 0.5)];
        [imageHeng setBackgroundColor:lineColor];
        [self addSubview:imageHeng];
    }
    return self;
}

-(void)valueChanged:(UITextField *)textField{
    _backBlock(textField.text);
}


@end
