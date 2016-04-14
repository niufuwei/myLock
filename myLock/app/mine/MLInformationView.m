//
//  MLInformationView.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLInformationView.h"
#import "MLMineModel.h"
#import "MLInforCell.h"

@interface MLInformationView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) MLMineModel * mineModel;
@end


@implementation MLInformationView
@synthesize table;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame myself:(UIViewController*)myself{
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
        self.mineModel.dataArray = [@[@{@"title":@"头像",@"content":@""},
                                      @{@"title":@"昵称",@"content":@"红纸盖"},
                                      @{@"title":@"性别",@"content":@"女"},
                                      @{@"title":@"地区",@"content":@"浙江杭州"},
                                      @{@"title":@"账号",@"content":@"1860013087"},
                                      @{@"title":@"个性签名",@"content":@"自动换行自动换行自动换行自动换行自动换行自动换行自动换行自动换行自动换行自动换行自动换行"}]mutableCopy];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.mineModel.dataArray count];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(indexPath.row ==0)
   {
       static NSString * strID = @"cell";
       MLInforCell * cell = [table dequeueReusableCellWithIdentifier:strID];
       if(!cell)
       {
           cell = [[[NSBundle mainBundle] loadNibNamed:@"MLInforImageCell" owner:self  options:nil]lastObject];
       }
       
       cell.titleStr.text = [[self.mineModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
       cell.ritht_top_Image.hidden = NO;

       return cell;
   }
    else
    {
        static NSString * strID = @"cell1";
        MLInforCell * cell = [table dequeueReusableCellWithIdentifier:strID];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MLInforCell" owner:self  options:nil]lastObject];
        }
        
        cell.titleStr.text = [[self.mineModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
        
        if(indexPath.row == 1 || indexPath.row == 2||indexPath.row == 4)
        {
            cell.ritht_top_Image.hidden = YES;
        }
        else
        {
            cell.ritht_top_Image.hidden = NO;
        }
        
        cell.rightName.text = [[self.mineModel.dataArray objectAtIndex:indexPath.row] objectForKey:@"content"];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MLInforCell*cell = [table cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    [_delegate eventClick:indexPath.row];
}

-(void)updateUI:(UIImage*)image
{
    MLInforCell * cell = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell.logoImage setImage:image];
}

-(void)updateUI:(NSInteger)index string:(NSString*)string
{
    MLInforCell * cell = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    cell.rightName.text = string;
}

@end
