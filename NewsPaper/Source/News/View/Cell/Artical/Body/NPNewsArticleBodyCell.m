//
//  RecommendBodyCell.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPNewsArticleBodyCell.h"

#import "ArticleBean.h"
#import "PictureBean.h"

@implementation NPNewsArticleBodyCell

#pragma mark - Setter

- (void)setArtical:(ArticleBean *)article {
    _article = article;
    self.titleLabel.text = _article.title;
    self.timeLabel.text = _article.timeStr;
    self.catagoryLabel.text = [NSString stringWithFormat:@"%ld", _article.catagoryId];
    self.catagoryLabel.text = @"World";
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_article.pictures[0].file] placeholderImage:[UIImage imageNamed:@"placeholder_default"]];
}

@end
