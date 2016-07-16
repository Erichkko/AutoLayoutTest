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
 这个方法的返回值是一个数组（数组中的存放的rect范围内所有子元素的布局属性）
 这个方法的返回值决定了rect范围内所有元素 的排布（frame）
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
//    NSLog(@"array == %@",array);
    
    for (UICollectionViewLayoutAttributes *attr in array) {
        CGFloat scale = arc4random_uniform(20)/10.0;
            attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}
@end
