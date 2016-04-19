//
//  MLLoginView.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLLoginView.h"
#import "MLTextFieldView.h"
#import "MLCodeView.h"
#import "MLRegistViewController.h"
#import "MLForgetPasswordViewController.h"
#import "MLTabbarViewController.h"
#import "AppDelegate.h"
#import "MLLoginModel.h"

@interface MLLoginView ()<UIScrollViewDelegate>

@property (nonatomic,strong) MLTextFieldView * textFieldNewPassword;
@property (nonatomic,strong) MLTextFieldView * textFieldPhone;
@property (nonatomic,strong) UIScrollView * scrollview;
@property (nonatomic,strong) UIButton * buttonConfrim ;
@property (nonatomic,strong) UIButton * registButton;
@property (nonatomic,strong) UIButton * forgetButton;

@end

@implementation MLLoginView

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
        
        
    
        self.textFieldNewPassword = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.textFieldPhone.frame.size.height+self.textFieldPhone.frame.origin.y +10, kScreen_Width, 50) title:@"密码" lineFromX:20 lineColor:WHITECOLOR textColor:WHITECOLOR backBlock:^(NSString* textfield) {
        }];
        self.textFieldNewPassword.textfield.secureTextEntry = YES;
        [self.scrollview addSubview:self.textFieldNewPassword];

        self.registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.registButton.frame = CGRectMake(20, self.textFieldNewPassword.frame.size.height+self.textFieldNewPassword.frame.origin.y , 100, 20);
        [self.registButton setBackgroundColor:CLEARCOLOR];
        [self.registButton setTitle:@"还未注册？立即注册" forState:UIControlStateNormal];
        self.registButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.registButton.tag = 101;
        self.registButton.titleLabel.font = FONTSIZE(11);
        [self.registButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollview addSubview:self.registButton];
        
        
        self.forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.forgetButton.frame = CGRectMake(kScreen_Width - 100 - 20, self.textFieldNewPassword.frame.size.height+self.textFieldNewPassword.frame.origin.y , 100, 20);
        [self.forgetButton setBackgroundColor:CLEARCOLOR];
        [self.forgetButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
        self.forgetButton.tag = 102;
        [self.forgetButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        self.forgetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.forgetButton.titleLabel.font = FONTSIZE(11);
        [self.scrollview addSubview:self.forgetButton];
        
        self.buttonConfrim = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonConfrim.frame = CGRectMake(20, self.forgetButton.frame.size.height+self.forgetButton.frame.origin.y +20, kScreen_Width-40, 50);
        [self.buttonConfrim setTitle:@"提交" forState:UIControlStateNormal];
        self.buttonConfrim.tag = 103;
        [self.buttonConfrim addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        self.buttonConfrim.layer.borderColor = WHITECOLOR.CGColor;
        self.buttonConfrim.layer.borderWidth = 0.5;
        [self.buttonConfrim.layer setCornerRadius:5];
        [self.scrollview addSubview:self.buttonConfrim];
        
        self.scrollview.contentSize = CGSizeMake(kScreen_Width, kScreen_Height+1);
    }
    return self;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self endEditing:YES];
}

-(void)onClick:(id)sender
{
    UIButton * btn = (UIButton*)sender;
    switch (btn.tag ) {
        case 101:
        {
            //注册
            MLRegistViewController * regist = [[MLRegistViewController alloc] init];
            [_delegate pushViewController:regist animated:YES];
            
        }
            break;
        case 102:
        {
            //忘记密码
            MLForgetPasswordViewController * forget = [[MLForgetPasswordViewController alloc] init];
            [_delegate pushViewController:forget animated:YES];
        }
            break;
            
        case 103:
        {
            //登录
            if([self checkData])
            {
                MLLoginModel * model = [[MLLoginModel alloc] init];
                model.phone = _textFieldPhone.textfield.text;
                model.password = [MLMethod md5HexDigest:_textFieldNewPassword.textfield.text];
                [_delegate login:model];
            }
        
        }
            break;
            
        default:
            break;
    }
}

-(BOOL)checkData
{
    if([MLMethod isEmpty:_textFieldPhone.textfield.text])
    {
        [MLMethod alertMessage:@"请输入用户名"];
        return NO;
    }
    if([MLMethod isEmpty:_textFieldNewPassword.textfield.text])
    {
        [MLMethod alertMessage:@"请输入您的密码"];
        return NO;
    }
    return YES;
}


@end
