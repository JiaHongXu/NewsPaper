//
//  NewsPagerViewController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NewsPagerViewController.h"

#import "NewsFragmentController.h"

#import "NewsSourceModel.h"

@interface NewsPagerModel : NSObject

- (NewsFragmentController *)newsFragmentControllerAtIndex:(NSInteger)index;
- (NewsFragmentController *)newsFragmentControllerBeforeViewController:(NewsFragmentController *)viewController;
- (NewsFragmentController *)newsFragmentControllerAfterViewController:(NewsFragmentController *)viewController;

@end

@implementation NewsPagerModel
{
    NSArray<NewsSourceModel *> *_newsSourceArray;
    NSMutableArray<NewsFragmentController *> *_fragmentVCArray;
}

- (instancetype)init {
    if (self = [super init]) {
        _newsSourceArray = [NewsSourceModel newsSourceModels];
    }
    
    return self;
}

- (NewsFragmentController *)newsFragmentControllerAtIndex:(NSInteger)index {
    if (index >= 0 && index < _newsSourceArray.count) {
        if (!_fragmentVCArray) {
            _fragmentVCArray = [[NSMutableArray alloc] initWithCapacity:0];
            for (NewsSourceModel *model in _newsSourceArray) {
                [_fragmentVCArray addObject:[[NewsFragmentController alloc] initWithNewsSource:model]];
            }
        }
        return _fragmentVCArray[index];
    }
    return nil;
}

- (NewsFragmentController *)newsFragmentControllerBeforeViewController:(NewsFragmentController *)viewController {
    NSInteger index = [_fragmentVCArray indexOfObject:viewController];
    if (index == NSNotFound || index < 1) {
        return nil;
    } else {
        return _fragmentVCArray[index-1];
    }
}

- (NewsFragmentController *)newsFragmentControllerAfterViewController:(NewsFragmentController *)viewController {
    NSInteger index = [_fragmentVCArray indexOfObject:viewController];
    if (index == NSNotFound || index >= _fragmentVCArray.count-1) {
        return nil;
    } else {
        return _fragmentVCArray[index+1];
    }
}

@end


@interface NewsPagerViewController ()

@property (strong, nonatomic) UIBarButtonItem *leftMenuBarButton;
@property (strong, nonatomic) NewsPagerModel *pagerModel;

@end

@interface NewsPagerViewController (UIPageViewControllerDelegate) <UIPageViewControllerDelegate>
@end

@interface NewsPagerViewController (UIPageViewControllerDataSource) <UIPageViewControllerDataSource>
@end

@implementation NewsPagerViewController

#pragma mark - Init Methods

- (instancetype)init {
    if (self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                        navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                      options:nil]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerNotificationListener];
    }
    
    return self;
}

- (void)configView {
    [self.navigationItem setLeftBarButtonItem:self.leftMenuBarButton];
    [self setViewControllers:@[[self.pagerModel newsFragmentControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"pager viewDidLoad");
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc {
    [self unregisterNotificationListener];
}

#pragma mark - Notifications

- (void)registerNotificationListener {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(newsFragmentDidChange:) name:NPNotificationNewsFragmentDidChange object:nil];
}

- (void)unregisterNotificationListener {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

#pragma mark - Response Methods

- (void)onLeftMenuButtonClicked {
    [[NSNotificationCenter defaultCenter] postNotificationName:NPNotificationMenuShouldOpenClose object:nil];
}

- (void)newsFragmentDidChange:(NSNotification *)notification {
    self.title = (NSString *)notification.object;
}

#pragma mark - Getter

- (UIBarButtonItem *)leftMenuBarButton {
    if (!_leftMenuBarButton) {
        _leftMenuBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"category"] style:UIBarButtonItemStylePlain target:self action:@selector(onLeftMenuButtonClicked)];
    }
    
    return _leftMenuBarButton;
}

- (NewsPagerModel *)pagerModel {
    if (!_pagerModel) {
        _pagerModel = [[NewsPagerModel alloc] init];
    }
    
    return _pagerModel;
}

@end

@implementation NewsPagerViewController (UIPageViewControllerDelegate)



@end

@implementation NewsPagerViewController (UIPageViewControllerDataSource)

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    return [self.pagerModel newsFragmentControllerBeforeViewController:(NewsFragmentController *)viewController];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    return [self.pagerModel newsFragmentControllerAfterViewController:(NewsFragmentController *)viewController];
}
@end
