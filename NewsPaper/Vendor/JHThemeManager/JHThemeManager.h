//
//  JHThemeManager.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/8.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JHThemeDefaultLight @"JHThemeDefaultLight"
#define JHThemeDefaultDark @"JHThemeDefaultDark"

#define JHThemeKeyPrimary @"JHThemeKeyPrimary"
#define JHThemeKeyPrimaryLight @"JHThemeKeyPrimaryLight"
#define JHThemeKeyPrimaryDark @"JHThemeKeyPrimaryDark"
#define JHThemeKeyAccent @"JHThemeKeyAccent"
#define JHThemeKeyTextPrimary @"JHThemeKeyTextPrimary"
#define JHThemeKeyTextSecondary @"JHThemeKeyTextSecondary"
#define JHThemeKeyNavigationBar @"JHThemeKeyNavigationBar"
#define JHThemeKeyNavigationBarText @"JHThemeKeyNavigationBarText"
#define JHThemeKeyDivider @"JHThemeKeyDivider"

@interface JHThemeManager : NSObject

+ (instancetype)sharedThemeManager;

- (NSString *)currentTheme;
- (void)addTheme;

- (UIColor *)colorForKey:(NSString *)key;

- (UIColor *)primary;
- (UIColor *)primaryLight;
- (UIColor *)primaryDark;
- (UIColor *)accent;
- (UIColor *)textPrimary;
- (UIColor *)textSecondary;
- (UIColor *)navigationBar;
- (UIColor *)navigationBarText;
- (UIColor *)divider;

@end
