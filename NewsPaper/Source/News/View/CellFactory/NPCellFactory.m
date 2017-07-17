//
//  NPCellFactory.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/14.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NPCellFactory.h"
static NSMutableDictionary *cellTypeMappingDic;
@implementation NPCellFactory

+ (void)registerCellClass:(Class)clazz forType:(NPCellType)type {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cellTypeMappingDic = [[NSMutableDictionary alloc] initWithCapacity:0];
        [cellTypeMappingDic setObject:[UITableViewCell class] forKey:@(NPCellTypeNone)];
    });
    [cellTypeMappingDic setObject:clazz forKey:@(type)];
}

+ (UITableViewCell *)configCellForTableView:(UITableView *)tableView type:(NPCellType)type indexPath:(NSIndexPath *)indexPath config:(NPConfigCellBlock)block {
    NSString *identifier = [self identifierWithType:type];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        Class cellClass = [cellTypeMappingDic objectForKey:@(type)];
        if (!cellClass) {
            NSAssert(NO, [NSString stringWithFormat:@"UITableViewCell haven't registered"]);
        } else {
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    if (block) {
        block(cell);
    }
    return cell;
}

+ (NSString *)identifierWithType:(NPCellType)type {
    return [NSString stringWithFormat:@"CellIdentifier%ld", type];
}
@end
