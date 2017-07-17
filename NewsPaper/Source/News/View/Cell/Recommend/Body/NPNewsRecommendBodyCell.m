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

@interface NPNewsRecommendBodyCell ()
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *catagoryLabel;
@property (strong, nonatomic) UILabel *timeLabel;

- (void)initConstraints;
@end

@implementation NPNewsRecommendBodyCell

#pragma mark - Init Methods

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initConstraints];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)initConstraints {
    
}

#pragma mark - Override Methods

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

#pragma mark - Setter

- (void)setRecommend:(RecommendBean *)recommend {
    _recommend = recommend;
    self.titleLabel.text = _recommend.title;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld", _recommend.createTime];
    self.catagoryLabel.text = _recommend.catagory;
    self.catagoryLabel.text = @"World";
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_recommend.article.pictures[0].file] placeholderImage:[UIImage imageNamed:@"placeholder_default"]];
}

#pragma mark - Getter

- (UIImageView *)imgView {
    
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        [_imgView setContentMode:UIViewContentModeScaleAspectFill];
        [_imgView.layer setMasksToBounds:YES];
        [self.contentView addSubview:_imgView];
    }
    
    return _imgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [JHThemeManager sharedThemeManager].textPrimary;
        [self.contentView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (UILabel *)catagoryLabel {
    if (!_catagoryLabel) {
        _catagoryLabel = [[UILabel alloc] init];
        _catagoryLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
        _catagoryLabel.textColor = [JHThemeManager sharedThemeManager].textSecondary;
        _catagoryLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_catagoryLabel];
    }
    
    return _catagoryLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
        _timeLabel.textColor = [JHThemeManager sharedThemeManager].textSecondary;
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLabel];
    }
    
    return _timeLabel;
}

@end

@implementation NPNewsRecommendDetailBodyCell

- (void)initConstraints {
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(90).priorityHigh();
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.top.equalTo(self.contentView.mas_top).with.offset(insets.top).priorityHigh();
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
        make.width.equalTo(self.imgView.mas_height).multipliedBy(4./3.);
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
    
}

@end

@implementation NPNewsRecommendMultiPicBodyCell

- (void)initConstraints {
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
        make.height.equalTo(self.imgView.mas_width).multipliedBy(3./4.).priorityHigh();
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(-insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_top);
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left).with.offset(-spacing);
    }];
}

@end

@implementation NPNewsRecommendLargePicBodyCell

- (void)initConstraints {
    UIEdgeInsets insets = UIEdgeInsetsMake(8, 8, 8, 8);
    CGFloat spacing = 8;
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_top);
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
        make.top.equalTo(self.imgView.mas_bottom).with.offset(-insets.bottom);
        make.right.equalTo(self.contentView.mas_right).with.offset(-insets.right);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-insets.bottom);
    }];
    [self.catagoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(insets.left);
        make.right.equalTo(self.timeLabel.mas_left).with.offset(-spacing);
    }];
}

@end
