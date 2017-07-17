//
//  RecommendBodyCell.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPNewsNormalBodyCell.h"

#import "ArticleBean.h"
#import "PictureBean.h"

@implementation NPNewsNormalBodyCell

#pragma mark - Setter

- (void)setArtical:(ArticleBean *)artical {
    artical = artical;
    self.titleLabel.text = artical.title;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld", artical.updateTime];
    self.catagoryLabel.text = [NSString stringWithFormat:@"%ld", artical.catagoryId];
    self.catagoryLabel.text = @"World";
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:artical.pictures[0].file] placeholderImage:[UIImage imageNamed:@"placeholder_default"]];
}

@end
