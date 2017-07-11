//
//  NSDictionary+SafeString.m
//  EWork
//
//  Created by Jiahong Xu on 2017/3/17.
//  Copyright © 2017年 徐嘉宏. All rights reserved.
//

#import "NSDictionary+JHExtension.h"

@implementation NSDictionary (JHExtension)
- (NSString *)stringForKey:(NSString *)key {
    id object = [self objectForKey:key];
   
    if (!object||[object isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    return object;
}
@end
