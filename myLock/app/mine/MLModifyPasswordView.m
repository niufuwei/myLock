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
#import "MLModifyPasswordModel.h"

@interface MLModifyPasswordView ()

@property (nonatomic,strong) MLTextFieldView * phoneTextField;
@property (nonatomic,strong) MLTextFieldView * textFieldOldPassword;
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
        _delegate = myself;
        self.scrollview = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:self.scrollview];
        
        UILabel * titleStr = [[UILabel alloc] initWithFrame:CGRectMake(20,0, kScreen_Width - 40, 50)];
        titleStr.backgroundColor = CLEARCOLOR;
        titleStr.text = @"请获取短信验证码，并设置新的登录密码";
        titleStr.font = FONTSIZE(14);
        titleStr.textAlignment = NSTextAlignmentLeft;
        [self.scrollview addSubview:titleStr];
        
        self.phoneTextField = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, titleStr.frame.size.height+titleStr.frame.origin.y, kScreen_Width, 50) title:@"手机号码" lineFromX:0 lineColor:LIGHTGRAY textColor:BLACKCOLOR backBlock:^(NSString* textfield) {
            NSLog(@"%@",textfield);
            
        }];
        self.phoneTextField.textfield.text = [MLUserModel shareInstance].account;
        self.phoneTextField.textfield.enabled = NO;
        self.phoneTextField.backgroundColor = WHITECOLOR;
        [self.scrollview addSubview:self.phoneTextField];
        
        self.textFieldOldPassword = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.phoneTextField.frame.size.height+self.phoneTextField.frame.origin.y, kScreen_Width, 50) title:@"旧密码" lineFromX:0 lineColor:LIGHTGRAY textColor:BLACKCOLOR backBlock:^(NSString* textfield) {
            NSLog(@"%@",textfield);
            
        }];
        self.textFieldOldPassword.textfield.secureTextEntry = YES;
        self.textFieldOldPassword.backgroundColor = WHITECOLOR;
        [self.scrollview addSubview:self.textFieldOldPassword];
        
        
        self.textFieldNewPassword = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.textFieldOldPassword.frame.size.height+self.textFieldOldPassword.frame.origin.y, kScreen_Width, 50) title:@"新密码" lineFromX:0 lineColor:LIGHTGRAY textColor:BLACKCOLOR backBlock:^(NSString* textfield) {
            
            NSLog(@"%@",textfield);
            
        }];
        self.textFieldNewPassword.textfield.secureTextEntry = YES;
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
    if([self checkData])
    {
        MLModifyPasswordModel * model = [[MLModifyPasswordModel alloc] init];
        model.psdMdyID = 0;
        model.userID = [MLUserModel shareInstance].userID;
        model.account = _phoneTextField.textfield.text;
        model.oldPsd = [MLMethod md5HexDigest:_textFieldOldPassword.textfield.text];
        model.nowPsd = [MLMethod md5HexDigest:_textFieldNewPassword.textfield.text];
        model.userImei = [MLMethod getUUID];
        [_delegate confirmModifyPassword:model result:^(id result) {
            NSLog(@"%@",result);
        }];
    }
}

-(BOOL)checkData
{
    if(![MLMethod checkTel:_phoneTextField.textfield.text])
    {
        [MLMethod alertMessage:@"请输入正确的手机号码"];
        return NO;
    }
    if([_textFieldOldPassword.textfield.text length] <6)
    {
        [MLMethod alertMessage:@"请输入六位以上密码"];
        return NO;
        
    }
    if([_textFieldNewPassword.textfield.text length] <6)
    {
        [MLMethod alertMessage:@"为确保您的账户安全，请输入六位以上新密码"];
        return NO;
        
    }
    return YES;

}


@end
