//
//  MLPrivacyView.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLPrivacyView.h"
#import "MLMineModel.h"
#import "MLMineMessageCell.h"
#import "MLSetCell.h"
#import "MLBlackListViewController.h"


@interface MLPrivacyView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) MLMineModel * mineModel;

@end

@implementation MLPrivacyView
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
        self.mineModel.dataArray = [@[@"通讯录黑名单",@"不让陌生人找到我"
                                      ]mutableCopy];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        static NSString * strID = @"cell";
        MLSetCell * cell = [table dequeueReusableCellWithIdentifier:strID];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MLSetCell" owner:self  options:nil]lastObject];
        }
        
        cell.titleStr.text = [self.mineModel.dataArray objectAtIndex:indexPath.section];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;

    }
    else
    {
        static NSString * strID = @"cell2";
        MLMineMessageCell * cell = [table dequeueReusableCellWithIdentifier:strID];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MLMineMessageCell" owner:self  options:nil]lastObject];
        }
        
        cell.titleStr.text = [self.mineModel.dataArray objectAtIndex:indexPath.section] ;
        
        cell.selectorButton.tag = 2;
        
        [cell.selectorButton setImage:IMAGENAMED(self.mineModel.isOpenMessage?@"openSegMent":@"closeSegMent") forState:UIControlStateNormal];
        
        [cell.selectorButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
        
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section ==0)
    {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)];
        
        return view;
    }
    else
    {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10,0, 200, 20)];
        label.backgroundColor = CLEARCOLOR;
        label.text = @"打开后会自动屏蔽附近的搜索查找";
        label.font = FONTSIZE(12);
        label.textColor = COLORA(0, 0, 0, 0.5);
        [view addSubview:label];
        return view;

    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        MLBlackListViewController * list = [[MLBlackListViewController alloc] init];
        [_delegate pushViewController:list animated:YES];
    }
    else
    {
        
    }
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
    self.mineModel.isOpenMessage = isOpen;
        
    MLMineMessageCell * cell = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index-1 inSection:0]];
    [cell.selectorButton setImage:IMAGENAMED(isOpen?@"openSegMent":@"closeSegMent") forState:UIControlStateNormal];
}


@end
