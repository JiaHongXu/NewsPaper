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
