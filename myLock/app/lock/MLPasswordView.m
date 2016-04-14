//
//  MLPasswordView.m
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLPasswordView.h"

@interface MLPasswordView ()



@end

@implementation MLPasswordView

-(id)initWithFrame:(CGRect)frame savePassword:(isSavePassword)savePassword back:(backKeyBoard)back input:(inputString)input
{
    if(self = [super initWithFrame:frame])
    {
        _temp_backKeyBoard = back;
        _temp_inputString = input;
        _temp_SavePassword = savePassword;
        
        UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 50)];
        title.text = @"输入开锁密码";
        title.font = FONTSIZE(20);
        title.textColor = WHITECOLOR;
        title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:title];
        
        UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(15, 17.5, 10, 15);
        [backButton setBackgroundImage:IMAGENAMED(@"backWhite") forState:UIControlStateNormal];
        backButton.tag =38;
        [backButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
        
        
        UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, kScreen_Width, 1)];
        [imageHeng setBackgroundColor:WHITECOLOR];
        [self addSubview:imageHeng];
        
#pragma mark --
#pragma mark 密码输入框
        
        
        NSInteger button_x = (kScreen_Width-45*6)/2;
        for(int i=0;i<6;i++)
        {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(button_x, imageHeng.frame.size.height+imageHeng.frame.origin.y+20, 45, 45);
            [button setBackgroundColor:CLEARCOLOR];
            button.layer.borderColor = WHITECOLOR.CGColor;
            button.layer.borderWidth = 1;
            button.tag = i+1;
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            button_x = button.frame.size.width + button.frame.origin.x;
        }
        
#pragma mark --
#pragma mark 记住密码选择器
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((kScreen_Width-45*6)/2 , imageHeng.frame.size.height+imageHeng.frame.origin.y+15+5 + 45+15, 15, 15);
        [button setBackgroundColor:CLEARCOLOR];
        button.layer.borderColor = WHITECOLOR.CGColor;
        button.layer.borderWidth = 1;
        button.tag = 7;
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UILabel * titlePassword = [[UILabel alloc] initWithFrame:CGRectMake(button.frame.size.width+button.frame.origin.x +5, imageHeng.frame.size.height+imageHeng.frame.origin.y+20 + 45, 100, 45)];
        titlePassword.text = @"记住密码";
        titlePassword.font = FONTSIZE(15);
        titlePassword.textColor = WHITECOLOR;
        titlePassword.textAlignment = NSTextAlignmentLeft;
        [self addSubview:titlePassword];
        
        
        
#pragma mark --
#pragma mark - - -
        
        UIImageView * imageHeng2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, titlePassword.frame.size.height+ titlePassword.frame.origin.y +5, kScreen_Width, 1)];
        [imageHeng2 setBackgroundColor:WHITECOLOR];
        [self addSubview:imageHeng2];
        
        UIImageView * imageHeng3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, imageHeng2.frame.size.height+ imageHeng2.frame.origin.y +50, kScreen_Width, 1)];
        [imageHeng3 setBackgroundColor:WHITECOLOR];
        [self addSubview:imageHeng3];

        UIImageView * imageHeng4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, imageHeng3.frame.size.height+ imageHeng3.frame.origin.y +50, kScreen_Width, 1)];
        [imageHeng4 setBackgroundColor:WHITECOLOR];
        [self addSubview:imageHeng4];
        
        UIImageView * imageHeng5 = [[UIImageView alloc] initWithFrame:CGRectMake(0, imageHeng4.frame.size.height+ imageHeng4.frame.origin.y +50, kScreen_Width, 1)];
        [imageHeng5 setBackgroundColor:WHITECOLOR];
        [self addSubview:imageHeng5];
        
        
        
        UIImageView * imageHeng6 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/3,titlePassword.frame.size.height+ titlePassword.frame.origin.y + 5, 1, 200)];
        [imageHeng6 setBackgroundColor:WHITECOLOR];
        [self addSubview:imageHeng6];
        
        UIImageView * imageHeng7 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/3*2, titlePassword.frame.size.height+ titlePassword.frame.origin.y + 5, 1, 200)];
        [imageHeng7 setBackgroundColor:WHITECOLOR];
        [self addSubview:imageHeng7];
        
        
        NSInteger button_xx = 0;
        NSInteger button_yy = imageHeng2.frame.size.height+ imageHeng2.frame.origin.y ;
        for(int i = 0; i< 12;i++)
        {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(button_xx, button_yy, kScreen_Width/3, 50);
            [button setBackgroundColor:CLEARCOLOR];
            button.tag = i+100;
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            if((i+1) %3 ==0)
            {
                button_yy = button.frame.size.height + button.frame.origin.y+1;
                button_xx = 0;
            }
            else
            {
                button_xx = button.frame.size.width + button.frame.origin.x;
            }
            if(i ==9)
            {
                [button setEnabled:NO];
            }
            else
            {
                [button setEnabled:YES];
            }
            if(i>=9)
            {
                
                if(i ==10)
                {
                    [button setTitle:[NSString stringWithFormat:@"%d",0] forState:UIControlStateNormal];
                }
                else if(i ==11)
                {
                    [button setImage:IMAGENAMED(@"delete") forState:UIControlStateNormal];
                }
            }
            else
            {
                [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];

            }
        }
    }
    return self;
}

-(void)onClick:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    _temp_inputString(btn.tag);
}

-(void)updatePasswordUI:(NSMutableArray *)dataArray
{
 
    NSInteger i =0;
    for(UIButton*btn in self.subviews)
    {
        if(btn.tag >=1 && btn.tag <=6)
        {
            if(i<[dataArray count])
            {
                [btn setTitle:[dataArray objectAtIndex:i] forState:UIControlStateNormal];

            }
            else{
                [btn setTitle:@"" forState:UIControlStateNormal];

            }

            i ++;

        }
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
