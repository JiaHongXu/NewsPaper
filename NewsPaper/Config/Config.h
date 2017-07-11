//
//  Config.h
//  NewsPaper
//
//  Created by 307A on 2016/12/22.
//  Copyright © 2016年 徐嘉宏. All rights reserved.
//

#ifndef Config_h
#define Config_h

#pragma mark - Vendor Keys

#pragma mark - Macro

#define WS(weakself) __weak __typeof(&*self) weakself = self
#define SCREEN_WIDTH (([UIScreen mainScreen].bounds.size.width < [UIScreen mainScreen].bounds.size.height)?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)
#define SCREEN_HEIGHT (([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height)?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)

#pragma mark - Color
#define NPColorPrimary @"#FBEC77"
#define NPColorBlackLightBackgroud @"#292929"
#define NPColorBlackDarkBackgroud @"#232323"

#pragma mark - Dimens


#pragma mark - Font Size


#pragma mark - Error Code


#pragma mark - Notification
#define NPNotificationNetworkChange @"NPNotificationNetworkChange"
#define NPNotificationMenuShouldOpenClose @"NPNotificationMenuShouldOpenClose"
#define NPNotificationNewsFragmentDidChange @"NPNotificationNewsFragmentDidChange"


#endif /* Config_h */
