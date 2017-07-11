//
//  MeNavigationController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/6/25.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "MeNavigationController.h"

#import "MeMainViewController.h"

@interface MeNavigationController ()
@property (nonatomic, strong) MeMainViewController *meMainVC;
@end

@implementation MeNavigationController

#pragma mark - Init Methods

- (instancetype)init {
    if (self = [super initWithRootViewController:self.meMainVC]) {
        
    }
    
    return self;
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Getter

- (MeMainViewController *)meMainVC {
    if (!_meMainVC) {
        _meMainVC = [[MeMainViewController alloc] init];
    }
    
    return _meMainVC;
}

@end
