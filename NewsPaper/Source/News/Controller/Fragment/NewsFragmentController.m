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

#import "NPCellFactory.h"
#import "NPNewsRecommendHeaderCell.h"
#import "NPNewsRecommendBodyCell.h"
#import "NPNewsArticleHeaderCell.h"
#import "NPNewsArticleBodyCell.h"

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
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 8, 0, 8)];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.estimatedRowHeight = 130;
    
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
}

- (void)viewDidAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] postNotificationName:NPNotificationNewsFragmentDidChange object:self.title];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
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
        switch (recommend.type) {
            case RecommendTypeHeader:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeRecommendHeader indexPath:indexPath config:^(UITableViewCell *cell) {
                    ((NPNewsRecommendHeaderCell *)cell).recommend = recommend;
                }];
            }
                break;
            case RecommendTypeLargePicture:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeRecommendLargePic indexPath:indexPath config:^(UITableViewCell *cell) {
                    ((NPNewsRecommendLargePicBodyCell *)cell).recommend = recommend;
                }];
            }
                break;
            case RecommendTypeDetail:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeRecommendDetail indexPath:indexPath config:^(UITableViewCell *cell) {
                    ((NPNewsRecommendDetailBodyCell *)cell).recommend = recommend;
                }];
            }
                break;
            case RecommendTypeMultiPicture:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeRecommendMultiPic indexPath:indexPath config:^(UITableViewCell *cell) {
                    ((NPNewsRecommendMultiPicBodyCell *)cell).recommend = recommend;
                }];
            }
            default:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeNone indexPath:indexPath config:^(UITableViewCell *cell) {
                    
                }];
            }
                break;
        }
    } else {
        ArticleBean *article = [_newsSource sourceAtIndex:indexPath.row];
        switch (article.type) {
            case ArticleTypeHeader:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeArticleHeader indexPath:indexPath config:^(UITableViewCell *cell) {
                    ((NPNewsArticleHeaderCell *)cell).article = article;
                }];
            }
                break;
            case ArticleTypeLargePicture:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeArticleLargePic indexPath:indexPath config:^(UITableViewCell *cell) {
                    ((NPNewsArticleLargePicBodyCell *)cell).article = article;
                }];
            }
                break;
            case ArticleTypeDetail:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeArticleDetail indexPath:indexPath config:^(UITableViewCell *cell) {
                    ((NPNewsArticleDetailBodyCell *)cell).article = article;
                }];
            }
                break;
            default:
            {
                cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeNone indexPath:indexPath config:^(UITableViewCell *cell) {
                    
                }];
            }
                break;
        }
    }
    return cell;
}

#pragma mark - UIScrollViewDelegate


#pragma mark - Getter

- (NSString *)title {
    return _newsSource.title;
}

@end
