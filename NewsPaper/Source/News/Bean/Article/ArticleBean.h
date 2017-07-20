//
//  ArticleBean.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PictureBean;
@class MediaBean;

typedef NS_ENUM(NSInteger, ArticleType) {
    ArticleTypeNone = 0,
    ArticleTypeHeader,
    ArticleTypeDetail,
    ArticleTypeLargePicture,
    ArticleTypeNoPicture,
    ArticleTypeAudio,
    ArticleTypeVideo,
};

@interface ArticleBean : NSObject

@property (assign, nonatomic) NSInteger articleId;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *authorB;
@property (assign, nonatomic) NSInteger catagoryId;
@property (assign, nonatomic) NSInteger columnId;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *contentB;
@property (assign, nonatomic) NSInteger contentMode;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *descB;
@property (strong, nonatomic) NSString *feature;
@property (assign, nonatomic) BOOL isAd;
@property (strong, nonatomic) NSString *issueId;
@property (assign, nonatomic) NSInteger issuePosition;
@property (strong, nonatomic) NSString *keywords;
@property (strong, nonatomic) NSString *keywordsB;
@property (assign, nonatomic) NSInteger languageMode;
@property (strong, nonatomic) NSString *locations;
@property (assign, nonatomic) BOOL mapEnabled;
@property (strong, nonatomic) NSArray<MediaBean *> *medias;          // 视频
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSArray<PictureBean *> *pictures;
@property (strong, nonatomic) NSString *position;
@property (assign, nonatomic) NSInteger publishTime;
@property (assign, nonatomic) NSInteger regions;
@property (strong, nonatomic) NSString *relatedArticles;
@property (strong, nonatomic) NSString *shareUrl;
@property (strong, nonatomic) NSString *source;
@property (strong, nonatomic) NSString *sourceB;
@property (strong, nonatomic) NSString *specialId;
@property (assign, nonatomic) NSInteger thumbnails;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *titleB;
@property (assign, nonatomic) ArticleType type;
@property (assign, nonatomic) NSInteger updateTime;
@property (strong, nonatomic) NSString *timeStr;

+ (NSArray<ArticleBean *> *)articleArrayFromDic:(NSDictionary *)dic;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
