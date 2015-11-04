//
//  Comment.h
//  TimeMovie
//
//  Created by cdf on 15/8/29.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "BaseModel.h"

@interface Comment : BaseModel

@property (nonatomic, copy) NSString *userImage;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *content;


@property (nonatomic, assign) BOOL isShow;

@end
