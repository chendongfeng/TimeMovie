//
//  CommentCell.m
//  TimeMovie
//
//  Created by cdf on 15/8/29.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib {
    _bgView.layer.cornerRadius = 3;
    _bgView.layer.borderColor = [UIColor redColor].CGColor;
    _bgView.layer.borderWidth = 2;
    _bgView.layer.masksToBounds = YES;
}

- (void)setComment:(Comment *)comment
{
    _comment = comment;
    _commentLabel.text = _comment.content;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
