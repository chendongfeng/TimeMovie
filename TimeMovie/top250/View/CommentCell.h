//
//  CommentCell.h
//  TimeMovie
//
//  Created by cdf on 15/8/29.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *i;
@property (weak, nonatomic) IBOutlet UIView *bgView;


@property (nonatomic, strong) Comment *comment;
@end
