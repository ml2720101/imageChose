//
//  imageChoseCell.h
//  图片选择器
//
//  Created by 郭志远 on 15/10/13.
//  Copyright © 2015年 guozhiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImage.h"

@interface imageChoseCell : UICollectionViewCell

@property (nonatomic ,assign)BOOL isAlpha;

@property (nonatomic ,weak)MyImage *ivPhoto;

@end
