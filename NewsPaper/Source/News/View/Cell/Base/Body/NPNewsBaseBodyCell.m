//
//  NPNewsBaseBodyCell.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/18.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPNewsBaseBodyCell.h"

@interface NPNewsBaseBodyCell ()

@end

@implementation NPNewsBaseBodyCell
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
    MASAttachKeys(self.imgView, self.timeLabel, self.titleLabel, self.catagoryLabel)
}

#pragma mark - Override Methods

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
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
        _catagoryLabel.textColor = [JHThemeManager sharedThemeManager].accent;
        _catagoryLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_catagoryLabel];
    }
    
    return _catagoryLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
        _timeLabel.textColor = [JHThemeManager sharedThemeManager].textSecondary;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_timeLabel];
    }
    
    return _timeLabel;
}

@end
