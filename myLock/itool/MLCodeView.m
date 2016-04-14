//
//  MLCodeButton.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLCodeView.h"
#import "MLMethod.h"

@implementation MLCodeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame title:(NSString *)title lineFromX:(NSInteger)lineFromX lineColor:(UIColor *)lineColor textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor backBlock:(codeBlock)backBlock
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = CLEARCOLOR;
        _backBlock = backBlock;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, frame.size.height)];
        label.text = title;
        label.font = FONTSIZE(13);
        label.textColor = textColor;
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        
        
        self.textfield = [[UITextField alloc] initWithFrame:CGRectMake(label.frame.origin.x+label.frame.size.width +5, 10, 100, frame.size.height -20)];
        self.textfield.font = FONTSIZE(13);
        self.textfield.textColor = textColor;
        self.textfield.backgroundColor = CLEARCOLOR;
        [self addSubview:self.textfield];
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(frame.size.width - 100, 10, 80, frame.size.height - 20);
        [button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = 5;
        [button setBackgroundColor:backgroundColor];
        button.titleLabel.font = FONTSIZE(12);
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
//        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:button];
        
        UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(lineFromX, frame.size.height-1, frame.size.width-2*lineFromX, 0.7)];
        [imageHeng setBackgroundColor:lineColor];
        [self addSubview:imageHeng];
    }
    return self;
}

-(void)onClick:(id)sender
{
    
    _backBlock(sender);

}
@end
