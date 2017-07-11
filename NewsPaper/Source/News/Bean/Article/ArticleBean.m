//
//  ArticleBean.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "ArticleBean.h"

#import "PictureBean.h"
#import "MediaBean.h"

@implementation ArticleBean

#pragma mark - Class Methods

+ (NSArray<ArticleBean *> *)articleArrayFromDic:(NSDictionary *)dic {
    if (!dic || [dic isKindOfClass:[NSNull class]]) {
        return @[];
    }
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    NSDictionary *articlesDic = [dic objectForKey:@"articles"];
    for (NSString *articleId in articlesDic.allKeys) {
        [array addObject:[[ArticleBean alloc] initWithDic:articlesDic[articleId]]];
    }
    [array sortUsingComparator:^NSComparisonResult(ArticleBean *bean1, ArticleBean *bean2) {
        if (bean1.position < bean2.position) {
            return NSOrderedAscending;
        } else if (bean1.position > bean2.position){
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    return [array copy];
}

#pragma mark - Init Methods

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        JHJsonModelPropertyMappingNSInteger(dic, @"articleId", _articleId)
        JHJsonModelPropertyMappingString(dic, @"author", _author)
        JHJsonModelPropertyMappingString(dic, @"authorB", _authorB)
        JHJsonModelPropertyMappingNSInteger(dic, @"catagoryId", _catagoryId)
        JHJsonModelPropertyMappingNSInteger(dic, @"columnId", _columnId)
        JHJsonModelPropertyMappingString(dic, @"content", _content)
        JHJsonModelPropertyMappingString(dic, @"contentB", _contentB)
        JHJsonModelPropertyMappingNSInteger(dic, @"contentMode", _contentMode)
        JHJsonModelPropertyMappingString(dic, @"description", _desc)
        JHJsonModelPropertyMappingString(dic, @"descriptionB", _descB)
        JHJsonModelPropertyMappingString(dic, @"feature", _feature)
        JHJsonModelPropertyMappingNSInteger(dic, @"isAd", _isAd)
        JHJsonModelPropertyMappingString(dic, @"issueId", _issueId)
        JHJsonModelPropertyMappingNSInteger(dic, @"issuePosition", _issuePosition)
        JHJsonModelPropertyMappingString(dic, @"keywords", _keywords)
        JHJsonModelPropertyMappingString(dic, @"keywordsB", _keywordsB)
        JHJsonModelPropertyMappingNSInteger(dic, @"languageMode", _languageMode)
        JHJsonModelPropertyMappingString(dic, @"locations", _locations)
        JHJsonModelPropertyMappingNSInteger(dic, @"mapEnabled", _mapEnabled)
        _medias = [MediaBean mediasArrayFromDic:[dic objectForKey:@"medias"]];
        JHJsonModelPropertyMappingString(dic, @"path", _path)
        _pictures = [PictureBean picturesArrayFromDic:[dic objectForKey:@"pictures"]];
        JHJsonModelPropertyMappingString(dic, @"position", _position)
        JHJsonModelPropertyMappingNSInteger(dic, @"publishTime", _publishTime)
        JHJsonModelPropertyMappingNSInteger(dic, @"regions", _regions)
        JHJsonModelPropertyMappingString(dic, @"relatedArticles", _relatedArticles)
        JHJsonModelPropertyMappingString(dic, @"shareUrl", _shareUrl)
        JHJsonModelPropertyMappingString(dic, @"source", _source)
        JHJsonModelPropertyMappingString(dic, @"sourceB", _sourceB)
        JHJsonModelPropertyMappingString(dic, @"specialId", _specialId)
        JHJsonModelPropertyMappingNSInteger(dic, @"thumbnails", _thumbnails)
        JHJsonModelPropertyMappingString(dic, @"title", _title)
        JHJsonModelPropertyMappingString(dic, @"titleB", _titleB)
        JHJsonModelPropertyMappingNSInteger(dic, @"updateTime", _updateTime)
    }
    
    return self;
}
@end
