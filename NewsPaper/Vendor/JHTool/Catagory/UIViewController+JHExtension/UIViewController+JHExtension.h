//
//  UIViewController+JHExtension.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/8.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (JHExtension)

@property (strong, nonatomic) MBProgressHUD *mbHub;

typedef NS_ENUM(NSInteger , JHAlertType) {
    JHAlertTypeSuccess,
    JHAlertTypeWarning,
    JHAlertTypeError,
};

// show an alert hud with a single string of msg
- (void)showAlertWithMsg:(NSString *)msg Type:(JHAlertType)type;

// start an waiting hud (or waiting hud with msg)
- (void)startWaitingHud;
- (void)startWaitingHudWithMsg:(NSString *)msg;

// dissmiss hud
- (void)dismissHud;
- (void)dismissWithMsg:(NSString *)msg Type:(JHAlertType)type;

@end
