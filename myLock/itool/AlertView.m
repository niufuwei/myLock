//
//  AlertView.m
//  tempPush
//
//  Created by laoniu on 14/10/29.
//  Copyright (c) 2014年 xiaoma. All rights reserved.
//

#import "AlertView.h"
#import "MLMethod.h"

@implementation AlertView
{
    BOOL isShow;
    UIImageView * imageMBBJT;
    UIView * bgView;
    UITextField * textField;
    NSInteger old_height;
    NSInteger old_tag;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithPlaceHoder:(NSString*)placeHolder title:(NSString*)title view:(UIView*)view width:(NSInteger)width tag:(NSInteger)tag textLabel:(NSString*)textLabel
{
    if(self = [super init])
    {
        _view = view;
        old_tag  = tag;
        self.frame = CGRectMake(0, 0,width, self.view.frame.size.height);
//        [self setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3]];
        
        UIImageView * imageBGBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        [imageBGBG setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3]];
        imageBGBG.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
        [imageBGBG addGestureRecognizer:tap];
        
        [self addSubview:imageBGBG];
        
        NSInteger myHeight;
   
        myHeight = 140;
     
        bgView = [[UIView alloc] init];
        bgView.frame = CGRectMake(40, self.view.frame.size.height/2-myHeight/2, width-80, myHeight);
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 10;
        old_height =self.view.frame.size.height/2-myHeight/2;

        [self addSubview:bgView];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, bgView.frame.size.width, 30)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        [bgView addSubview:titleLabel];
        
        UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(0, titleLabel.frame.size.height+titleLabel.frame.origin.y+11, bgView.frame.size.width, 1)];
        [imageHeng setBackgroundColor:[UIColor colorWithRed:239.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1]];
        [bgView addSubview:imageHeng];

        textField = [[UITextField alloc] initWithFrame:CGRectMake(0, imageHeng.frame.size.height+imageHeng.frame.origin.y+5, bgView.frame.size.width, bgView.frame.size.height-imageHeng.frame.size.height-imageHeng.frame.origin.y-8-46)];
        textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.placeholder = placeHolder;
        textField.text = textLabel;
        textField.delegate =self;
        
        [bgView addSubview:textField];
        
        if(![[NSUserDefaults standardUserDefaults] objectForKey:@"isShow"])
        {
            isShow = FALSE;
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"isShow"];
            
        }
        else
        {
            if([[[NSUserDefaults standardUserDefaults] objectForKey:@"isShow"] isEqualToString:@"0"])
            {
                isShow = FALSE;
            }
            else
            {
                isShow = TRUE;
            }
        }
        
        UIImageView * imageHeng2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, textField.frame.size.height+textField.frame.origin.y+1, bgView.frame.size.width, 1)];
        [imageHeng2 setBackgroundColor:[UIColor colorWithRed:239.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1]];
        [bgView addSubview:imageHeng2];
        
        
        UIButton * leftButton =[UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, imageHeng2.frame.size.height+imageHeng2.frame.origin.y, bgView.frame.size.width/2, 45);
        leftButton.backgroundColor = [UIColor clearColor];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [leftButton setTitle:@"取消" forState:UIControlStateNormal];
        leftButton.tag = 101;
        [leftButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setTitleColor:RGB(48, 153, 250) forState:UIControlStateNormal];
        [bgView addSubview:leftButton];
        
        UIButton * rightButton =[UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(bgView.frame.size.width/2, imageHeng2.frame.size.height+imageHeng2.frame.origin.y, bgView.frame.size.width/2, 45);
        rightButton.backgroundColor = [UIColor clearColor];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [rightButton setTitle:@"确定" forState:UIControlStateNormal];
        rightButton.tag = 102;
        [rightButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setTitleColor:RGB(48, 153, 250) forState:UIControlStateNormal];
        [bgView addSubview:rightButton];
        
        UIImageView * imageHeng3 = [[UIImageView alloc] initWithFrame:CGRectMake(bgView.frame.size.width/2, imageHeng2.frame.size.height+imageHeng2.frame.origin.y,1, 45)];
        [imageHeng3 setBackgroundColor:[UIColor colorWithRed:239.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1]];
        [bgView addSubview:imageHeng3];

        [self registerForKeyboardNotifications];

    }
    return self;
}

-(void)onTap
{
    [self hidden];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect yy = bgView.frame;
        yy.origin.y = _view.frame.size.height-250-bgView.frame.size.height;
        bgView.frame = yy;
    }];
    
    return YES;
}

- (void)registerForKeyboardNotifications
{
    
    //使用NSNotificationCenter 鍵盤隐藏時
//    [[NSNotificationCenter defaultCenter] addObserver:self
    
//                                             selector:@selector(keyboardWillBeHidden:)
//     
//                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
}


////实现当键盘出现的时候计算键盘的高度大小。用于输入框显示位置
//- (void)keyboardWasShown:(NSNotification*)aNotification
//{
//    NSDictionary* info = [aNotification userInfo];
//    //kbSize即為鍵盤尺寸 (有width, height)
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
//    NSLog(@"hight_hitht:%f",kbSize.height);
//    
//    [UIView animateWithDuration:0.2 animations:^{
//        
//        CGRect yy = bgView.frame;
//        yy.origin.y = _view.frame.size.height-kbSize.height-bgView.frame.size.height;
//        bgView.frame = yy;
//    }];
//    
//}



//当键盘隐藏的时候
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect yy = bgView.frame;
        yy.origin.y = old_height;
        bgView.frame = yy;
    }];

    //do something
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect yy = bgView.frame;
        yy.origin.y = old_height;
        bgView.frame = yy;
    }];
}

