//
//  RecommendBean.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "RecommendBean.h"
#import "ArticleBean.h"

@implementation RecommendBean

#pragma mark - Class Methods

+ (NSArray<RecommendBean *> *)recommendArrayFromDic:(NSDictionary *)dic {
    if (!dic || [dic isKindOfClass:[NSNull class]]) {
        return @[];
    }
    
    NSMutableArray *originArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSString *recommendId in dic.allKeys) {
        [originArray addObject:[[RecommendBean alloc] initWithDic:dic[recommendId]]];
        
    }
    
    [originArray sortUsingComparator:^NSComparisonResult(RecommendBean *bean1, RecommendBean *bean2) {
        if (bean1.position < bean2.position) {
            return NSOrderedAscending;
        } else if (bean1.position > bean2.position){
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    RecommendBean *headerRecommend = nil;
    NSMutableArray *filteredArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (RecommendBean *recommend in originArray) {
        if (recommend.type == RecommendTypeHeader) {
            if (headerRecommend) {
                headerRecommend.nextRecommend = recommend;
                headerRecommend = recommend;
            } else {
                headerRecommend = recommend;
                [filteredArray addObject:headerRecommend];
            }
        } else {
            headerRecommend = nil;
            [filteredArray addObject:recommend];
        }
    }
    
    return [filteredArray copy];
}

#pragma mark - Init Methods

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        JHJsonModelPropertyMappingNSInteger(dic, @"recommendId", _recommendId)
        JHJsonModelPropertyMappingNSInteger(dic, @"isSpecial", _isSpecial)
        JHJsonModelPropertyMappingNSInteger(dic, @"recommendTemplate", _type)
        JHJsonModelPropertyMappingNSString(dic, @"title", _title)
        JHJsonModelPropertyMappingNSInteger(dic, @"position", _position)
        JHJsonModelPropertyMappingNSInteger(dic, @"createTime", _createTime)
        _article = [[ArticleBean alloc] initWithDic:dic[@"article"]];
        _catagory = @{
                      @(42):@"WORLD",
                      @(40):@"BUSINESS",
                      @(38):@"PHOTO",
                      @(32):@"CHINA",
                      @(47):@"SPORTS",
                      @(39):@"VIDEO",
                      @(34):@"LIFE STYLE",
                      @(33):@"OPINION",
                      }[@(_article.columnId)];
    }
    
    return self;
}

#pragma mark - Getter

- (NSString *)timeStr {
    if (!_timeStr) {
        NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
        dateFormater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormater setDateFormat:@"MMMM d.yyyy"];
        _timeStr = [dateFormater stringFromDate:[NSDate dateWithTimeIntervalSince1970:_createTime]];
    }
    
    return _timeStr;
}

@end
