//
//  AlertView.h
//  tempPush
//
//  Created by laoniu on 14/10/29.
//  Copyright (c) 2014年 xiaoma. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol alertDelegate <NSObject>

-(void)cancleButtonClick;
-(void)confirmButtonClick:(NSInteger)tag selectStr:(NSString*)selectStr;
@end

@interface AlertView : UIView<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UITableView * contentTable;
@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) UIView * view;
@property (nonatomic,weak) id<alertDelegate>delegate;

-(id)initWithPlaceHoder:(NSString*)placeHolder title:(NSString*)title view:(UIView*)view width:(NSInteger)width tag:(NSInteger)tag textLabel:(NSString*)textLabel;


-(id)initWithTitle:(NSString*)title contentData:(NSMutableArray*)contentData view:(UIView*)view tag:(NSInteger)tag;
-(void)show;
-(void)hidden;
@end
