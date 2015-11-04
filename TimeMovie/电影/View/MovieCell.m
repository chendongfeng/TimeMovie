//
//  MovieCell.m
//  TimeMovie
//
//  Created by cdf on 15/8/21.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "MovieCell.h"
#import "Movie.h"
#import "starView.h"
@interface MovieCell()
@property (strong, nonatomic) IBOutlet starView *starView;
@property (strong, nonatomic) IBOutlet UIImageView *movieImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *yearLabel;

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;



@end

@implementation MovieCell

//覆写setMovie
-(void)setMovie:(Movie *)movie{
    _movie = movie;
    //将model中的数据显示到label imageView
    _titleLabel.text = _movie.titleC;
    _yearLabel.text = [NSString stringWithFormat:@"上映年份:%@",_movie.year];
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_movie.rating];
    
    // 从网络读取图片
    // 创建url
    NSString *urlString = _movie.images[MovieImageKeyLarge];
    NSURL *url = [NSURL URLWithString:urlString];
    [_movieImageView sd_setImageWithURL:url];
    
    _starView.rating = _movie.rating;
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
