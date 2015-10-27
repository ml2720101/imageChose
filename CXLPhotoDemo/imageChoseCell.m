//
//  imageChoseCell.m
//  图片选择器
//
//  Created by 郭志远 on 15/10/13.
//  Copyright © 2015年 guozhiyuan. All rights reserved.
//

#import "imageChoseCell.h"
#import "MyImage.h"

@implementation imageChoseCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        MyImage *image = [[MyImage alloc]initWithFrame:self.contentView.bounds];
        
        self.ivPhoto = image;
        self.backgroundColor = [UIColor orangeColor];
        
        [self.contentView addSubview:image];
        // Initialization code
        
        
          
    }
    return self;
}



@end
