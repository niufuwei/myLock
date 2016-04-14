//
//  MLMessageView.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMineMessageView.h"
#import "MLMineModel.h"
#import "MLMineMessageCell.h"

@interface MLMineMessageView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) MLMineModel * mineModel;

@end

@implementation MLMineMessageView
@synthesize table;

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
        self.delegate =myself;
        
        table = [[UITableView alloc] initWithFrame:frame];
        table.delegate =self;
        table.dataSource= self;
        table.backgroundColor = CLEARCOLOR;
        table.tableFooterView = [[UIView alloc] init];
        [self addSubview:table];
        
        self.mineModel = [[MLMineModel alloc] init];
        self.mineModel.dataArray = [@[@[@"消息通知",@"未读消息提醒"],
                                      ]mutableCopy];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.mineModel.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.mineModel.dataArray objectAtIndex:section]count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strID = @"cell";
    MLMineMessageCell * cell = [table dequeueReusableCellWithIdentifier:strID];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MLMineMessageCell" owner:self  options:nil]lastObject];
    }
    
    cell.titleStr.text = [[self.mineModel.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.selectorButton.tag = indexPath.row +1;

    if(indexPath.row ==0)
    {
        if([[UIApplication sharedApplication] enabledRemoteNotificationTypes] == UIRemoteNotificationTypeNone)
        {
            [cell.selectorButton setImage:IMAGENAMED(@"closeSegMent") forState:UIControlStateNormal];
        }
        else
        {
            [cell.selectorButton setImage:IMAGENAMED(@"openSegMent") forState:UIControlStateNormal];
            
        }

    }
    else{
        
    
        [cell.selectorButton setImage:IMAGENAMED(self.mineModel.isOpenMessage?@"openSegMent":@"closeSegMent") forState:UIControlStateNormal];
    }
    
    [cell.selectorButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

-(void)onClick:(id)sender
{
    UIButton * btn = (UIButton*)sender;
    [_delegate clickEvent:btn.tag];
}

-(void)updateUI:(NSInteger)index isOpen:(BOOL)isOpen
{
    if(index ==1)
    {
        self.mineModel.isOpenPush = isOpen;

    }
    else
    {
        self.mineModel.isOpenMessage = isOpen;

    }
    MLMineMessageCell * cell = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index-1 inSection:0]];
    [cell.selectorButton setImage:IMAGENAMED(isOpen?@"openSegMent":@"closeSegMent") forState:UIControlStateNormal];
}


@end
