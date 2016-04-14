//
//  MLMyCardView.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMyCardView.h"
#import "MLQRImage.h"

@interface MLMyCardView ()

@property (nonatomic,strong) UIScrollView * scrollview;
@end

@implementation MLMyCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame])
    {
        
        self.scrollview = [[UIScrollView alloc] initWithFrame:self.frame];
        [self addSubview:self.scrollview];
        
        UIImageView * logo = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width /2-50, 20, 100, 100)];
        [logo setImage:IMAGENAMED(@"maomi")];
        [self.scrollview addSubview:logo];
        
        UILabel * titleName = [[UILabel alloc] initWithFrame:CGRectMake(0, logo.frame.size.height+logo.frame.origin.y+10, kScreen_Width, 20)];
        titleName.text = @"老牛";
        titleName.font = FONTSIZE(14);
        titleName.backgroundColor= CLEARCOLOR;
        titleName.textAlignment = NSTextAlignmentCenter;
        [self.scrollview addSubview:titleName];
        
        UILabel * titleCode = [[UILabel alloc] initWithFrame:CGRectMake(0, titleName.frame.size.height+titleName.frame.origin.y+10, kScreen_Width, 20)];
        titleCode.text = @"生命就像一条大河，生命就像一条大河";
        titleCode.font = FONTSIZE(13);
        titleCode.backgroundColor= CLEARCOLOR;
        titleCode.textColor = GRAYCOLOR;
        titleCode.textAlignment = NSTextAlignmentCenter;
        [self.scrollview addSubview:titleCode];
        
        
        UIImageView * two = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width /2-100, titleName.frame.size.height+titleName.frame.origin.y+50, 200, 200)];
//        two = [MLQRImage getQRImageView];
        [two setImage:IMAGENAMED(@"maomi")];
        [self.scrollview addSubview:two];
        
        UILabel * titleBottom = [[UILabel alloc] initWithFrame:CGRectMake(0, two.frame.size.height+two.frame.origin.y+10, kScreen_Width, 20)];
        titleBottom.text = @"扫一扫上方二维码，加我爱锁";
        titleBottom.textAlignment = NSTextAlignmentCenter;
        titleBottom.font = FONTSIZE(13);
        titleBottom.backgroundColor= CLEARCOLOR;
        titleBottom.textColor = GRAYCOLOR;
        [self.scrollview addSubview:titleBottom];
        
        self.scrollview.contentSize = CGSizeMake(kScreen_Width, kScreen_Height+1);
        
    }
    return self;
}

@end
