//
//  ViewController.m
//  CXLPhotoDemo
//
//  Created by cuixinle on 15/10/13.
//  Copyright © 2015年 cuixinle. All rights reserved.
//

#import "ViewController.h"
#import "MLSelectPhotoAssets.h"
#import "MLSelectPhotoPickerAssetsViewController.h"
#import "MLSelectPhotoBrowserViewController.h"
#import "imageChoseView.h"
#import "imageChoseFlow.h"
#import "UIView+FrameExtension.h"
#import "UploadtTool.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (weak,nonatomic) imageChoseView *imageChose;
@property (nonatomic , strong) NSMutableArray *assets;

@property (nonatomic ,weak)UIButton *addBtn;




@end

@implementation ViewController

- (NSMutableArray *)assets{
    if (!_assets) {
        _assets = [NSMutableArray array];
    }
    return _assets;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets =NO;
    
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 70, 50, 50)];
    
    
    [addBtn setImage:[UIImage imageNamed:@"iconfont-tianjia"] forState:UIControlStateNormal];
   
    self.addBtn = addBtn;
    
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    imageChoseFlow *flow = [[imageChoseFlow alloc]init];

    imageChoseView *imageChose = [[imageChoseView alloc]initWithFrame:CGRectMake(KScreenW,CGRectGetMaxY(self.navigationController.navigationBar.frame), KScreenW-CGRectGetMaxX(self.addBtn.frame),60) collectionViewLayout:flow];

    self.imageChose = imageChose;
    
    imageChose.centerY = addBtn.centerY;
    
    imageChose.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:imageChose];
    
    [self.view addSubview:addBtn];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(choseImageWithInfo:) name:PICKER_TAKE_DONE object:nil];
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeImge" object:@(index)];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeImageWithInfo:) name:@"removeImge" object:nil];
}


- (void)addBtnClick{
    
    
    
    if(self.imageChose.photoAssets.count <= 4){
        MLSelectPhotoPickerViewController *pickerVc = [[MLSelectPhotoPickerViewController alloc] init];
    
        pickerVc.status = PickerViewShowStatusCameraRoll;
    
        pickerVc.maxCount = 3;
       [self.assets removeAllObjects];
        [pickerVc showPickerVc:self];
         __weak typeof(self) weakSelf = self;
        pickerVc.callBack = ^(NSArray *assets){
        [weakSelf.assets addObjectsFromArray:assets];

            if (weakSelf.imageChose.photoAssets.count == 0) {
//                
                [weakSelf.imageChose.photoAssets addObjectsFromArray:assets];
                
                for (MLSelectPhotoAssets *assest in assets) {
                    
                    UIImage *originImage = [assest originImage];
                    
                    CGFloat size = sizeof(originImage);
                    
                    
                    NSData *data = UIImageJPEGRepresentation(originImage, 0.6);

//
                
        
                
////                    NSURL *url = [assest assetURL];
//                    
//                    
//
//                    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//                    
//                    
//                    [UploadtTool upDataWithData:data  paras:parameters contentType:@"image/jpeg" success:^(id response) {
//                        NSLog(@"上传成功");
//                    } failure:^(NSError *error) {
//                        
//                        NSLog(@"图片未上传");
//                    }];
//             
//
//                
//                }
//                
//

            }else{
            
                NSMutableArray *newImage = [NSMutableArray array];
                
                BOOL isExist = NO;
                
          
        for ( MLSelectPhotoAssets*assest in weakSelf.assets) {
           
            NSURL *url = [assest assetURL];
            
        
            
            for (MLSelectPhotoAssets *imageAsset in weakSelf.imageChose.photoAssets) {
                
                NSURL *url1 = [imageAsset assetURL];
                if([url.absoluteString isEqualToString:url1.absoluteString ]){
               
                    isExist = YES;
                    
                    break;
                 
               }else{
                
                    isExist = NO;
                }
            
            }

            if (isExist == NO) {
                
                [newImage addObject:assest];
            }

            }

            [weakSelf.imageChose.photoAssets addObjectsFromArray:newImage];
                
//                for (MLSelectPhotoAssets *assest in newImage) {
//                    
//                    UIImage *originImage = [assest originImage];
//                    
//                    NSData *data = UIImageJPEGRepresentation(originImage, 0.6);
//                    
//                    
//                    NSURL *url = [assest assetURL];
//                    
//                    
//                    NSString *contentType = [UploadtTool getFileContentType:url.absoluteString];
//                    
//                    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//                    
//                    
//                    [UploadtTool upDataWithData:data  paras:parameters contentType:contentType success:^(id response) {
//                        NSLog(@"上传成功");
//                    } failure:^(NSError *error) {
//                        
//                        NSLog(@"图片未上传");
//                    }];
//                    NSLog(@"%@",url.absoluteString);
//                    
//                    
//                    
//                }

                
            }
            
           
            
            [weakSelf.imageChose reloadData];
                    
                
        };}else {
        
            UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"图片已经达到上限,是否重选?" preferredStyle: UIAlertControllerStyleAlert];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"重选" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                
            }];
            
//            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"放弃" style:UIAlertActionStyleDefault handler:nil];
        
            UIAlertAction *cancelAciton = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           
            }];
            
        
            [alertVc addAction:action1];
//            [alertVc addAction:action2];
            [alertVc addAction:cancelAciton];
            [self presentViewController:alertVc animated:YES completion:^{
            }];
        }

    

  
}




-(void)removeImageWithInfo:(NSNotification *)info{

    [self.imageChose.photoAssets removeObjectAtIndex:[info.object integerValue]];
    
        [self.imageChose reloadData];

}

-(void)choseImageWithInfo:(NSNotification *)info{

    
//      dispatch_async(dispatch_get_main_queue(), ^{
    
         [UIView animateWithDuration:0.5 animations:^{
             
             
//             [secontentTypelf.imageChose reloadData];
            self.imageChose.x = CGRectGetMaxX(self.addBtn.frame);
             
             NSLog(@"%@",NSStringFromCGRect(self.imageChose.bounds)  );
//             
//             [self.imageChose scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft  animated:YES];
        }];

        
//    });
    
    
    
}



-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self name:PICKER_TAKE_DONE object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"removeImge" object:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
