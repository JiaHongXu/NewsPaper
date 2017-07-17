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

@interface NPNewsNormalBodyCell ()
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *catagoryLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@end

@implementation NPNewsNormalBodyCell

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

- (void)setArtical:(ArticleBean *)artical {
    artical = artical;
    self.titleLabel.text = artical.title;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld", artical.updateTime];
    self.catagoryLabel.text = [NSString stringWithFormat:@"%ld", artical.catagoryId];
    self.catagoryLabel.text = @"World";
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:artical.pictures[0].file] placeholderImage:[UIImage imageNamed:@"placeholder_default"]];
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
