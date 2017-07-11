//
//  MainNavigationController.m
//  ZhiFeiUser
//
//  Created by 307A on 2016/12/22.
//  Copyright © 2016年 徐嘉宏. All rights reserved.
//

#import "JHNavigationController.h"

@interface JHNavigationController ()

@end

@implementation JHNavigationController

#pragma mark - Initialize
+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setTintColor:[JHThemeManager sharedThemeManager].accent];
//    [navigationBar setBarTintColor:[JHThemeManager sharedThemeManager].navigationBar];
    [navigationBar setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName:[JHThemeManager sharedThemeManager].navigationBarText,
                                            NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2],
                                            }];
}

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override Methods


@end
