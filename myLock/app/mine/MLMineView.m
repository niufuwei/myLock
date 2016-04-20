//
//  MLMineView.m
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLMineView.h"
#import "MLMineModel.h"
#import "MLMineViewCell.h"
#import "MLSetViewController.h"
#import "MLMyCardViewController.h"
#import "MLInformationViewController.h"

@interface MLMineView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) MLMineModel * mineModel;

@end

@implementation MLMineView
@synthesize table;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController *)myself
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
        self.mineModel.dataArray = [@[@[@{@"icon":@"mine_lock_icon",@"title":@"爱锁"},
                                        @{@"icon":@"mine_root_icon",@"title":@"权限"},
                                        @{@"icon":@"mine_two_icon",@"title":@"名片"},
                                        @{@"icon":@"mine_share_icon",@"title":@"推荐给好友"}],
                                      @[@{@"icon":@"mine_set_icon",@"title":@"设置"}]]mutableCopy];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        return 178;
    }
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 1;
    }
    else if(section ==1)
    {
        return [[self.mineModel.dataArray objectAtIndex:0]count];

    }
    else
    {
        return [[self.mineModel.dataArray objectAtIndex:1]count];
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        static NSString * strID = @"cell";
        MLMineViewCell * cell = [table dequeueReusableCellWithIdentifier:strID];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MLMineViewHeadCell" owner:self  options:nil]lastObject];
        }
        
        return cell;

    }
    else if(indexPath.section ==1)
    {
        static NSString * strID = @"cell";
        MLMineViewCell * cell = [table dequeueReusableCellWithIdentifier:strID];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MLMineViewCell" owner:self  options:nil]lastObject];
        }
     
        cell.titleStr.text = [[[self.mineModel.dataArray objectAtIndex:0] objectAtIndex:indexPath.row] objectForKey:@"title"];
        [cell.icon setImage:IMAGENAMED([[[self.mineModel.dataArray objectAtIndex:0] objectAtIndex:indexPath.row] objectForKey:@"icon"])];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    else{
        static NSString * strID = @"cell";
        MLMineViewCell * cell = [table dequeueReusableCellWithIdentifier:strID];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MLMineViewCell" owner:self  options:nil]lastObject];
        }
        
        cell.titleStr.text = [[[self.mineModel.dataArray objectAtIndex:1] objectAtIndex:indexPath.row] objectForKey:@"title"];
        [cell.icon setImage:IMAGENAMED([[[self.mineModel.dataArray objectAtIndex:1] objectAtIndex:indexPath.row] objectForKey:@"icon"])];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        MLInformationViewController * info = [[MLInformationViewController alloc] init];
        [_delegate pushViewController:info animated:YES];
    }
    if(indexPath.section ==1)
    {
      
        if(indexPath.row ==2)
        {
            MLMyCardViewController * card = [[MLMyCardViewController alloc] init];
            [_delegate pushViewController:card animated:YES];
        }
        
    }
    if(indexPath.section ==2)
    {
        MLSetViewController * set = [[MLSetViewController alloc] init];
        [_delegate pushViewController:set animated:YES];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
