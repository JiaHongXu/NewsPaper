//
//  NewsDetailViewController.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/27.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <SafariServices/SafariServices.h>

@class ArticleBean;
@class RecommendBean;

@interface NewsDetailViewController : SFSafariViewController

- (instancetype)initWithArticle:(ArticleBean *)article;
- (instancetype)initWithRecommend:(RecommendBean *)recommend;

@end
