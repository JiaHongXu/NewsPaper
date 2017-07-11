//
//  NewsFragmentController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NewsFragmentController.h"

#import "NewsSourceModel.h"

#import "UIViewController+JHExtension.h"

#define kTableViewCellIdentifier @"cellId"

@interface NewsFragmentController () <UIScrollViewDelegate>
@property (strong, nonatomic) NewsSourceModel *newsSource;
@end

@implementation NewsFragmentController

#pragma mark - Init Methods

- (instancetype)initWithNewsSource:(NewsSourceModel *)newsSource {
    if (self = [super init]) {
        _newsSource = newsSource;
        
        WS(ws);
        [_newsSource setBlockWithReturnBlock:^(NSString *successMsg) {
            [ws.refreshControl endRefreshing];
        } WithFailureBlock:^(NSString *failureMsg) {
            [ws.refreshControl endRefreshing];
        } WithErrorBlock:^(NSString *errorMsg) {
            [ws.refreshControl endRefreshing];
        }];
    }
    
    return self;
}

- (void)configView {
    self.clearsSelectionOnViewWillAppear = YES;
    [self.tableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [JHThemeManager sharedThemeManager].accent;
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新" attributes:@{NSForegroundColorAttributeName:[JHThemeManager sharedThemeManager].accent}];
    [self.refreshControl addTarget:self.newsSource action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    [self.newsSource refresh];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifier];
}

- (void)viewDidAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] postNotificationName:NPNotificationNewsFragmentDidChange object:self.title];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewCellIdentifier];
    }
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate


#pragma mark - Getter

- (NSString *)title {
    return _newsSource.title;
}

@end
