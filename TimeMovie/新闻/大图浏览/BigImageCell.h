//
//  BigImageCell.h
//  TimeMovie
//
//  Created by cdf on 15/8/25.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImageCell : UICollectionViewCell

@property (nonatomic,strong)NSURL *imageURL;

- (void)backImageZoomingScale;

@end
