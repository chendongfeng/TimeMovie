//
//  News.h
//  TimeMovie
//
//  Created by cdf on 15/8/22.
//  Copyright (c) 2015年 cdf. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface News : BaseModel

@property(nonatomic,strong)NSNumber *newsID;
@property(nonatomic,strong)NSNumber *type; //新闻类型

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary; //新闻简介
@property(nonatomic,copy)NSString *image;

@end
