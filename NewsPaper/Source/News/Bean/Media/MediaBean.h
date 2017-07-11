//
//  MediaBean.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MediaType) {
    MediaType0 = 0,
    MediaTypeAudio,
    MediaType2,
};

@interface MediaBean : NSObject

+ (NSArray<MediaBean *> *)mediasArrayFromDic:(NSDictionary *)dic;

@property (assign, nonatomic) NSInteger articleId;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *file;
@property (strong, nonatomic) NSString *fileHD;
@property (assign, nonatomic) NSInteger mediaId;
@property (assign, nonatomic) NSInteger position;
@property (assign, nonatomic) NSInteger relatedPictureId;
@property (assign, nonatomic) NSInteger time;
@property (assign, nonatomic) MediaType type;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
