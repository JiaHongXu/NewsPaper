//
//  NewsFragmentController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "NewsFragmentController.h"
#import "NewsSourceModel.h"
#import "RecommendBean.h"
#import "ArticleBean.h"
#import "UIViewController+JHExtension.h"
#import "RecommendSliderCell.h"

#define kTableViewCellIdentifier @[@"sliderCellId", @"test", @"test", @"test", @"test", @"test"]

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
            [ws.tableView reloadData];
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
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh" attributes:@{NSForegroundColorAttributeName:[JHThemeManager sharedThemeManager].accent}];
    [self.refreshControl addTarget:self.newsSource action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
}

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    [self.newsSource refresh];
    [self.tableView registerClass:[RecommendSliderCell class] forCellReuseIdentifier:kTableViewCellIdentifier[0]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellIdentifier[1]];
}

- (void)viewDidAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] postNotificationName:NPNotificationNewsFragmentDidChange object:self.title];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return CGRectGetWidth(self.view.frame)*0.625;
    } else {
        return 100;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (self.newsSource.type == NewsSourceTypeRecommand) {
        RecommendBean *recommend = [((RecommandSourceModel *)_newsSource) sourceAtIndex:indexPath.row];
        [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier[recommend.type]];
        if (!cell) {
            switch (recommend.type) {
                case RecommendTypeSlider:
                    cell = [[RecommendSliderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewCellIdentifier[recommend.type]];
                    break;
                    
                default:
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewCellIdentifier[recommend.type]];
                    break;
            }
        }
        switch (recommend.type) {
            case RecommendTypeSlider:
                ((RecommendSliderCell *)cell).recommend = recommend;
                break;
                
            default:
                
                break;
        }
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier[1] forIndexPath:indexPath];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kTableViewCellIdentifier[1]];
        }
        
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}

#pragma mark - UIScrollViewDelegate


#pragma mark - Getter

- (NSString *)title {
    return _newsSource.title;
}

@end
