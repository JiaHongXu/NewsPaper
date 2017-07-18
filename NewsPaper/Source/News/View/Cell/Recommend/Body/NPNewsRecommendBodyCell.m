//
//  RecommendBodyCell.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPNewsRecommendBodyCell.h"

#import "RecommendBean.h"
#import "ArticleBean.h"
#import "PictureBean.h"

@implementation NPNewsRecommendBodyCell

#pragma mark - Setter

- (void)setRecommend:(RecommendBean *)recommend {
    _recommend = recommend;
    self.titleLabel.text = _recommend.title;
    self.timeLabel.text = _recommend.timeStr;
    self.catagoryLabel.text = _recommend.catagory;
    self.catagoryLabel.text = @"World";
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_recommend.article.pictures[0].file] placeholderImage:[UIImage imageNamed:@"placeholder_default"]];
}

@end

@implementation NPNewsRecommendDetailBodyCell

- (void)initConstraints {
    [super initConstraints];
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.height.equalTo(self.imgView.mas_width).multipliedBy(3./4.);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_top);
        make.left.equalTo(self.imgView.mas_right).with.offset(spacing);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.imgView.mas_bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imgView.mas_bottom);
        make.left.equalTo(self.imgView.mas_right).with.offset(spacing);
        make.right.equalTo(self.timeLabel.mas_left).with.offset(-spacing);
    }];
}

@end

@implementation NPNewsRecommendDetailNoPicBodyCell

- (void)initConstraints {
    [super initConstraints];
}

@end

@implementation NPNewsRecommendMultiPicBodyCell

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
        make.height.equalTo(self.imgView.mas_width).multipliedBy(3./4.);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left).with.offset(-spacing);
        make.bottom.equalTo(self.timeLabel);
    }];
}

@end

@implementation NPNewsRecommendLargePicBodyCell

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
        make.height.equalTo(self.imgView.mas_width).multipliedBy(3./4.);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left).with.offset(-spacing);
        make.bottom.equalTo(self.timeLabel);
    }];
}

@end
