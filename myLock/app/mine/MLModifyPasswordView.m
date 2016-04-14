//
//  MLModifyPasswordView.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLModifyPasswordView.h"
#import "MLCodeView.h"
#import "MLTextFieldView.h"

@interface MLModifyPasswordView ()

@property (nonatomic,strong) MLCodeView * codeView;
@property (nonatomic,strong) MLTextFieldView * textFieldCode;
@property (nonatomic,strong) MLTextFieldView * textFieldNewPassword;
@property (nonatomic,strong) UIScrollView * scrollview;
@end

@implementation MLModifyPasswordView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself
{
    if(self = [super initWithFrame:frame])
    {
        self.scrollview = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:self.scrollview];
        
        UILabel * titleStr = [[UILabel alloc] initWithFrame:CGRectMake(20,0, kScreen_Width - 40, 50)];
        titleStr.backgroundColor = CLEARCOLOR;
        titleStr.text = @"请获取短信验证码，并设置新的登录密码";
        titleStr.font = FONTSIZE(14);
        titleStr.textAlignment = NSTextAlignmentLeft;
        [self.scrollview addSubview:titleStr];
        
        
        self.codeView = [[MLCodeView alloc] initWithFrame:CGRectMake(0, titleStr.frame.size.height+titleStr.frame.origin.y, kScreen_Width, 50) title:@"手机号码" lineFromX:0 lineColor:LIGHTGRAY textColor:BLACKCOLOR backgroundColor:UIColorFromRGB(0x0095ca) backBlock:^(id btn) {
            //获取验证码
            UIButton * button = (UIButton*)btn;
            
            __block int timeout=60; //倒计时时间
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
            dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
            dispatch_source_set_event_handler(_timer, ^{
                if(timeout<=0){ //倒计时结束，关闭
                    dispatch_source_cancel(_timer);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //设置界面的按钮显示 根据自己需求设置
                        [button setTitle:@"获取验证码" forState:UIControlStateNormal];
                        [button setEnabled:YES];
                    });
                }else{
                    int seconds = timeout % 61;
                    NSString *strTime = [NSString stringWithFormat:@"重新获取(%d)", seconds];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //设置界面的按钮显示 根据自己需求设置
                        [button setEnabled:NO];
                        [button setTitle:strTime forState:UIControlStateNormal];
                    });
                    timeout--;
                    
                }
            });
            dispatch_resume(_timer);
            
            
        }];
        self.codeView.backgroundColor = WHITECOLOR;
        [self.scrollview addSubview:self.codeView];
        
        self.textFieldCode = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.codeView.frame.size.height+self.codeView.frame.origin.y, kScreen_Width, 50) title:@"验证码" lineFromX:0 lineColor:LIGHTGRAY textColor:BLACKCOLOR backBlock:^(NSString* textfield) {
            NSLog(@"%@",textfield);
            
        }];
        self.textFieldCode.backgroundColor = WHITECOLOR;
        [self.scrollview addSubview:self.textFieldCode];
        
        
        self.textFieldNewPassword = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.textFieldCode.frame.size.height+self.textFieldCode.frame.origin.y, kScreen_Width, 50) title:@"新密码" lineFromX:0 lineColor:LIGHTGRAY textColor:BLACKCOLOR backBlock:^(NSString* textfield) {
            
            NSLog(@"%@",textfield);
            
        }];
        self.textFieldNewPassword.backgroundColor = WHITECOLOR;
        [self.scrollview addSubview:self.textFieldNewPassword];
        
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, self.textFieldNewPassword.frame.size.height+self.textFieldNewPassword.frame.origin.y+20, kScreen_Width - 40, 50);
        [button setBackgroundColor:UIColorFromRGB(0x0095ca)];
        [button setTitle:@"提交" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = 5;
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollview addSubview:button];
        
        self.scrollview.showsVerticalScrollIndicator = NO;
        self.scrollview.contentSize = CGSizeMake(kScreen_Width, kScreen_Height+1);
        
    }
    return self;
}


-(void)onClick:(id)sender
{
    
}


@end
