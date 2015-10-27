//
//  imageChoseFlow.m
//  图片选择器
//
//  Created by 郭志远 on 15/10/13.
//  Copyright © 2015年 guozhiyuan. All rights reserved.
//

#import "imageChoseFlow.h"

@implementation imageChoseFlow

-(instancetype)init{
    if (self = [super init]) {
        
        self.itemSize = CGSizeMake(50, 50);
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing =10;
        self.sectionInset = UIEdgeInsetsMake(5, 10, 5,10);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    }

    return  self;
}


@end
