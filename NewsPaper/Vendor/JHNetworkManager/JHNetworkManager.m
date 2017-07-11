//
//  JHNetworkManager.m
//  EWork
//
//  Created by Jiahong Xu on 2017/3/16.
//  Copyright © 2017年 徐嘉宏. All rights reserved.
//

#import "JHNetworkManager.h"
#import "NSDictionary+JHExtension.h"

static JHNetworkManager *manager;

static NSString * kWifiOnlyStr = @"EWork-General-WifiOnly";

@interface JHNetworkManager ()
@property (strong, nonatomic) AFHTTPSessionManager *httpSessionManager;
@property (strong, nonatomic) AFURLSessionManager *urlSessionManager;
@end

@implementation JHNetworkManager
@synthesize wifiOnly = _wifiOnly;

#pragma mark - Singleton
+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [JHNetworkManager defaultManager];
}

- (id)copy {
    return [JHNetworkManager defaultManager];
}

#pragma mark - Init Methods
- (instancetype)init {
    if (self = [super init]) {
        _httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:SERVER_URL]];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _urlSessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    
    return self;
}

#pragma mark - Public Methods
- (void)request:(NSString *)urlStr
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSString *, id))success
        failure:(void (^)(NSString *))failure
          error:(void (^)(NSString *))error {
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable/*||[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown*/) {
        NSLog(@"%ld", (long)[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus);
        NSLog(@"没有网络!@%@", urlStr);
        error(NSLocalizedString(@"NetworkConnectionFailed", nil));
        return;
    } else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN) {
        if ([JHNetworkManager defaultManager].wifiOnly) {
            NSLog(@"在使用流量，没有Wi-Fi!@%@", urlStr);
            error(NSLocalizedString(@"WiFiOnly", nil));
            return;
        }
    }
    
    [_httpSessionManager POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        
        id obj = nil;
        NSString *msg = nil;
        NSString *flag = nil;
        
        if (dic) {
            flag = [dic stringForKey:@"flag"];
            msg = [dic stringForKey:@"msg"];
            obj = [dic objectForKey:@"result"];
            
            if ([flag isEqualToString:@"200"]) {
                success(msg, obj);
            } else {
                failure(msg);
            }
        } else {
            failure(NSLocalizedString(@"ServerError", nil));
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(NSLocalizedString(@"NetworkError", nil));
    }];
}

- (void)request:(NSString *)urlStr parameters:(NSDictionary *)parameters images:(NSArray<UIImage *> *)images tags:(NSArray<NSString *> *)tags success:(void (^)(NSString *, id))success failure:(void (^)(NSString *))failure error:(void (^)(NSString *))error {
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable||[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        NSLog(@"没有网络!@%@", urlStr);
        error(NSLocalizedString(@"NetworkConnectionFailed", nil));
        return;
    } else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN) {
        if ([JHNetworkManager defaultManager].wifiOnly) {
            NSLog(@"在使用流量，没有Wi-Fi!@%@", urlStr);
            error(NSLocalizedString(@"WiFiOnly", nil));
            return;
        }
    }
    
    [_httpSessionManager POST:urlStr
                   parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                       for (NSInteger i = 0; i<images.count; i++) {
                           UIImage *image = images[i];
                           NSData *imageData = UIImageJPEGRepresentation(image, 0);
                           NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                           formatter.dateFormat = @"yyyyMMddHHmmss";
                           NSString *str = [formatter stringFromDate:[NSDate date]];
                           NSString *_fileName = [NSString stringWithFormat:@"%@%ld.jpg", str, i];
                           [formData appendPartWithFileData:imageData name:tags[i] fileName:_fileName mimeType:@"image/png"];
                       }
                       
                   } progress:^(NSProgress * _Nonnull uploadProgress) {
                       
                   } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                       NSDictionary *dic = responseObject;
                       
                       id obj = nil;
                       NSString *msg = nil;
                       NSString *flag = nil;
                       
                       if (dic) {
                           flag = [dic stringForKey:@"flag"];
                           msg = [dic stringForKey:@"msg"];
                           obj = [dic objectForKey:@"result"];
                           
                           if ([flag isEqualToString:@"200"]) {
                               success(msg, obj);
                           } else {
                               failure(msg);
                           }
                       } else {
                           failure(NSLocalizedString(@"ServerError", nil));
                       }
                       
                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                       failure(NSLocalizedString(@"NetworkError", nil));
                   }];
}

- (void)requestJson:(NSString *)urlStr success:(void (^)(NSString *, id))success failure:(void (^)(NSString *))failure error:(void (^)(NSString *))error {
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable||[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        NSLog(@"没有网络!@%@", urlStr);
        error(NSLocalizedString(@"NetworkConnectionFailed", nil));
        return;
    } else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN) {
        if ([JHNetworkManager defaultManager].wifiOnly) {
            NSLog(@"在使用流量，没有Wi-Fi!@%@", urlStr);
            error(NSLocalizedString(@"WiFiOnly", nil));
            return;
        }
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request
                                    completionHandler:^(NSData * _Nullable data,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error1) {
                                        if (error1) {
                                            failure(NSLocalizedString(@"NetworkError", nil));
                                        } else if (!data) {
                                            failure(NSLocalizedString(@"ServerError", nil));
                                        }
                                        
                                        NSError *parseError;
                                        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&parseError];
                                        
                                        if (parseError) {
                                            failure(NSLocalizedString(@"ServerError", nil));
                                        } else {
                                            success(@"success", obj);
                                        }
                                        
                                    }] resume];
}

#pragma mark - Getter
- (BOOL)wifiOnly {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kWifiOnlyStr];
}

#pragma mark - Setter
- (void)setWifiOnly:(BOOL)wifiOnly {
    [[NSUserDefaults standardUserDefaults] setBool:wifiOnly forKey:kWifiOnlyStr];
}
@end
