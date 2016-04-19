//
//  MLSelectorView.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLSelectorView.h"

@interface MLSelectorView ()
{
    UIButton * buttonWoMen;
    UIButton * buttonMan;
}

@end

@implementation MLSelectorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame title:(NSString *)title lineFromX:(NSInteger)lineFromX lineColor:(UIColor*)lineColor textColor:(UIColor*)textColor backBlock:(lockBlock)backBlock;
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = CLEARCOLOR;
        _backBlock = backBlock;
      
        
        buttonMan = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonMan.frame = CGRectMake(lineFromX, frame.size.height - 20-10, 20 , 20);
        [buttonMan addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonMan setBackgroundImage:IMAGENAMED(@"regist_select") forState:UIControlStateNormal];
        buttonMan.tag = 1;
        [self addSubview:buttonMan];
        
        UILabel * labelMan = [[UILabel alloc] initWithFrame:CGRectMake(buttonMan.frame.size.width+buttonMan.frame.origin.x+2, frame.size.height - 20-10, 50, 20)];
        labelMan.text = @"男生";
        labelMan.font = FONTSIZE(13);
        labelMan.textColor = textColor;
        labelMan.textAlignment = NSTextAlignmentLeft;
        [self addSubview:labelMan];
        
        buttonWoMen = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonWoMen.frame = CGRectMake(labelMan.frame.size.width + labelMan.frame.origin.x+20, frame.size.height - 20-10, 20 , 20);
        [buttonWoMen addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonWoMen.tag = 2;
        [buttonWoMen setBackgroundImage:IMAGENAMED(@"regist_select") forState:UIControlStateNormal];
        [self addSubview:buttonWoMen];
        
        UILabel * labelWomen = [[UILabel alloc] initWithFrame:CGRectMake(buttonWoMen.frame.size.width+buttonWoMen.frame.origin.x+2, frame.size.height - 20-10, 60, 20)];
        labelWomen.text = @"女生";
        labelWomen.font = FONTSIZE(13);
        labelWomen.textColor = textColor;
        labelWomen.textAlignment = NSTextAlignmentLeft;
        [self addSubview:labelWomen];
        
        UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(lineFromX, frame.size.height-1, frame.size.width-2*lineFromX, 0.7)];
        [imageHeng setBackgroundColor:lineColor];
        [self addSubview:imageHeng];
    }
    return self;
}

-(void)onClick:(id)sender
{
    UIButton * btn = (UIButton*)sender;
    if(btn.tag ==1)
    {
        [buttonWoMen setBackgroundImage:IMAGENAMED(@"regist_select") forState:UIControlStateNormal];
        [buttonMan setBackgroundImage:IMAGENAMED(@"regist_selected") forState:UIControlStateNormal];

    }
    else
    {
        [buttonMan setBackgroundImage:IMAGENAMED(@"regist_select") forState:UIControlStateNormal];
        [buttonWoMen setBackgroundImage:IMAGENAMED(@"regist_selected") forState:UIControlStateNormal];


    }
    _backBlock(sender);
}

@end
