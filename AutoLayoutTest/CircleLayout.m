//
//  CircleLayout.m
//  AutoLayoutTest
//
//  Created by wanglong on 16/7/17.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "CircleLayout.h"

@interface CircleLayout()
/** array */
@property(nonatomic,strong)NSMutableArray *array;

@end
@implementation CircleLayout

- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array ;
}
- (void)prepareLayout
{
    [super prepareLayout];
    
    [self.array removeAllObjects];
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.array addObject:attr];
    }
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat radius = 100;
    CGFloat pWH = 50;
    CGFloat angle = 0;
    CGFloat oX = self.collectionView.bounds.size.width * 0.5;
    CGFloat oY = self.collectionView.bounds.size.height * 0.5;
    CGFloat poX = 0;
    CGFloat poY = 0;
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    if (itemCount == 1) {
         attr.center = CGPointMake(oX, oY);
        attr.size = CGSizeMake(2 * pWH,2 * pWH);
    }else{
        angle = (M_PI * 2 /itemCount) * indexPath.item;
        poX = oX + sinf(angle)*radius;
        poY = oY + cosf(angle)*radius;
        attr.center = CGPointMake(poX, poY);
        attr.size = CGSizeMake(pWH, pWH);
    }
    
    return attr;
}
@end
