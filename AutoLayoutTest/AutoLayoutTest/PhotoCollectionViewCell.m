//
//  PhotoCollectionViewCell.m
//  AutoLayoutTest
//
//  Created by wanglong on 16/7/17.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionViewCell ()
/** photoImageView */
@property(nonatomic,weak)UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@end
@implementation PhotoCollectionViewCell


//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
////        [self setup];
//    }
//    return self;
//}


//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.photoImageView.frame = self.bounds;
//}

- (void)awakeFromNib
{
    self.pictureImageView.layer.borderWidth = 0;
    self.pictureImageView.layer.borderColor = [[UIColor redColor] CGColor];
}
- (void)setup
{
    UIImageView *photoImageView = [[UIImageView alloc] init];
    photoImageView.backgroundColor = [UIColor yellowColor];
    self.photoImageView = photoImageView;
    [self.contentView addSubview:photoImageView];
}

- (void)setImgaeName:(NSString *)imgaeName
{
    _imgaeName = imgaeName;
    self.pictureImageView.image = [UIImage imageNamed:imgaeName];
}


@end
