//
//  ZeusViewController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "ZeusViewController.h"

#import "NewsNavigationController.h"
#import "MenuViewController.h"

@interface ZeusViewController ()

@property (strong, nonatomic) MenuViewController *menuVC;
@property (strong, nonatomic) NewsNavigationController *newsNaviVC;

@property (strong, nonatomic) UIView *mainView;
@property (assign, nonatomic) BOOL isMenuOpen;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@end

@implementation ZeusViewController

#pragma mark - Init Methods

- (instancetype)init {
    if (self = [super init]) {
        [self registerNotificationListener];
    }
    
    return self;
}

- (void)configView {
    [self addChildViewController:self.menuVC];
    [self addChildViewController:self.newsNaviVC];
    
    CGFloat menuWidth, menuHeight;
    menuWidth = CGRectGetWidth(self.view.bounds)*0.7;
    menuHeight = CGRectGetHeight(self.view.bounds);
    
    [self.view addSubview:_menuVC.view];
    _menuVC.view.frame = CGRectMake(-menuWidth, 0, menuWidth, menuHeight);
    
    [self.view addSubview:self.mainView];
    _mainView.frame = self.view.frame;
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    NSLog(@"zeus viewDidLoad");
    [super viewDidLoad];
    
    [self configView];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"zeus viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"zeus viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"zeus viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"zeus viewDidDisappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc {
    [self unregisterNotificationListener];
}

#pragma mark - Response Methods

- (void)fireMenuOpenClose {
    if (_isMenuOpen) {
        [self closeMenu];
    } else {
        [self openMenu];
    }
}

#pragma mark - Private Methods

- (void)openMenu {
    _isMenuOpen = YES;
    [_mainView addGestureRecognizer:self.tapGesture];
    [_mainView setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.mainView.center = CGPointMake(self.mainView.center.x+CGRectGetWidth(self.menuVC.view.frame), self.mainView.center.y);
        self.menuVC.view.center =CGPointMake(self.menuVC.view.center.x+CGRectGetWidth(self.menuVC.view.frame), self.menuVC.view.center.y);
    } completion:^(BOOL finished) {
        [_mainView setUserInteractionEnabled:YES];
    }];
}

- (void)closeMenu {
    _isMenuOpen = NO;
    [_mainView removeGestureRecognizer:self.tapGesture];
    _tapGesture = nil;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.mainView.center = CGPointMake(self.mainView.center.x-CGRectGetWidth(self.menuVC.view.frame), self.mainView.center.y);
        self.menuVC.view.center =CGPointMake(self.menuVC.view.center.x-CGRectGetWidth(self.menuVC.view.frame), self.menuVC.view.center.y);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Notifications

- (void)registerNotificationListener {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(fireMenuOpenClose) name:NPNotificationMenuShouldOpenClose object:nil];
}

- (void)unregisterNotificationListener {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

#pragma mark - Getter

- (MenuViewController *)menuVC {
    if (!_menuVC) {
        _menuVC = [[MenuViewController alloc] init];
    }
    
    return _menuVC;
}

- (NewsNavigationController *)newsNaviVC {
    if (!_newsNaviVC) {
        _newsNaviVC = [[NewsNavigationController alloc] init];
    }
    
    return _newsNaviVC;
}

- (UIView *)mainView {
    if (!_mainView) {
        _mainView = [[UIView alloc] init];
        [_mainView addSubview:self.newsNaviVC.view];
        _newsNaviVC.view.frame = _mainView.frame;
        [_mainView addSubview:_newsNaviVC.viewControllers.firstObject.view];
    }
    
    return _mainView;
}

- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenu)];
    }
    
    return _tapGesture;
}
@end
