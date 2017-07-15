//
//  AppDelegate.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/6/25.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "AppDelegate.h"

#import "ZeusViewController.h"

// register cells
#import "NPCellFactory.h"
#import "RecommendHeaderCell.h"

@interface AppDelegate ()
@property (strong, nonatomic) ZeusViewController *zeusVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initData];
    [self initView];
    return YES;
}

- (void)initData{
    [self initNetwork];
    [self initCells];
}

- (void)initView {
    // 初始化视图
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = self.zeusVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self startupAnimation];
}

- (void)initCells {
    [NPCellFactory registerCellClass:[RecommendHeaderCell class] forType:NPCellTypeRecommendHeader];
}

- (void)initNetwork {
    // 开始监测网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NPNotificationNetworkChange object:nil userInfo:nil];
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"无网络");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"WiFi网络");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"无线网络");
                break;
            }
                
            default:
                break;
        }
    }];
}

#pragma mark - Private Methods
- (void)startupAnimation {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Getter

- (ZeusViewController *)zeusVC {
    if (!_zeusVC) {
        _zeusVC = [[ZeusViewController alloc] init];
    }
    
    return _zeusVC;
}
@end
