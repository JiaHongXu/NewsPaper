//
//  RecommendHeaderCell.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/12.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPNewsRecommendHeaderCell.h"

#import "JHSliderView.h"
#import "RecommendBean.h"
#import "ArticleBean.h"
#import "PictureBean.h"

@interface NPNewsRecommendHeaderCell ()
@property (strong, nonatomic) JHSliderView *sliderView;
@end

@implementation NPNewsRecommendHeaderCell

#pragma mark - Init Methods

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setNeedsLayout];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Override Methods

- (void)layoutSubviews {
    [super layoutSubviews];
    self.sliderView.frame = self.frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Setter

- (void)setRecommend:(RecommendBean *)recommend {
    _recommend = recommend;
    NSMutableArray<NSString *> *titles = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray<NSString *> *imgUrls = [[NSMutableArray alloc] initWithCapacity:0];
    RecommendBean *currentRecommend = _recommend;
    while (currentRecommend) {
        [titles addObject:currentRecommend.title];
        [imgUrls addObject:currentRecommend.article.pictures[0].fileHD];
        currentRecommend = currentRecommend.nextRecommend;
    }
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
