//
//  imageChoseView.m
//  图片选择器
//
//  Created by 郭志远 on 15/10/13.
//  Copyright © 2015年 guozhiyuan. All rights reserved.
//

#import "imageChoseView.h"
//#import "AssetHelper.h"
#import "imageChoseCell.h"
#import "MLSelectPhotoAssets.h"

@interface imageChoseView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic ,assign)NSInteger count;

@end

@implementation imageChoseView

-(NSMutableArray *)photoAssets{
    if (_photoAssets == nil) {
        
        _photoAssets = [NSMutableArray array];
        
    }
    return _photoAssets;
}



-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self= [super initWithFrame:frame collectionViewLayout:layout]) {
        
        [self registerClass:[imageChoseCell class] forCellWithReuseIdentifier:identify];
        self.dataSource = self;
        self.delegate = self;
//             [ASSETHELPER getGroupList:^(NSArray *arr) {
//            
//            
//        }];
        
    }

    return self;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    
    
//  return [ASSETHELPER getPhotoCountOfCurrentGroup];
    return  self.photoAssets.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
  imageChoseCell*cell = (imageChoseCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
      {
       
        cell.ivPhoto.image = [(MLSelectPhotoAssets *)self.photoAssets[indexPath.item] thumbImage];
        
        cell.ivPhoto.deleteBtn.hidden =NO;

    }
    
    return cell;

}




//
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    imageChoseCell *cell = (imageChoseCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    
//    if (cell.isAlpha) {
//        
//        cell.alpha = 1.0;
//        cell.isAlpha = NO;
//        self.count--;
//    
//    }
//    else{
//    
//        cell.alpha = 0.2;
//        cell.isAlpha =YES;
//        self.count++;
//    }
//    
//    
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"increaseCount" object:@(self.count)];
//    
//    
//    
//    
//   
//}
//


-(void)layoutSubviews{

[UIView animateWithDuration:0.8 animations:^{
    
    [super layoutSubviews];
}];

}
@end
