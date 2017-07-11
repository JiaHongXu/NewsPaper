//
//  JHNetworkManager.h
//  EWork
//
//  Created by Jiahong Xu on 2017/3/16.
//  Copyright © 2017年 徐嘉宏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHNetworkManager : NSObject
@property (assign, nonatomic) BOOL wifiOnly;

/**
 获取网络访问类的单例
 */
+ (instancetype)defaultManager;

/**
 发送 POST 请求，并取得回调
 @param urlStr      目的 URL
 @param parameters  以 NSDictionay 保存的参数
 @param success     请求成功，包含请求成功的消息和以 NSDictionay 保存的数据
 @param failure     请求失败，包含请求失败的消息
 @param error       发生错误，包含错误的消息，通常为无网络下会触发
 */

- (void)request:(NSString *)urlStr
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSString *msg, id obj))success
        failure:(void (^)(NSString *msg))failure
          error:(void (^)(NSString *msg))error;

/**
 发送包含图片的 POST 请求，并取得回调
 @param urlStr      目的 URL
 @param parameters  以 NSDictionay 保存的参数
 @param images      图片数组
 @param tags        图片名称数组
 @param success     请求成功，包含请求成功的消息和以 NSDictionay 保存的数据
 @param failure     请求失败，包含请求失败的消息
 @param error       发生错误，包含错误的消息，通常为无网络下会触发
 */
- (void)request:(NSString *)urlStr
     parameters:(NSDictionary *)parameters
         images:(NSArray<UIImage *> *)images
           tags:(NSArray<NSString *> *)tags
        success:(void (^)(NSString *msg, id obj))success
        failure:(void (^)(NSString *msg))failure
          error:(void (^)(NSString *msg))error;

/**
 请求 JSON 数据，并取得回调
 @param urlStr      目的 URL
 @param success     请求成功，包含请求成功的消息和以 NSDictionay 保存的数据
 @param failure     请求失败，包含请求失败的消息
 @param error       发生错误，包含错误的消息，通常为无网络下会触发
 */
- (void)requestJson:(NSString *)urlStr
            success:(void (^)(NSString *, id obj))success
            failure:(void (^)(NSString *))failure
              error:(void (^)(NSString *))error;
@end
