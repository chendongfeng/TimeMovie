//
//  BigImageViewController.h
//  TimeMovie
//
//  Created by cdf on 15/8/26.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "BaseViewController.h"

@interface BigImageViewController : BaseViewController

@property (nonatomic, strong) NSArray *imageData;   // 接受imageList中传递过来的数据
@property (nonatomic, strong) NSIndexPath *indexPath;   // 纪录前一个页面点中的单元格


@end
