//
//  NPCellFactory.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/14.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NPCellType) {
    NPCellTypeNone = 0,
    NPCellTypeRecommendHeader,
    NPCellTypeRecommendMultiPic,
    NPCellTypeRecommendLargePic,
    NPCellTypeRecommendDetail,
    NPCellTypeRecommendDetailNoPic,
    
    NPCellTypeArticleHeader,
    NPCellTypeArticleMultiPic,
    NPCellTypeArticleLargePic,
    NPCellTypeArticleDetail,
    NPCellTypeArticleDetailNoPic,
    NPCellTypeArticleMedia,
};

typedef void(^NPConfigCellBlock)(UITableViewCell *cell);

@interface NPCellFactory : NSObject

+ (void)registerCellClass:(Class)clazz forType:(NPCellType)type;
+ (UITableViewCell *)configCellForTableView:(UITableView *)tableView type:(NPCellType)type indexPath:(NSIndexPath *)indexPath config:(NPConfigCellBlock)block;

@end
