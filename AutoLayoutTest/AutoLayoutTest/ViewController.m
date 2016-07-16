//
//  ViewController.m
//  AutoLayoutTest
//
//  Created by wanglong on 16/7/16.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "ViewController.h"
#import "LinerFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化layout
    LinerFlowLayout *layout = [[LinerFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(160, 160);
//    layout.minimumLineSpacing = 10;
//    layout.minimumInteritemSpacing = 10;
    
    
    //初始化collectionView
    CGFloat collectionViewW = self.view.frame.size.width;
    CGFloat collectionViewH = 200;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, collectionViewW, collectionViewH) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor redColor];
    collectionView.dataSource = self;
//    collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);

    //添加collecView到控制器上
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
#pragma mark - UICollectionViewDataSource 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    
//    NSLog(@"%p,%zd",cell,indexPath.row);
    
    NSInteger tag = 10;
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:tag];
    
    if (label == nil) {
        label = [[UILabel alloc] init];
        label.tag = tag;
        [cell.contentView addSubview:label];
        label.backgroundColor = [UIColor purpleColor];
    }
    label.text = [NSString stringWithFormat:@"no %zd item",indexPath.item];
    [label sizeToFit];
    return cell;
}
@end
