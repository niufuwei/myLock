//
//  MLBlackListView.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLBlackListView.h"
#import "MLMineModel.h"
#import "MLBlackListCell.h"

@interface MLBlackListView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) MLMineModel * mineModel;

@end

@implementation MLBlackListView
@synthesize table;

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {        
        table = [[UITableView alloc] initWithFrame:frame];
        table.delegate =self;
        table.dataSource= self;
        table.backgroundColor = CLEARCOLOR;
        table.tableFooterView = [[UIView alloc] init];
        [self addSubview:table];
        
        self.mineModel = [[MLMineModel alloc] init];
        self.mineModel.dataArray = [@[@{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"},
                                        @{@"icon":@"maomi",@"title":@"通讯录黑名单"}
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
    MLBlackListCell * cell = [table dequeueReusableCellWithIdentifier:strID];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MLBlackListCell" owner:self  options:nil]lastObject];
    }
    
    cell.titleStr.text = [[self.mineModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"title"] ;
    [cell.icon setImage:IMAGENAMED([[self.mineModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"icon"])];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
        
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


@end
