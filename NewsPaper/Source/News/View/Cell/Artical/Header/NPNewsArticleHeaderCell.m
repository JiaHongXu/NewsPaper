//
//  RecommendBodyCell.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPNewsArticleHeaderCell.h"

#import "JHSliderView.h"
#import "ArticleBean.h"
#import "PictureBean.h"

@interface NPNewsArticleHeaderCell ()
@property (strong, nonatomic) JHSliderView *sliderView;
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
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.equalTo(self.sliderView.mas_width).multipliedBy(10./16.).priorityHigh();
    }];
}

#pragma mark - Override Methods

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

#pragma mark - Setter

- (void)setArticle:(ArticleBean *)article {
    _article = article;
    NSMutableArray<NSString *> *titles = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray<NSString *> *imgUrls = [[NSMutableArray alloc] initWithCapacity:0];
    [titles addObject:_article.title];
    [imgUrls addObject:_article.pictures[0].fileHD];
    [self.sliderView setTitles:titles imgUrls:imgUrls];
}

#pragma mark - Getter

- (JHSliderView *)sliderView {
    if (!_sliderView) {
        _sliderView = [[JHSliderView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"placeholder_default"]];
        [self.contentView addSubview:_sliderView];
    }
    
    return _sliderView;
}

@end
