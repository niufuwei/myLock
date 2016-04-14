//
//  XMTabbarItem.m
//  XM_Bank
//
//  Created by laoniu on 14/11/17.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "MLTabbarItem.h"

@implementation MLTabbarItem

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        UIView * lineImage = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
        lineImage.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1];
        [self addSubview:lineImage];
        
        _itemIcon = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-17)/2, 9, 16, 17)];
        [self addSubview:_itemIcon];
        
        _itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 15)];
        _itemTitle.textColor = [UIColor whiteColor];
        _itemTitle.font = [UIFont systemFontOfSize:12];
        _itemTitle.backgroundColor = [UIColor clearColor];
        _itemTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_itemTitle];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
