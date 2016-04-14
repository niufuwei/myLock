//
//  NavCustom.h
//  ELiuYan
//
//  Created by laoniu on 14-4-29.
//  Copyright (c) 2014年 chaoyong.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NavCustomDelegate <NSObject>
@optional

-(void)NavRightButtononClick;
-(void)NavLeftButtononClick;

@end
@interface MLNavCustom : NSObject


-(void)setNavWithText:(NSString *)NavTitile mySelf:(UIViewController *)mySelf;
-(void)setNavWithImage:(NSString *)imgName mySelf:(UIViewController*)mySelf width:(int)width height:(int)height;

-(void)setNavRightBtnTitle:(NSString *)RightBtnTitle mySelf:(UIViewController *)mySelf width:(int)width height:(int)height;

-(void)setNavRightBtnImage:(NSString *)RightBtnImage RightBtnSelectedImage:(NSString *)RightBtnSelectedImage mySelf:(UIViewController *)mySelf width:(int)width height:(int)height;

-(void)setNavLeftBtnImage:(NSString *)LeftBtnImage LeftBtnSelectedImage:(NSString *)LeftBtnSelectedImage mySelf:(UIViewController *)mySelf width:(int)width height:(int)height;

-(void)setNavLeftBtnTitle:(NSString *)LeftBtnTitle mySelf:(UIViewController *)mySelf width:(int)width height:(int)height;
-(void)setNavTitleBackImage:(NSString *)title mySelf:(UIViewController*)mySelf width:(int)width;

@property (nonatomic,weak) id<NavCustomDelegate>NavDelegate;

@end
