//
//  Movie.h
//  TimeMovie
//
//  Created by cdf on 15/8/21.
//  Copyright (c) 2015年 cdf. All rights reserved.
//
#define MovieImageKeySmall @"small"
#define MovieImageKeyLarge @"large"
#define MovieImageKeyMedium @"medium"

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@interface Movie : NSObject


@property(nonatomic, copy) NSString *titleC;    // 电影名
@property(nonatomic, copy) NSString *titleE;    // 英文名
@property(nonatomic, assign) CGFloat rating;    // 评分
@property(nonatomic, copy) NSString *year;      // 上映时间
@property(nonatomic, strong) NSDictionary *images;  // 图片


- (id)initWithContentsOfDictionary:(NSDictionary *)dictionary;

+ (id)movieWithContentsOfDictionary:(NSDictionary *)dictionary;

@end
