//
//  RecommendBodyCell.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPNewsArticleHeaderCell.h"

#import "ArticleBean.h"
#import "PictureBean.h"

@interface NPNewsArticleHeaderCell ()
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImage *placeholder;
@end

@implementation NPNewsArticleHeaderCell

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
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.contentView.mas_height).multipliedBy(0.3);
        make.width.equalTo(self.contentView.mas_width);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.centerX.equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.bottomView.mas_width).multipliedBy(0.9);
        make.bottom.equalTo(self.bottomView.mas_bottom).with.offset(-16);
        make.top.equalTo(self.bottomView.mas_top).with.offset(8);
        make.centerX.equalTo(self.bottomView);
    }];
    self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentView.bounds)*0.9;
}

#pragma mark - Override Methods

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

#pragma mark - Setter

- (void)setArtical:(ArticleBean *)artical {
    artical = artical;
    self.titleLabel.text = artical.title;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:artical.pictures[0].file] placeholderImage:[UIImage imageNamed:@"placeholder_default"]];
}

#pragma mark - Getter

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        [_imgView setContentMode:UIViewContentModeScaleAspectFill];
        [_imgView setClipsToBounds:YES];
        [self addSubview:_imgView];
    }
    
    return _imgView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self insertSubview:_bottomView aboveSubview:self.imgView];
    }
    return _bottomView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        
        [self.bottomView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

@end
