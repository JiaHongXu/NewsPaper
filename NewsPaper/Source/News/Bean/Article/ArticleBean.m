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
        if (bean1.updateTime > bean2.updateTime) {
            return NSOrderedAscending;
        } else if (bean1.updateTime < bean2.updateTime){
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    [self figureType:array];
    
    return [array copy];
}

+ (void)figureType:(NSArray<ArticleBean *> *)array {
    for (ArticleBean *article in array) {
        if ([array indexOfObject:article]==0) {
            article.type = ArticleTypeHeader;
        } else if (article.medias.count!=0) {
            if ([article.medias[0].file hasSuffix:@"mp3"]) {
                article.type = ArticleTypeAudio;
            } else if([article.medias[0].file hasSuffix:@"mp4"]) {
                article.type = ArticleTypeVideo;
            }
        } else if (article.pictures.count==0) {
            article.type = ArticleTypeNoPicture;
        } else {
            article.type = ArticleTypeDetail;
        }
    }
}

#pragma mark - Init Methods

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        JHJsonModelPropertyMappingNSInteger(dic, @"articleId", _articleId)
        JHJsonModelPropertyMappingNSString(dic, @"author", _author)
        JHJsonModelPropertyMappingNSString(dic, @"authorB", _authorB)
        JHJsonModelPropertyMappingNSInteger(dic, @"catagoryId", _catagoryId)
        JHJsonModelPropertyMappingNSInteger(dic, @"columnId", _columnId)
        JHJsonModelPropertyMappingNSString(dic, @"content", _content)
        JHJsonModelPropertyMappingNSString(dic, @"contentB", _contentB)
        JHJsonModelPropertyMappingNSInteger(dic, @"contentMode", _contentMode)
        JHJsonModelPropertyMappingNSString(dic, @"description", _desc)
        JHJsonModelPropertyMappingNSString(dic, @"descriptionB", _descB)
        JHJsonModelPropertyMappingNSString(dic, @"feature", _feature)
        JHJsonModelPropertyMappingNSInteger(dic, @"isAd", _isAd)
        JHJsonModelPropertyMappingNSString(dic, @"issueId", _issueId)
        JHJsonModelPropertyMappingNSInteger(dic, @"issuePosition", _issuePosition)
        JHJsonModelPropertyMappingNSString(dic, @"keywords", _keywords)
        JHJsonModelPropertyMappingNSString(dic, @"keywordsB", _keywordsB)
        JHJsonModelPropertyMappingNSInteger(dic, @"languageMode", _languageMode)
        JHJsonModelPropertyMappingNSString(dic, @"locations", _locations)
        JHJsonModelPropertyMappingNSInteger(dic, @"mapEnabled", _mapEnabled)
        JHJsonModelPropertyMappingNSString(dic, @"path", _path)
        JHJsonModelPropertyMappingNSString(dic, @"position", _position)
        JHJsonModelPropertyMappingNSInteger(dic, @"publishTime", _publishTime)
        JHJsonModelPropertyMappingNSInteger(dic, @"regions", _regions)
        JHJsonModelPropertyMappingNSString(dic, @"relatedArticles", _relatedArticles)
        JHJsonModelPropertyMappingNSString(dic, @"shareUrl", _shareUrl)
        JHJsonModelPropertyMappingNSString(dic, @"source", _source)
        JHJsonModelPropertyMappingNSString(dic, @"sourceB", _sourceB)
        JHJsonModelPropertyMappingNSString(dic, @"specialId", _specialId)
        JHJsonModelPropertyMappingNSInteger(dic, @"thumbnails", _thumbnails)
        JHJsonModelPropertyMappingNSString(dic, @"title", _title)
        JHJsonModelPropertyMappingNSString(dic, @"titleB", _titleB)
        JHJsonModelPropertyMappingNSInteger(dic, @"updateTime", _updateTime)
        _medias = [MediaBean mediasArrayFromDic:[dic objectForKey:@"medias"]];
        _pictures = [PictureBean picturesArrayFromDic:[dic objectForKey:@"pictures"] aritical:self];
    }
    
    return self;
}

#pragma mark - Getter

- (NSString *)timeStr {
    if (!_timeStr) {
        NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
        dateFormater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormater setDateFormat:@"MMMM d.yyyy"];
        _timeStr = [dateFormater stringFromDate:[NSDate dateWithTimeIntervalSince1970:_publishTime]];
    }
    
    return _timeStr;
}

@end
