//
//  MeMainViewController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/6/26.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "MeMainViewController.h"

@interface MeMainViewController ()

@end

@implementation MeMainViewController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Init Methods

- (void)initData {
    self.title = NSLocalizedString(@"MeMainTitle", nil);
}

#pragma mark - Getter

@end
