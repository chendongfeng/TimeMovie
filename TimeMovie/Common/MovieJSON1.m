//
//  MovieJSON1.m
//  TimeMovie
//
//  Created by cdf on 15/8/26.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "MovieJSON1.h"

@implementation MovieJSON1

+(id)readJSONFile:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return json;
    
}

@end
