//
//  MLPasswordView.h
//  myLock
//
//  Created by laoniu on 16/3/26.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^isSavePassword)(void);
typedef void (^backKeyBoard)(void);
typedef void (^inputString)(NSInteger index);

@interface MLPasswordView : UIView

@property (nonatomic,strong) isSavePassword temp_SavePassword;
@property (nonatomic,strong) backKeyBoard temp_backKeyBoard;
@property (nonatomic,strong) inputString temp_inputString;

-(id)initWithFrame:(CGRect)frame savePassword:(isSavePassword)savePassword back:(backKeyBoard)back input:(inputString)input;

-(void)updatePasswordUI:(NSMutableArray*)dataArray;

@end
