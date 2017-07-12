//
//  PictureBean.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "PictureBean.h"

#import "ArticleBean.h"

@interface PictureBean ()
@property (weak, nonatomic) ArticleBean *article;
@end

@implementation PictureBean

#pragma mark - Class Methods

+ (NSArray<PictureBean *> *)picturesArrayFromDic:(NSDictionary *)dic aritical:(ArticleBean *)article {
    if (!dic || [dic isKindOfClass:[NSNull class]]) {
        return @[];
    }
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSString *pitureId in dic.allKeys) {
        [array addObject:[[PictureBean alloc] initWithDic:dic[pitureId] aritical:article]];
    }

    return [array copy];
}

#pragma mark - Init Methods

- (instancetype)initWithDic:(NSDictionary *)dic aritical:(ArticleBean *)article {
    if (self = [super init]) {
        _article = article;
        JHJsonModelPropertyMappingNSInteger(dic, @"articleId", _articleId)
        JHJsonModelPropertyMappingNSString(dic, @"description", _desc)
        JHJsonModelPropertyMappingNSString(dic, @"file", _file)
        JHJsonModelPropertyMappingNSString(dic, @"fileHD", _fileHD)
        JHJsonModelPropertyMappingNSInteger(dic, @"height", _height)
        JHJsonModelPropertyMappingNSInteger(dic, @"pictureId", _pictureId)
        JHJsonModelPropertyMappingNSInteger(dic, @"position", _position)
        JHJsonModelPropertyMappingNSInteger(dic, @"relatedLocationId", _relatedLocationId)
        JHJsonModelPropertyMappingNSInteger(dic, @"width", _width)
    }
    
    return self;
}

#pragma mark - Getter

- (NSString *)file {
    return [NSString stringWithFormat:@"%@/newsdata/news/%@/%ld/%@", SERVER_URL, _article.path, _article.articleId, _file];
}

- (NSString *)fileHD {
    return [NSString stringWithFormat:@"%@/newsdata/news/%@/%ld/%@", SERVER_URL, _article.path, _article.articleId, _fileHD];
}

@end
