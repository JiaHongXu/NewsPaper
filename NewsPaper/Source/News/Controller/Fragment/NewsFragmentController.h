//
//  NewsFragmentController.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsSourceModel;

@interface NewsFragmentController : UITableViewController
@property (strong, nonatomic, readonly) NewsSourceModel *newsSource;

- (instancetype)initWithNewsSource:(NewsSourceModel *)newsSource;

@end
