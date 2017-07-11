//
//  NewsNavigationController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NewsNavigationController.h"

#import "NewsPagerViewController.h"

@interface NewsNavigationController ()
@property (strong, nonatomic) NewsPagerViewController *pagerVC;
@end

@implementation NewsNavigationController

#pragma mark - Init Methods

- (instancetype)init {
    if (self = [super initWithRootViewController:self.pagerVC]) {
        
    }
    
    return self;
}

- (void)initAppearence {
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initAppearence];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter

- (NewsPagerViewController *)pagerVC {
    if (!_pagerVC) {
        _pagerVC = [[NewsPagerViewController alloc] init];
    }
    
    return _pagerVC;
}
@end
