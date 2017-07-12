//
//  NewsSourceModel.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHBaseModel.h"

@class ArticleBean;
@class RecommendBean;

typedef NS_ENUM(NSInteger, NewsSourceType) {
    NewsSourceTypeRecommand = 0,
    NewsSourceTypeEditorsPick,
    NewsSourceTypeAudio,
    NewsSourceTypeOpinion,
    NewsSourceTypeChina,
    NewsSourceTypeWorld,
    NewsSourceTypeBussiness,
    NewsSourceTypeSport,
    NewsSourceTypeLifeStyle,
    NewsSourceTypeTech,
    NewsSourceTypeSpecial,
    NewsSourceTypePhoto,
    NewsSourceTypeVideo,
    NewsSourceTypeNewspaper,
};

@interface NewsSourceModel : JHBaseModel

+ (NSArray<NewsSourceModel *> *)newsSourceModels;

@property (assign, nonatomic, readonly) NewsSourceType type;
@property (strong, nonatomic, readonly) NSString *title;

- (void)refresh;
- (void)loadMore;

- (NSInteger)count;
- (ArticleBean *)sourceAtIndex:(NSInteger)index;

@end

@interface RecommandSourceModel : NewsSourceModel

- (RecommendBean *)sourceAtIndex:(NSInteger)index;

@end