-(id)initWithTitle:(NSString *)title contentData:(NSMutableArray *)contentData view:(UIView *)view tag:(NSInteger)tag
{
    if(self = [super init])
    {
        _view = view;
        _dataArray = contentData;
        old_tag  = tag;

        self.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        UIImageView * imageBGBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        [imageBGBG setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3]];
        imageBGBG.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
        [imageBGBG addGestureRecognizer:tap];
        
        [self addSubview:imageBGBG];
        
        NSInteger myHeight;
        if([_dataArray count]==1 || [_dataArray count]==0)
        {
            myHeight = 140;
        }
        else
        {
            if([_dataArray count] >4)
            {
                myHeight = 4*60+40+46;
            }
            else
            {
                myHeight =  ([_dataArray count]-1) * 60 +40+46;
            }
        }
        bgView = [[UIView alloc] init];
        bgView.frame = CGRectMake(40, self.view.frame.size.height/2-myHeight/2, _view.frame.size.width-80, myHeight);
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 10;
        [self addSubview:bgView];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, bgView.frame.size.width, 30)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        [bgView addSubview:titleLabel];
        
        UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(0, titleLabel.frame.size.height+titleLabel.frame.origin.y+11, bgView.frame.size.width, 1)];
        [imageHeng setBackgroundColor:[UIColor colorWithRed:239.0/255.0 green:237.0/255.0 blue:239.0/255.0 alpha:1]];
        [bgView addSubview:imageHeng];
        
        _contentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, imageHeng.frame.size.height+imageHeng.frame.origin.y+5, bgView.frame.size.width, bgView.frame.size.height-imageHeng.frame.size.height-imageHeng.frame.origin.y-8)];
        _contentTable.delegate = self;
        _contentTable.dataSource = self;
//        _contentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contentTable.tableFooterView = [[UIView alloc] init];
        _contentTable.backgroundColor = [UIColor clearColor];
        [bgView addSubview:_contentTable];
        
        if(![[NSUserDefaults standardUserDefaults] objectForKey:@"isShow"])
        {
            isShow = FALSE;
            [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"isShow"];

        }
        else
        {
            if([[[NSUserDefaults standardUserDefaults] objectForKey:@"isShow"] isEqualToString:@"0"])
            {
                isShow = FALSE;
            }
            else
            {
                isShow = TRUE;
            }
        }
        
    }
    return self;
}


-(void)onClick:(id)sender
{
    
  
        UIButton * btn = (UIButton*)sender;
        [self hidden];
        if(btn.tag == 101)
        {
            [_delegate cancleButtonClick];
        }
        else
        {
            if([textField.text length] == 0)
            {
                [MLMethod alertMessage:@"内容不能为空"];
            }
            else
            {
            [_delegate confirmButtonClick:old_tag selectStr:textField.text];
            }
        }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
//        imageMBBJT = [[UIImageView alloc] init];
//        if([[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"name"] isEqualToString:@"千里马"])
//        {
//            [cell.imageIcon setBackgroundColor:[UIColor colorWithRed:232/255.0 green:70/255.0 blue:37/255.0 alpha:1]];
//        }
//        else if([[[_dataArray objectAtIndex:indexPath.row] objectForKey:@"name"] isEqualToString:@"马宝宝"])
//        {
//            [cell.imageIcon setBackgroundColor:[UIColor colorWithRed:48/255.0 green:145/255.0 blue:218/255.0 alpha:1]];
//            
//            CGRect width = cell.money.frame;
//            width.size.width  = cell.money.frame.size.width -20;
//            cell.money.frame = width;
//            
//            imageMBBJT.frame = CGRectMake(width.size.width+width.origin.x+5, 14, 10, 12);
//            [imageMBBJT setImage:[UIImage imageNamed:@"to_more"]];
//            [cell.contentView addSubview:imageMBBJT];
//        }
//        else
//        {
//            [cell.imageIcon setBackgroundColor:[UIColor colorWithRed:100/255.0 green:20/255.0 blue:16/255.0 alpha:1]];
//            
//        }

    }
    cell.backgroundColor = [UIColor clearColor];
    
//    CGFloat red = (CGFloat)random() / (CGFloat)RAND_MAX;
//    
//    CGFloat green = (CGFloat)random() / (CGFloat)RAND_MAX;
//    
//    CGFloat blue = (CGFloat)random() / (CGFloat)RAND_MAX;

//    [cell.imageIcon setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
    
    cell.textLabel.text= [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hidden];
    NSLog(@"%d",old_tag);

    [_delegate confirmButtonClick:old_tag selectStr:[_dataArray objectAtIndex:indexPath.row]];
}

-(void)show
{
//    CGRect myFrame = self.frame;
//    
//    myFrame.origin.y = _view.frame.size.height;
//    self.frame = myFrame;
//    
//    [UIView animateWithDuration:0.2 animations:^{
//        
//        CGRect myFrame = self.frame;
//        
//        myFrame.origin.y = 150;
//        self.frame = myFrame;
//        
//    }];
//
    
    if(isShow)
    {
        for(UIView * view in self.view.subviews)
        {
            if([view viewWithTag:10086])
            {
                [view removeFromSuperview];
            }
        }
       
    }
    self.tag = 10086;
    [_view addSubview:self];

    bgView.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:0.3 animations:^{
        bgView.transform = CGAffineTransformIdentity;
        //view.transform = CGAffineTransformMakeScale(0, 0);
        //view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
       
    }];
    
    isShow = TRUE;
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"isShow"];

}

-(void)hidden
{
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect myFrame = bgView.frame;
        
        myFrame.origin.y = _view.frame.size.height;
        bgView.frame = myFrame;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        isShow = FALSE;
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"isShow"];


    }];
    
}

@end
