//
//  MLForgetView.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLForgetView.h"
#import "MLTextFieldView.h"
#import "MLCodeView.h"


@interface MLForgetView ()<UIScrollViewDelegate>

@property (nonatomic,strong) MLTextFieldView * textFieldNewPassword;
@property (nonatomic,strong) MLTextFieldView * textFieldPhone;
@property (nonatomic,strong) MLCodeView * codeView;
@property (nonatomic,strong) UIScrollView * scrollview;
@property (nonatomic,strong) UIButton * buttonConfrim ;
@end

@implementation MLForgetView

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
        self.delegate = myself;
        
        self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        [self.scrollview setBackgroundColor:[UIColor colorWithPatternImage:IMAGENAMED(@"loginViewBG")]];
        self.scrollview.delegate =self;
        [self addSubview:self.scrollview];
        
        self.textFieldPhone = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, 40, kScreen_Width, 50) title:@"手机号" lineFromX:20 lineColor:WHITECOLOR textColor:WHITECOLOR backBlock:^(NSString* textfield) {
        }];
        [self.scrollview addSubview:self.textFieldPhone];
        
        
        self.codeView = [[MLCodeView alloc] initWithFrame:CGRectMake(0, self.textFieldPhone.frame.size.height+self.textFieldPhone.frame.origin.y+10, kScreen_Width, 50) title:@"验证码" lineFromX:20 lineColor:WHITECOLOR textColor:WHITECOLOR backgroundColor:COLORA(255, 255, 255, 0.4) backBlock:^(id btn) {
            //获取验证码
            self.codeView.backgroundColor = CLEARCOLOR;
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
        [self.scrollview addSubview:self.codeView];
        
        
        self.textFieldNewPassword = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.codeView.frame.size.height+self.codeView.frame.origin.y +10, kScreen_Width, 50) title:@"新密码" lineFromX:20 lineColor:WHITECOLOR textColor:WHITECOLOR backBlock:^(NSString* textfield) {
        }];
        [self.scrollview addSubview:self.textFieldNewPassword];
        
        
        self.buttonConfrim = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonConfrim.frame = CGRectMake(20, self.textFieldNewPassword.frame.size.height+self.textFieldNewPassword.frame.origin.y +20, kScreen_Width-40, 50);
        [self.buttonConfrim setTitle:@"提交" forState:UIControlStateNormal];
        [self.buttonConfrim addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        self.buttonConfrim.layer.borderColor = WHITECOLOR.CGColor;
        self.buttonConfrim.layer.borderWidth = 0.5;
        [self.buttonConfrim.layer setCornerRadius:5];
        [self.scrollview addSubview:self.buttonConfrim];
        self.scrollview.contentSize = CGSizeMake(kScreen_Width, kScreen_Height+1);

    }
    return self;
}

-(void)onClick:(id)sender
{
    [_delegate dismissViewControllerAnimated];
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self endEditing:YES];
}

@end
