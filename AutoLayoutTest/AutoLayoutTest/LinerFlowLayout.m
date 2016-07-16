//
//  LinerFlowLayout.m
//  AutoLayoutTest
//
//  Created by wanglong on 16/7/16.
//  Copyright © 2016年 wanglong. All rights reserved.
//


// 1.cell的放大和缩小功能
// 2.cell居中显示

#import "LinerFlowLayout.h"

@implementation LinerFlowLayout

- (instancetype)init
{
    if (self = [super init]) {
        /*
        UICollectionViewLayoutAttributes *attrs;
        1.一个Cell对应一个UICollectionViewLayoutAttributes对象
        2.UICollectionViewLayoutAttributes对象决定了cell的frame
        */
    }
    return self;
}

/**
 一旦collectionView的frame 发生变化时 是否需要重新刷新布局
 一旦重新刷新布局 就会调用layoutAttributesForElementsInRect这个方法
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
/**
 这个方法的返回值是一个数组（数组中的存放的rect范围内所有子元素的布局属性）
 这个方法的返回值决定了rect范围内所有元素 的排布（frame）
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat collecViewOffSetX = self.collectionView.contentOffset.x;
    CGFloat collecViewW = self.collectionView.bounds.size.width;
    CGFloat collecViewCenterX = collecViewOffSetX + collecViewW * 0.5;
    for (UICollectionViewLayoutAttributes *attr in array) {
//        NSLog(@" collecViewOffSetX == %f",collecViewOffSetX);
//        NSLog(@" collecViewW*0.5 == %f",collecViewW * 0.5);
//        NSLog(@" collecViewCenterX == %f",collecViewCenterX);
//        NSLog(@" attr.center.x == %f",attr.center.x);
     
        CGFloat delX = ABS(attr.center.x - collecViewCenterX);
        NSLog(@"%zd,%f",attr.indexPath.row,delX);
            CGFloat scale = 1.0 - delX/self.collectionView.bounds.size.width * 0.5 ;
             attr.transform = CGAffineTransformMakeScale(scale, scale);
//
//
    }
    return array;
}

//这个方法的返回值决定了colleView停止滚动的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
 
    CGRect rect;
    rect.origin.x  = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size = self.collectionView.frame.size;
    
    CGFloat colletionViewCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5;
    CGFloat minDelX  = MAXFLOAT;
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
      for (UICollectionViewLayoutAttributes *attr in attrs) {
          
          if (ABS(minDelX) > ABS(attr.center.x - colletionViewCenterX)) {
              minDelX = attr.center.x - colletionViewCenterX;
          }
      }
    proposedContentOffset.x += minDelX;
    
    return proposedContentOffset;
}

- (void)prepareLayout
{
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat insetMargin = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, insetMargin, 0, insetMargin);
}
@end
