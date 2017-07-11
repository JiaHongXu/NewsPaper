//
//  PictureBean.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PictureBean : NSObject

+ (NSArray<PictureBean *> *)picturesArrayFromDic:(NSDictionary *)dic;

@property (assign, nonatomic) NSInteger articleId;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *file;
@property (strong, nonatomic) NSString *fileHD;
@property (assign, nonatomic) NSInteger height;
@property (assign, nonatomic) NSInteger pictureId;
@property (assign, nonatomic) NSInteger position;
@property (assign, nonatomic) NSInteger relatedLocationId;
@property (assign, nonatomic) NSInteger width;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
