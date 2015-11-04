//
//  TopCell.m
//  TimeMovie
//
//  Created by cdf on 15/8/26.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "TopCell.h"



@implementation TopCell

#pragma mark - 覆写movie方法
-(void)setMovie:(Movie *)movie{
    _movie = movie;
    [_movieImageView sd_setImageWithURL:[NSURL URLWithString:_movie.images[MovieImageKeyMedium]]];
    _titleLabel.text = _movie.titleC;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_movie.rating];
    _starView.rating = _movie.rating;
    
}


@end
