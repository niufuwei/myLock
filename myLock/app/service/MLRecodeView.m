//
//  MLRecodeView.m
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLRecodeView.h"
#import "MLServiceModel.h"
#import "MLOpenLockRecodeList.h"

@interface MLRecodeView ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) UIScrollView * scrollview;
@property (nonatomic,strong) UIPickerView * pickView;
@property (nonatomic,strong) MLServiceModel * serviceModel;
@property (nonatomic,strong) UIDatePicker *datePicker;


@end

@implementation MLRecodeView
@synthesize scrollview;


-(id)initWithFrame:(CGRect)frame myself:(UIViewController *)myself{
    if(self = [super initWithFrame:frame])
    {
        
        self.delegate = myself;
        
        scrollview = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:scrollview];
        
        UIButton * lockButtonselector = [UIButton buttonWithType:UIButtonTypeCustom];
        lockButtonselector.frame = CGRectMake(20, 30, kScreen_Width-40, 45);
        lockButtonselector.backgroundColor = CLEARCOLOR;
        [lockButtonselector setTitle:@"爱锁" forState:UIControlStateNormal];
        [lockButtonselector setTitleColor:GRAYCOLOR forState:UIControlStateNormal];
        lockButtonselector.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        lockButtonselector.tag = 1;
        [lockButtonselector addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollview addSubview:lockButtonselector];
        
        UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(20, lockButtonselector.frame.size.height+lockButtonselector.frame.origin.y , kScreen_Width -40, 1)];
        [imageHeng setBackgroundColor:UIColorFromRGB(0x0095ca)];
        [scrollview addSubview:imageHeng];
        
        UIButton * startButtonselector = [UIButton buttonWithType:UIButtonTypeCustom];
        startButtonselector.frame = CGRectMake(20, lockButtonselector.frame.origin.y + lockButtonselector.frame.size.height+10, kScreen_Width-40, 45);
        startButtonselector.backgroundColor = CLEARCOLOR;
        [startButtonselector setTitle:@"开始时间" forState:UIControlStateNormal];
        [startButtonselector setTitleColor:GRAYCOLOR forState:UIControlStateNormal];
        startButtonselector.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        startButtonselector.tag = 2;
        [startButtonselector addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollview addSubview:startButtonselector];
        
        UIImageView * imageHeng2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, startButtonselector.frame.size.height+startButtonselector.frame.origin.y , kScreen_Width -40, 1)];
        [imageHeng2 setBackgroundColor:UIColorFromRGB(0x0095ca)];
        [scrollview addSubview:imageHeng2];
        
        UIButton * endButtonselector = [UIButton buttonWithType:UIButtonTypeCustom];
        endButtonselector.frame = CGRectMake(20,  startButtonselector.frame.origin.y + startButtonselector.frame.size.height+10, kScreen_Width-40, 45);
        endButtonselector.backgroundColor = CLEARCOLOR;
        [endButtonselector setTitle:@"结束时间" forState:UIControlStateNormal];
        [endButtonselector setTitleColor:GRAYCOLOR forState:UIControlStateNormal];
        endButtonselector.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        endButtonselector.tag =3;
        [endButtonselector addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollview addSubview:endButtonselector];
        
        UIImageView * imageHeng3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, endButtonselector.frame.size.height+endButtonselector.frame.origin.y , kScreen_Width -40, 1)];
        [imageHeng3 setBackgroundColor:UIColorFromRGB(0x0095ca)];
        [scrollview addSubview:imageHeng3];
        
//        scrollview.contentSize = CGSizeMake(kScreen_Width, kScreen_Height-64+1);
        
        UIButton * selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        selectButton.frame = CGRectMake(20,  imageHeng3.frame.origin.y + imageHeng3.frame.size.height+30, kScreen_Width-40, 50);
        selectButton.backgroundColor = UIColorFromRGB(0x0095ca);
        [selectButton setTitle:@"查询" forState:UIControlStateNormal];
        [selectButton setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        selectButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        selectButton.tag = 4;
        [selectButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        selectButton.layer.cornerRadius = 5;
        [scrollview addSubview:selectButton];
        
        
        self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreen_Height, kScreen_Width, 300)];
        self.pickView.delegate = self;
        self.pickView.dataSource = self;
        self.pickView.showsSelectionIndicator = YES;
        [self.scrollview addSubview:self.pickView];

        self.serviceModel = [[MLServiceModel alloc] init];
        self.serviceModel.dataArray = [@[@"第一个锁",@"第二个锁"]mutableCopy];
        
        
        
        self.datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, kScreen_Height,kScreen_Width, 300)];
        self.datePicker.datePickerMode=UIDatePickerModeDate;
        self.datePicker.date=[NSDate date];
        [self.scrollview addSubview: self.datePicker];
        
        [self.datePicker addTarget:self action:@selector(selectDate:) forControlEvents:      UIControlEventValueChanged];
    }
    return self;
}


-(void)onClick:(id)sender
{
    UIButton * btn = (UIButton*)sender;
    self.serviceModel.temp_tag = btn.tag;

    if(btn.tag ==1)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.4 animations:^{
                CGRect yy = self.pickView.frame;
                yy.origin.y = kScreen_Height - 300;
                self.pickView.frame = yy;

            }];
            
        });

    }
    else if(btn.tag ==2 || btn.tag ==3)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.4 animations:^{
                
                CGRect yy = self.datePicker.frame;
                yy.origin.y = kScreen_Height - 300;
                self.datePicker.frame = yy;

            }];
            
        });
    }
    else
    {
        MLOpenLockRecodeList * list = [[MLOpenLockRecodeList alloc] init];
        [_delegate pushViewController:list animated:YES];
    }
}

-(void)selectDate:(id)sender
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.4 animations:^{
            CGRect yy = self.datePicker.frame;
            yy.origin.y = kScreen_Height ;
            self.datePicker.frame = yy;
        }];
        
    });
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *str=[outputFormatter stringFromDate:self.datePicker.date];
    
    [(UIButton*)[self.scrollview viewWithTag:self.serviceModel.temp_tag] setTitle:[self.serviceModel.temp_tag==2?@"开始时间":@"结束时间" stringByAppendingString:[@"  " stringByAppendingString:str]] forState:UIControlStateNormal];
    
}

-(void)done
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.4 animations:^{
            
            CGRect yy = self.pickView.frame;
            yy.origin.y = kScreen_Height;
            self.pickView.frame = yy;

        }];
        
    });
    [(UIButton*)[self.scrollview viewWithTag:self.serviceModel.temp_tag] setTitle:[@"爱锁  " stringByAppendingString:self.serviceModel.lockName] forState:UIControlStateNormal];

}
#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [self.serviceModel.dataArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%@",[self.serviceModel.dataArray objectAtIndex:row]);
    self.serviceModel.lockName = [self.serviceModel.dataArray objectAtIndex:row];

    [self done];

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [self.serviceModel.dataArray objectAtIndex:row];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
