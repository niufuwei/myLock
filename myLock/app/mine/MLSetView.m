//
//  MLSetView.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLSetView.h"
#import "MLMineModel.h"
#import "MLSetCell.h"
#import "MLMineMessageViewController.h"
#import "MLModifyPasswordViewController.h"
#import "MLPrivacyViewController.h"

@interface MLSetView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) MLMineModel * mineModel;

@end

@implementation MLSetView
@synthesize table;


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
        self.mineModel.dataArray = [@[@[@"消息通知"],
                                    @[@"修改密码",
                                      @"关于爱锁",
                                      @"隐私设置",
                                      @"意见反馈"],
                                      @[@"退出登录"]]mutableCopy];
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
    MLSetCell * cell = [table dequeueReusableCellWithIdentifier:strID];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MLSetCell" owner:self  options:nil]lastObject];
    }
    
    cell.titleStr.text = [[self.mineModel.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        if(indexPath.row ==0 )
        {
            MLMineMessageViewController * message = [[MLMineMessageViewController alloc] init];
            [_delegate pushViewController:message animated:YES];
        }
    }
    else if(indexPath.section ==1)
    {
        if(indexPath.row == 0)
        {
            MLModifyPasswordViewController * modify = [[MLModifyPasswordViewController alloc] init];
            [_delegate pushViewController:modify animated:YES];
        }
        else if(indexPath.row ==2)
        {
            MLPrivacyViewController * privacy = [[MLPrivacyViewController alloc] init];
            [_delegate pushViewController:privacy animated:YES];
        }
      
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
