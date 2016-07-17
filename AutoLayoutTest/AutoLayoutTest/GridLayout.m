//
//  GridLayout.m
//  AutoLayoutTest
//
//  Created by wanglong on 16/7/17.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "GridLayout.h"

@implementation GridLayout
//决定每一个cell的Frame
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    //创建UICollectionViewLayoutAttributes
    NSInteger item = [self.collectionView numberOfItemsInSection:0];
    
    NSInteger rowCount = 2;
    CGFloat cellW = self.collectionView.frame.size.width * 0.5;
    CGFloat cellH =  cellW;
    CGFloat cellX = 0;
    CGFloat cellY = 0;
    for (int i = 0; i < item; i++) {
        cellX = (i % rowCount)*cellW;
        cellY = (i / rowCount)*cellH;
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath] ;
        attr.frame = CGRectMake(cellX, cellY, cellW, cellH);
        [array addObject:attr];
    }
    
   
    return array;
}

- (CGSize) collectionViewContentSize
{
    NSArray *array = [self layoutAttributesForElementsInRect:CGRectZero];
    UICollectionViewLayoutAttributes *attr = (UICollectionViewLayoutAttributes *)[array lastObject];
    NSLog(@"%f",CGRectGetMaxY(attr.frame));
    return CGSizeMake(0, CGRectGetMaxY(attr.frame));
}
@end
