//
//  MLListSelectorView.m
//  myLock
//
//  Created by laoniu on 16/4/6.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLListSelectorView.h"
#import "MLMethod.h"

@interface MLListSelectorView ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) UITableView * MLTableView;
@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic,assign) NSInteger temp_tag;
@property (nonatomic,assign) NSInteger temp_table_x;
@property (nonatomic,strong) UIViewController * vc;

@end

@implementation MLListSelectorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

static MLListSelectorView * selector = nil;

+(MLListSelectorView*)shareInstance {
    @synchronized(self) {
        if(selector ==nil)
        {
            selector = [[self alloc] init];
            selector.MLTableView = [[UITableView alloc] init];
            selector.MLTableView.delegate =selector;
            selector.MLTableView.dataSource =selector;
            selector.MLTableView.backgroundColor = UIColorFromRGB(0x87d3e6);
            [selector.MLTableView.layer setCornerRadius:10];
            selector.MLTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            selector.MLTableView.separatorColor = WHITECOLOR;
            [[MLMethod getCurrentVC].view addSubview:selector.MLTableView];
        }
    }
    return selector;
}

+(void)showListSelectorView:(NSArray *)dataArray tag:(NSInteger)tag table_x:(NSInteger)table_x backIndex:(block)backIndex
{
    [MLListSelectorView shareInstance].backBlock = backIndex;
    
    [MLListSelectorView shareInstance].dataArray = dataArray;
    [MLListSelectorView shareInstance].temp_tag = tag;
    [MLListSelectorView shareInstance].MLTableView.frame = CGRectMake(table_x, 64,180.f/320.f*kScreen_Width, 0);

    [UIView animateWithDuration:0.2 animations:^{
        [MLListSelectorView shareInstance].MLTableView.frame = CGRectMake(table_x, 64,180.f/320.f*kScreen_Width, 100);

    }];

    [MLListSelectorView shareInstance].temp_table_x = table_x;

    [[MLListSelectorView shareInstance].MLTableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MLListSelectorView shareInstance].dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = CLEARCOLOR;
    cell.textLabel.textColor = WHITECOLOR;
    cell.textLabel.text = [[MLListSelectorView shareInstance].dataArray objectAtIndex:indexPath
                           .row];
    cell.tag = [MLListSelectorView shareInstance].temp_tag+indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    _backBlock(cell.tag);
    
    
    [UIView animateWithDuration:0.2 animations:^{
        [MLListSelectorView shareInstance].MLTableView.frame = CGRectMake([MLListSelectorView shareInstance].temp_table_x, 64,180.f/320.f*kScreen_Width, 0);
        
    }];
}


+(void)hideSelector
{
    [UIView animateWithDuration:0.2 animations:^{
        [MLListSelectorView shareInstance].MLTableView.frame = CGRectMake([MLListSelectorView shareInstance].temp_table_x, 64,180.f/320.f*kScreen_Width, 0);
        
    }];
}

@end
