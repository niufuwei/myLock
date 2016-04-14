//
//  MLRecodeListCell.h
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLRecodeListCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel * name;
@property (nonatomic,strong) IBOutlet UILabel * phone;
@property (nonatomic,strong) IBOutlet UILabel * timeEvent;
@property (nonatomic,strong) IBOutlet UILabel * lockName;
@property (nonatomic,strong) IBOutlet UIImageView * icon;


@end
