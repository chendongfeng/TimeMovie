//
//  starView.m
//  TimeMovie
//
//  Created by cdf on 15/8/22.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "starView.h"
#import "UIViewExt.h"

@interface starView(){
    
    UIView *_yellowStar;
    UIView *_grayStar;
    
}

@end


@implementation starView

//重写init
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createStarViews];
    }
    return self;
}

//从xib或故事版中创建视图时调用的方法
-(void)awakeFromNib
{
    [self createStarViews];
}


//创建星星
-(void)createStarViews{
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    
    _grayStar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 17.5 * 5, 17)];
    _grayStar.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    
    // 放大灰色星星视图
    CGAffineTransform transform = CGAffineTransformMakeScale(self.frame.size.width / 17.5 / 5, self.frame.size.height / 17);
    _grayStar.transform = transform;
    [self addSubview:_grayStar];
    
    _yellowStar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 17.5 * 5, 17)];
    _yellowStar.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    
    // 放大黄色星星视图
    
    _yellowStar.transform = transform;
    [self addSubview:_yellowStar];
    
    
    // 放大变换之后，视图的位置会发生变化 所以需要重新设置视图的中心点
    CGPoint selfCenterPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    _yellowStar.center = selfCenterPoint;
    _grayStar.center = selfCenterPoint;
    
}
// 重写 评分的SET方法 在设置评分时改变黄色五角星的数量
- (void)setRating:(CGFloat)rating
{
    if (rating >= 0 && rating <= 10)
    {
        _yellowStar.width = _grayStar.width * rating / 10;
    }
}



@end
