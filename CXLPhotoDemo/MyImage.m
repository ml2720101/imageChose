//
//  MyImage.m
//  weibo  界面
//
//  Created by 郭志远 on 15/8/27.
//  Copyright (c) 2015年 guozhiyuan. All rights reserved.
//

#import "MyImage.h"
#import "UIView+FrameExtension.h"
#import "imageChoseCell.h"
#import "imageChoseView.h"





@interface MyImage ()

@property (nonatomic ,weak)UIButton *btn;

@end

@implementation MyImage

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        UIButton *btn=[[UIButton alloc]init];
        [btn setImage:[UIImage imageNamed:@"X"] forState:UIControlStateNormal];
        [btn sizeToFit];
        self.btn=btn;
        self.deleteBtn =btn;
        [btn addTarget:self action:@selector(deleteMyself:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        self.userInteractionEnabled=YES;

        
    }
    return self;

}



-(void)deleteMyself:(UIButton*)btn{

//    MyImage *image=(MyImage *)btn.superview;
//   image.image = nil;
//    btn.hidden =YES;
    
    imageChoseCell *cell = (imageChoseCell *)btn.superview.superview.superview ;
    
    imageChoseView *imageChose = (imageChoseView *)cell.superview;
    
    NSInteger index = [imageChose indexPathForCell:cell].item;
    
    [btn.superview.superview.superview removeFromSuperview];

    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeImge" object:@(index)];
    
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
      self.btn.x=self.width-self.btn.width;
      self.btn.y=0;
    
    




}
@end
