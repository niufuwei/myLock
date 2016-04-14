//
//  MLConFirmRegist.m
//  myLock
//
//  Created by laoniu on 16/4/5.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLConFirmRegist.h"
#import "MLTextFieldView.h"
#import "MLSelectorView.h"
#import "MLConFirmRegistViewController.h"

@interface MLConFirmRegist ()<UIScrollViewDelegate,confirmEventDelegate>
@property (nonatomic,strong) MLTextFieldView * address;
@property (nonatomic,strong) MLTextFieldView * userName;
@property (nonatomic,strong) MLSelectorView * selectorView;
@property (nonatomic,strong) UIScrollView * scrollview;
@property (nonatomic,strong) UIButton * buttonConfrim ;
@property (nonatomic,strong) UIButton * photoButton ;

@end

@implementation MLConFirmRegist

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
        
        self.photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.photoButton.frame = CGRectMake((kScreen_Width - 80)/2, 40, 80, 80);
        self.photoButton.tag = 101;
        [self.photoButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.photoButton.layer setCornerRadius:5];
        [self.photoButton setImage:IMAGENAMED(@"regist_photo") forState:UIControlStateNormal];
        self.photoButton.backgroundColor = COLORA(255, 255, 255, 0.4);
        [self.scrollview addSubview:self.photoButton];
        
        self.userName = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.photoButton.frame.size.height+self.photoButton.frame.origin.y +30, kScreen_Width, 50) title:@"我的昵称" lineFromX:20 lineColor:WHITECOLOR textColor:WHITECOLOR backBlock:^(NSString* textfield) {
        }];
        [self.scrollview addSubview:self.userName];
        
        self.selectorView = [[MLSelectorView alloc] initWithFrame:CGRectMake(0, self.userName.frame.size.height+self.userName.frame.origin.y +10, kScreen_Width, 50) title:@"" lineFromX:20 lineColor:WHITECOLOR textColor:WHITECOLOR backBlock:^(id btn) {
            
        }];
        [self.scrollview addSubview:self.selectorView];
        
        self.address = [[MLTextFieldView alloc] initWithFrame:CGRectMake(0, self.selectorView.frame.size.height+self.selectorView.frame.origin.y +10, kScreen_Width, 50) title:@"地区" lineFromX:20 lineColor:WHITECOLOR textColor:WHITECOLOR backBlock:^(NSString* textfield) {
        }];
        [self.scrollview addSubview:self.address];
 
        self.buttonConfrim = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonConfrim.frame = CGRectMake(20, self.address.frame.size.height+self.address.frame.origin.y +20, kScreen_Width-40, 50);
        [self.buttonConfrim setTitle:@"加入爱锁" forState:UIControlStateNormal];
        [self.buttonConfrim addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        self.buttonConfrim.layer.borderColor = WHITECOLOR.CGColor;
        self.buttonConfrim.layer.borderWidth = 0.5;
        [self.buttonConfrim.layer setCornerRadius:5];
        self.buttonConfrim.tag = 102;
        [self.scrollview addSubview:self.buttonConfrim];
    
        self.scrollview.contentSize = CGSizeMake(kScreen_Width, kScreen_Height+1);
        
    }
    return self;
}

-(void)onClick:(id)sender
{
    UIButton * btn = (UIButton *)sender;
    if(btn.tag ==101)
    {
        [_delegate event:sender];
        
    }
    else
    {
        [_delegate dismissViewControllerAnimated];

    }
}

-(void)updateUI:(UIImage *)image
{
    [self.photoButton setImage:nil forState:UIControlStateNormal];
    [self.photoButton setBackgroundImage:image forState:UIControlStateNormal];

}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self endEditing:YES];
}

@end
