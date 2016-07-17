//
//  ViewController.m
//  AutoLayoutTest
//
//  Created by wanglong on 16/7/16.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"
#import "LinerFlowLayout.h"
#import "CircleLayout.h"
#import "PhotoCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** collectionView */
@property(nonatomic,weak) UICollectionView *collectionView;
/** ietms */
@property(nonatomic,strong)NSMutableArray *ietms;
@end

@implementation ViewController
    static NSString * const photoCellID = @"photoCellID";

- (NSMutableArray *)ietms
{
    if (_ietms == nil) {
        _ietms = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            [_ietms addObject:[NSString stringWithFormat:@"%zd",i+1]];
        }
    }
    return _ietms;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化线性layout
    LinerFlowLayout *layout = [[LinerFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(160, 160);
//    layout.minimumLineSpacing = 10;
//    layout.minimumInteritemSpacing = 10;
    
    //初始化collectionView
    CGFloat collectionViewW = self.view.frame.size.width;
    CGFloat collectionViewH = 300;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, collectionViewW, collectionViewH) collectionViewLayout:layout];
//    collectionView.backgroundColor = [UIColor redColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    self.collectionView = collectionView;
//    collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);

    //添加collecView到控制器上
    [self.view addSubview:collectionView];
//    
//    [collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:photoCellID];
     UINib *nib = [UINib nibWithNibName:NSStringFromClass([PhotoCollectionViewCell class]) bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:photoCellID];
    
}
#pragma mark - UICollectionViewDataSource 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.ietms count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    cell.imgaeName = self.ietms[indexPath.item];
    
//    NSLog(@"%p,%zd",cell,indexPath.row);
    
//    NSInteger tag = 10;
//    UILabel *label = (UILabel *)[cell.contentView viewWithTag:tag];
//    
//    if (label == nil) {
//        label = [[UILabel alloc] init];
//        label.tag = tag;
//        [cell.contentView addSubview:label];
//        label.backgroundColor = [UIColor purpleColor];
//    }
//    label.text = [NSString stringWithFormat:@"no %zd item",indexPath.item];
//    [label sizeToFit];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click == %zd",indexPath.item);
    [self.ietms removeObjectAtIndex:indexPath.item];
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UICollectionViewLayout *layout;
    if ([self.collectionView.collectionViewLayout isKindOfClass:[CircleLayout class]]) {
        layout = [[LinerFlowLayout alloc] init];
        ((LinerFlowLayout *)layout).itemSize = CGSizeMake(160, 160);
    }else{
        //初始化环形layout
       layout = [[CircleLayout alloc] init];
    }
    [self.collectionView setCollectionViewLayout:layout];
    
}
@end
