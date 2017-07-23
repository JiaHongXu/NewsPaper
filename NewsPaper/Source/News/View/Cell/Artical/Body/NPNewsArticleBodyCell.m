//
//  ArticleBodyCell.m
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

- (void)setArticle:(ArticleBean *)article {
    _article = article;
    self.titleLabel.text = _article.title;
    self.timeLabel.text = _article.timeStr;
    if (_article.pictures.count!=0) {
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:_article.pictures[0].file] placeholderImage:[UIImage imageNamed:@"placeholder_default"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (cacheType == SDImageCacheTypeNone) {
                self.imgView.alpha = 0;
                [UIView animateWithDuration:0.3 animations:^{
                    self.imgView.alpha = 1;
                }];
            }
        }];
    }
}

@end

@implementation NPNewsArticleDetailBodyCell

- (void)initConstraints {
    [super initConstraints];
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.height.equalTo(self.imgView.mas_width).multipliedBy(3./4.);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_top);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.imgView.mas_left).with.offset(-spacing);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.imgView.mas_left).with.offset(-spacing);
        make.bottom.equalTo(self.imgView.mas_bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.bottom.equalTo(self.imgView.mas_bottom);
        make.right.equalTo(self.timeLabel.mas_left);
    }];
}

@end

@implementation NPNewsArticleDetailNoPicBodyCell

- (void)initConstraints {
    [super initConstraints];
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(spacing);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.timeLabel.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left);
    }];
}

@end

@implementation NPNewsArticleMultiPicBodyCell

- (void)initConstraints {
    [super initConstraints];
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(spacing);
        make.height.equalTo(self.imgView.mas_width).multipliedBy(10./16.);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left);
        make.bottom.equalTo(self.timeLabel);
    }];
}

@end

@implementation NPNewsArticleLargePicBodyCell

- (void)initConstraints {
    [super initConstraints];
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(spacing);
        make.height.equalTo(self.imgView.mas_width).multipliedBy(10./16.);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left);
        make.bottom.equalTo(self.timeLabel);
    }];
}

@end

@implementation NPNewsArticleDetailAudio

- (void)initConstraints {
    [super initConstraints];
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(spacing);
        make.height.equalTo(self.imgView.mas_width).multipliedBy(10./16.);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left);
        make.bottom.equalTo(self.timeLabel);
    }];
}

@end

@implementation NPNewsArticleDetailVideo

- (void)initConstraints {
    [super initConstraints];
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(spacing);
        make.height.equalTo(self.imgView.mas_width).multipliedBy(10./16.);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left);
        make.bottom.equalTo(self.timeLabel);
    }];
}

@end
