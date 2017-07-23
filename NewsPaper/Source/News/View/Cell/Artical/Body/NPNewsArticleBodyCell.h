//
//  RecommendBodyCell.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPNewsBaseBodyCell.h"
@class ArticleBean;

@interface NPNewsArticleBodyCell : NPNewsBaseBodyCell
@property (strong, nonatomic) ArticleBean *article;
@end

@interface NPNewsArticleDetailBodyCell : NPNewsArticleBodyCell

@end

@interface NPNewsArticleDetailNoPicBodyCell : NPNewsArticleBodyCell

@end

@interface NPNewsArticleLargePicBodyCell : NPNewsArticleBodyCell

@end

@interface NPNewsArticleMultiPicBodyCell : NPNewsArticleBodyCell

@end

@interface NPNewsArticleDetailVideo : NPNewsArticleBodyCell

@end

@interface NPNewsArticleDetailAudio : NPNewsArticleBodyCell

@end
