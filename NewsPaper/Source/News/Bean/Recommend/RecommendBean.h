//
//  RecommendBean.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//
//
//  Only in Recommand !!!!!!!!!!!!!!!

#import <Foundation/Foundation.h>

@class ArticleBean;

typedef NS_ENUM(NSInteger, RecommendType) {
    RecommendTypeNone = -1,
    RecommendTypeHeader,
    RecommendTypeDetail,
    RecommendTypeLargePicture,
    RecommendTypeMultiPicture,
};

@interface RecommendBean : NSObject

@property (assign, nonatomic) NSInteger recommendId;
@property (assign, nonatomic) BOOL isSpecial;
@property (assign, nonatomic) RecommendType type;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *catagory;
@property (assign, nonatomic) NSInteger position;
@property (assign, nonatomic) NSInteger createTime;
@property (strong, nonatomic) ArticleBean *article;
@property (strong, nonatomic) NSString *timeStr;

@property (strong, nonatomic) RecommendBean *nextRecommend;
+ (NSArray<RecommendBean *> *)recommendArrayFromDic:(NSDictionary *)dic;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
