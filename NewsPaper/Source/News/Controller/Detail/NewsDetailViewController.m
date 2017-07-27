//
//  NewsDetailViewController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/27.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NewsDetailViewController.h"

#import "ArticleBean.h"
#import "RecommendBean.h"

@interface NewsDetailViewController ()
@property (nonatomic ,strong) ArticleBean *article;
@end

@implementation NewsDetailViewController

#pragma mark - Init Methods

- (instancetype)initWithArticle:(ArticleBean *)article {
    if (self = [super initWithURL:[NSURL URLWithString:article.shareUrl] entersReaderIfAvailable:YES]) {
        self.preferredControlTintColor = [JHThemeManager sharedThemeManager].accent;
        _article = article;
        self.title = article.title;
        NSLog(@"%@", article.shareUrl);
    }
    
    return self;
}

- (instancetype)initWithRecommend:(RecommendBean *)recommend {
    return [self initWithArticle:recommend.article];
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
