//
//  NewsDetailViewController.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/27.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArticleBean;
@class RecommendBean;

@interface NewsDetailViewController : UIViewController

- (instancetype)initWithArticle:(ArticleBean *)article;
- (instancetype)initWithRecommend:(RecommendBean *)recommend;

@end
