//
//  PictureBean.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "PictureBean.h"

@implementation PictureBean

#pragma mark - Class Methods

+ (NSArray<PictureBean *> *)picturesArrayFromDic:(NSDictionary *)dic {
    if (!dic || [dic isKindOfClass:[NSNull class]]) {
        return @[];
    }
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSString *pitureId in dic.allKeys) {
        [array addObject:[[PictureBean alloc] initWithDic:dic[pitureId]]];
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
        JHJsonModelPropertyMappingNSInteger(dic, @"height", _height)
        JHJsonModelPropertyMappingNSInteger(dic, @"pictureId", _pictureId)
        JHJsonModelPropertyMappingNSInteger(dic, @"position", _position)
        JHJsonModelPropertyMappingNSInteger(dic, @"relatedLocationId", _relatedLocationId)
        JHJsonModelPropertyMappingNSInteger(dic, @"width", _width)
    }
    
    return self;
}

@end
