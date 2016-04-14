//
//  MLServiceView.m
//  myLock
//
//  Created by laoniu on 16/3/14.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLServiceView.h"
#import "MLServiceCell.h"
#import "MLServiceModel.h"
#import "MLOpenLockRecodeView.h"

@interface MLServiceView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) MLServiceModel * serviceModel;
@end

@implementation MLServiceView
@synthesize table;

-(id)initWithFrame:(CGRect)frame myself:(UIViewController *)myself
{
    if(self = [super initWithFrame:frame])
    {
        self.delegate = myself;
        table = [[UITableView alloc] initWithFrame:frame];
        table.delegate =self;
        table.dataSource =self;
        table.tableFooterView = [[UIView alloc] init];
        table.backgroundColor = CLEARCOLOR;
        [self addSubview:table];
        
        self.serviceModel = [[MLServiceModel alloc] init];
        self.serviceModel.dataArray = [@[@{@"icon":@"share",@"title":@"分享权限"},
                                        @{@"icon":@"openLockRecord",@"title":@"开锁记录"},
                                         @{@"icon":@"buyLock",@"title":@"购买爱锁"},
                                         @{@"icon":@"askAndangser",@"title":@"常见问题回答"}]mutableCopy];
    }
    return self;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.serviceModel.dataArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strID = @"cell";
    MLServiceCell * cell = [table dequeueReusableCellWithIdentifier:strID];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MLServiceCell" owner:self options:nil]lastObject];
    }
    
    NSLog(@"%@",[[self.serviceModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"icon"]);
    [cell.icon setImage:IMAGENAMED([[self.serviceModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"icon"])];
    cell.titleStr.text = [[self.serviceModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(indexPath.row ==1)
   {
       MLOpenLockRecodeView * recode = [[MLOpenLockRecodeView alloc] init];
       [_delegate pushViewController:recode animated:YES];
   }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
