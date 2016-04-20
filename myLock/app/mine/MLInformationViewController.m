//
//  MLInformationViewController.m
//  myLock
//
//  Created by laoniu on 16/3/27.
//  Copyright © 2016年 laoniu. All rights reserved.
//

#import "MLInformationViewController.h"
#import "MLInformationView.h"
#import "AppDelegate.h"
#import "TSLocateView.h"
#import "AlertView.h"


@interface MLInformationViewController ()<inforDelegate,UIActionSheetDelegate,alertDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UIPickerViewDelegate>

@property (nonatomic,strong) MLInformationView * infor;
@property (nonatomic,strong) AlertView * alertView;
@property (nonatomic,strong) UIImage * selfPhoto;

@end

@implementation MLInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"编辑信息";
    
    self.infor = [[MLInformationView alloc] initWithFrame:self.view.frame myself:self];
    [self.view addSubview:self.infor];
    // Do any additional setup after loading the view.
}

-(void)eventClick:(NSInteger)index
{
    if(index ==0)
    {
        [self onImageSelect];
    }
    if(index==3)
    {
        TSLocateView *locateView = [[TSLocateView alloc] initWithTitle:@"定位城市" delegate:self];
        [locateView showInView:self.view];
    }
    if(index ==1)
    {
        AlertView * alert = [[AlertView alloc] initWithPlaceHoder:@"请输入新的昵称" title:@"昵称" view:self.view width:300 tag:1 textLabel:@""];
        alert.delegate = self;
        [alert show];
    }
    if(index == 5)
    {
        AlertView * alert = [[AlertView alloc] initWithPlaceHoder:@"请输入签名信息" title:@"签名" view:self.view width:300 tag:5 textLabel:@""];
        alert.delegate = self;
        [alert show];
    }
}

-(void)confirmButtonClick:(NSInteger)tag selectStr:(NSString *)selectStr
{
    [self.infor updateUI:tag string:selectStr];

}

-(void)cancleButtonClick
{
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.tag ==101)
    {
        switch (buttonIndex) {
            case 0:
                //从相册选择
                [self LocalPhoto];
                break;
            case 1:
                //拍照
                [self takePhoto];
                break;
            default:
                break;
        }

    }
    else
    {
        TSLocateView *locateView = (TSLocateView *)actionSheet;
        TSLocation *location = locateView.locate;
        NSLog(@"c---->%@,ity:%@ lat:%@ lon:%f",location, location.city, location.state, location.longitude);
        //You can uses location to your application.
        if(buttonIndex == 0) {
            NSLog(@"Cancel");
        }else {
            NSLog(@"Select");
        }
        [self.infor updateUI:3 string:[[location.state stringByAppendingString:@" "] stringByAppendingString:location.city]];

    }
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [ApplicationDelegate hideTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)onImageSelect
{
    
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                    initWithTitle:nil
                                    delegate:self
                                    cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:nil
                                    otherButtonTitles: @"从相册选择", @"拍照",nil];
    myActionSheet.tag = 101;
    [myActionSheet showInView:self.view];
    
}

//从相册选择
-(void)LocalPhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //资源类型为图片库
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

//拍照
-(void)takePhoto{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        //资源类型为照相机
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else {
        NSLog(@"该设备无摄像头");
    }
}

#pragma Delegate method UIImagePickerControllerDelegate
//图像选取器的委托方法，选完图片后回调该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:^{
        
        
        BOOL success;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error;
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *imageFilePath = [documentsDirectory stringByAppendingPathComponent:@"selfPhoto.jpg"];
        [[NSUserDefaults standardUserDefaults] setObject:imageFilePath forKey:@"imageFilePath"];
        
        success = [fileManager fileExistsAtPath:imageFilePath];
        if(success) {
            success = [fileManager removeItemAtPath:imageFilePath error:&error];
        }
        
//        photoUrl = imageFilePath;
        
        UIImage *smallImage=[self scaleFromImage:image toSize:CGSizeMake(80.0f, 80.0f)];//将图片尺寸改为80*80
        [UIImageJPEGRepresentation(smallImage, 1.0f) writeToFile:imageFilePath atomically:YES];//写入文件
        self.selfPhoto = [UIImage imageWithContentsOfFile:imageFilePath];//读取图片文件
        
#pragma mark --
#pragma mark -- 在这里显示照片
        
        [self.infor updateUI:self.selfPhoto];
        
        
//        ASIFormDataRequest *requestPhoto = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kXMiOSTestURLHost,uploadImga]]];
//        NSLog(@"%@%@",kXMiOSTestURLHost,uploadImga);
//        
//        //            [requestPhoto setPostValue:nameField.text forKey:@"name"];
//        //            [requestPhoto setPostValue:phoneField.text forKey:@"phone"];
//        //            [requestPhoto setPostValue:titleField.text forKey:@"title"];
//        [requestPhoto setPostValue:[XMBankMethods currentUserToken] forKey:@"token"];
//        
//        [requestPhoto setFile:photoUrl forKey:@"myFile"];
//        [requestPhoto setPostValue:@"y" forKey:@"isHead"];
//        //头像传Y 相册随便传
//        
//        [requestPhoto buildPostBody];
//        
//        [requestPhoto setDelegate:self];
//        
//        [requestPhoto setTimeOutSeconds:20];
//        
//        [requestPhoto startAsynchronous];
        
        //在这里显示照片
        
        //        NSData *imageData = UIImageJPEGRepresentation(selfPhoto,0.8);
        //        FileDetail *file = [FileDetail fileWithName:@"selfPhoto.jpg" data:imageData];
        //        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:nameField.text,@"name",phoneField.text,@"phone",titleField.text,@"title",contentText.text,@"content",
        //                                file,@"img",nil];
        //
        //        NSLog(@"%@",params);
        //        NSDictionary *result = [HttpRequestFile upload:@"http://123.57.17.124/epaper/index.php?r=bl/create" widthParams:params];
        //        NSLog(@"%@",result);
        
    }];
    
}

//- (void)requestFailed:(ASIHTTPRequest *)request
//{
//    NSError *error = [request error];
//    NSLog(@"%@",error);
//    [BFMethods alertMessage:@"上传失败"];
//}
//
//- (void)requestFinished:(ASIHTTPRequest *)request
//{
//    
//    NSString *responseString = [request responseString];
//    
//    NSLog(@"%@",[[[responseString objectFromJSONString] objectForKey:@"data"] objectForKey:@"url"]);
//    //    [BFMethods alertMessage:@"上传成功"];
//    [self loadImageRequest:[[[responseString objectFromJSONString] objectForKey:@"data"] objectForKey:@"url"]];
//    
//}

// 改变图像的尺寸，方便上传服务器
- (UIImage *) scaleFromImage: (UIImage *) image toSize: (CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
