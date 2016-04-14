//
//  MLRecodeListView.m
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLRecodeListView.h"
#import "MLRecodeListCell.h"
#import "MLRecodeMapView.h"

@interface MLRecodeListView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@end

@implementation MLRecodeListView

-(id)initWithFrame:(CGRect)frame myself:(UIViewController *)myself
{
    if(self = [super initWithFrame:frame])
    {
        self.delegate = myself;

        self.table = [[UITableView alloc] initWithFrame:frame];
        self.table.delegate =self;
        self.table.dataSource =self;
        [self addSubview:self.table];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strID = @"cell";
    MLRecodeListCell * cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MLRecodeListCell" owner:self  options:nil]lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MLRecodeMapView * map = [[MLRecodeMapView alloc] init];
    [_delegate pushViewController:map animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
