//
//  JHThemeManager.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/8.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "JHThemeManager.h"

static JHThemeManager *manager;

@interface JHThemeManager ()
@property (strong, nonatomic) NSMutableDictionary *themeStorage;
@property (strong, nonatomic) NSDictionary *current;
@end

@implementation JHThemeManager

#pragma mark - Singleton

+ (instancetype)sharedThemeManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[JHThemeManager alloc] init];
    });
    
    return manager;
}

#pragma mark - Init Methods

- (instancetype)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

#pragma mark - Public Methods

- (void)addTheme {
    
}

- (NSString *)currentTheme {
    return [self.current objectForKey:@"themeName"];
}

- (UIColor *)colorForKey:(NSString *)key {
    return [JHTool colorWithHexStr:self.current[key]];
}

- (UIColor *)primary {
    return [self colorForKey:JHThemeKeyPrimary];
}

- (UIColor *)primaryLight {
    return [self colorForKey:JHThemeKeyPrimaryLight];
}

- (UIColor *)primaryDark {
    return [self colorForKey:JHThemeKeyPrimaryDark];
}

- (UIColor *)accent {
    return [self colorForKey:JHThemeKeyAccent];
}

- (UIColor *)textPrimary {
    return [self colorForKey:JHThemeKeyTextPrimary];
}

- (UIColor *)textSecondary {
    return [self colorForKey:JHThemeKeyTextSecondary];
}

- (UIColor *)navigationBar {
    return [self colorForKey:JHThemeKeyNavigationBar];
}

- (UIColor *)navigationBarText {
    return [self colorForKey:JHThemeKeyNavigationBarText];
}

- (UIColor *)divider {
    return [self colorForKey:JHThemeKeyDivider];
}

#pragma mark - Getter

- (NSMutableDictionary *)themeStorage {
    if (!_themeStorage) {
        _themeStorage = [[NSMutableDictionary alloc] initWithCapacity:0];
        
        [_themeStorage setObject:@{@"themeName":JHThemeDefaultLight,
                                   JHThemeKeyPrimary:@"#FFFFFF",
                                   JHThemeKeyPrimaryLight:@"#FFFFFF",
                                   JHThemeKeyPrimaryDark:@"#FFFFFF",
                                   JHThemeKeyAccent:@"#DD7972",
                                   JHThemeKeyTextPrimary:@"#212121",
                                   JHThemeKeyTextSecondary:@"#757575",
                                   JHThemeKeyNavigationBar:@"#FFFFFF",
                                   JHThemeKeyNavigationBarText:@"#DD7972",
                                   JHThemeKeyDivider:@"#BDBDBD"
                                   }
                          forKey:JHThemeDefaultLight];
    }
    
    return _themeStorage;
}

- (NSDictionary *)current {
    if (!_current) {
        _current = self.themeStorage[JHThemeDefaultLight];
    }
    
    return _current;
}
@end
