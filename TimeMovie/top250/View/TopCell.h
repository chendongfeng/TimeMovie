//
//  TopCell.h
//  TimeMovie
//
//  Created by cdf on 15/8/26.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "starView.h"


@interface TopCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

@property (weak, nonatomic) IBOutlet starView *starView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (nonatomic,strong)Movie *movie;

@end
