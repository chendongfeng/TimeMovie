//
//  Movie.m
//  TimeMovie
//
//  Created by cdf on 15/8/21.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithContentsOfDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    if (self) {
        
        NSDictionary *subject = dictionary[@"subject"];
        
        _titleC = subject[@"title"];
        _titleE = subject[@"original_title"];
        
        //评分
        NSDictionary *ratingDic = subject[@"rating"];
        NSNumber *number = ratingDic[@"average"];
        _rating = [number floatValue];
        
        _year = subject[@"year"];
        
        _images = subject[@"images"];
        
    }
    
    return self;
}


+ (id)movieWithContentsOfDictionary:(NSDictionary *)dictionary{
    
    return [[Movie alloc] initWithContentsOfDictionary:dictionary];
}

@end
