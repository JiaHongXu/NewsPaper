//
//  MediaBean.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "MediaBean.h"

@implementation MediaBean

#pragma mark - Class Methods

+ (NSArray<MediaBean *> *)mediasArrayFromDic:(NSDictionary *)dic {
    if (!dic || [dic isKindOfClass:[NSNull class]]) {
        return @[];
    }
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSString *mediaId in dic.allKeys) {
        [array addObject:[[MediaBean alloc] initWithDic:dic[mediaId]]];
    }
    return [array copy];
}

#pragma mark - Init Methods

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        JHJsonModelPropertyMappingNSInteger(dic, @"articleId", _articleId)
        JHJsonModelPropertyMappingString(dic, @"description", _desc)
        JHJsonModelPropertyMappingString(dic, @"file", _file)
        JHJsonModelPropertyMappingString(dic, @"fileHD", _fileHD)
        JHJsonModelPropertyMappingNSInteger(dic, @"mediaId", _mediaId)
        JHJsonModelPropertyMappingNSInteger(dic, @"position", _position)
        JHJsonModelPropertyMappingNSInteger(dic, @"relatedPictureId", _relatedPictureId)
        JHJsonModelPropertyMappingNSInteger(dic, @"time", _time)
        JHJsonModelPropertyMappingNSInteger(dic, @"type", _type)
    }
    
    return self;
}
@end
