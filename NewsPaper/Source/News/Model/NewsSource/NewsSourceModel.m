//
//  NewsSourceModel.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NewsSourceModel.h"

#import "ArticleBean.h"
#import "RecommendBean.h"

@interface NewsSourceModel ()

@property (assign, nonatomic) NewsSourceType type;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *api;

@property (strong, nonatomic) NSMutableArray<ArticleBean *> *articleArray;

@end

@implementation NewsSourceModel

#pragma mark - Class Methods

+ (NSArray<NewsSourceModel *> *)newsSourceModels {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    [array addObject:[[RecommandSourceModel alloc] initWithNewsSourceType:NewsSourceTypeRecommand]];
    for (NSInteger index = 1; index < 12; index++) {
        [array addObject:[[NewsSourceModel alloc] initWithNewsSourceType:index]];
    }
    
    return [array copy];
}

#pragma mark - Init Methods

- (instancetype)initWithNewsSourceType:(NewsSourceType)type {
    if (self = [super init]) {
        _type = type;
    }
    
    return self;
}

#pragma mark - Public Methods

- (void)refresh {
    WS(ws);
    [[JHNetworkManager defaultManager] requestJson:[NSString stringWithFormat:@"%@%@", SERVER_URL, self.api] success:^(NSString *msg, id obj) {
        
        [self.articleArray removeAllObjects];
        [self.articleArray addObjectsFromArray:[ArticleBean articleArrayFromDic:obj]];
        
        ws.successBlock(msg);
    } failure:^(NSString *msg) {
        ws.failureBlock(msg);
    } error:^(NSString *msg) {
        ws.errorBlock(msg);
    }];
}

- (void)loadMore {
    
}

- (NSInteger)count {
    return self.articleArray.count;
}

- (ArticleBean *)sourceAtIndex:(NSInteger)index {
    if (index < self.articleArray.count) {
        return self.articleArray[index];
    }
    return nil;
}

#pragma mark - Private Methods

#pragma mark - Getter

- (NSString *)title {
    if (!_title) {
        _title = @[@"Recommand",
                   @"Editor's Pick",
                   @"Audio",
                   @"Opinion",
                   @"China",
                   @"World",
                   @"Bussiness",
                   @"Sport",
                   @"Life Style",
                   @"Tech",
                   //@"Special",
                   @"Photo",
                   @"Video"][_type];
    }
    
    return _title;
}

- (NSString *)api {
    if (!_api) {
        _api = @{@"Recommand":NPApiNewsRecommand,
                 @"Editor's Pick":@"/newsdata/news/columns/440_column_v4.json",
                 @"Audio":@"/newsdata/news/columns/audios.json",
                 @"Opinion":@"/newsdata/news/columns/33_column_v4.json",
                 @"China":@"/newsdata/news/columns/32_column_v4.json",
                 @"World":@"/newsdata/news/columns/42_column_v4.json",
                 @"Bussiness":@"/newsdata/news/columns/40_column_v4.json",
                 @"Sport":@"/newsdata/news/columns/47_column_v4.json",
                 @"Life Style":@"/newsdata/news/columns/34_column_v4.json",
                 @"Tech":@"/newsdata/news/columns/360_column_v4.json",
                 //@"Special":@"",
                 @"Photo":@"/newsdata/news/columns/38_column_v4.json",
                 @"Video":@"/newsdata/news/columns/39_column_v4.json",
                 }[self.title];
    }
    
    return _api;
}

- (NSMutableArray<ArticleBean *> *)articleArray {
    if (!_articleArray) {
        _articleArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return _articleArray;
}

@end

@interface RecommandSourceModel ()
@property (strong, nonatomic) NSMutableArray *recommendArray;
@end

@implementation RecommandSourceModel

- (void)refresh {
    WS(ws);
    [[JHNetworkManager defaultManager] requestJson:[NSString stringWithFormat:@"%@%@", SERVER_URL, self.api] success:^(NSString *msg, id obj) {
        [self.recommendArray removeAllObjects];
        [self.recommendArray addObjectsFromArray:[RecommendBean recommendArrayFromDic:obj]];
        
        ws.successBlock(msg);
    } failure:^(NSString *msg) {
        ws.failureBlock(msg);
    } error:^(NSString *msg) {
        ws.errorBlock(msg);
    }];
}

- (void)loadMore {
    
}

- (NSInteger)count {
    return self.recommendArray.count;
}

- (RecommendBean *)sourceAtIndex:(NSInteger)index {
    if (index < self.recommendArray.count) {
        return self.recommendArray[index];
    }
    return nil;
}

#pragma mark - Private

#pragma mark - Getter

- (NSMutableArray<RecommendBean *> *)recommendArray {
    if (!_recommendArray) {
        _recommendArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return _recommendArray;
}

- (NSMutableArray<ArticleBean *> *)articleArray {
    return nil;
}

@end
