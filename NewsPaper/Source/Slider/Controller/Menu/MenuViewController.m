//
//  MenuViewController.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/7.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "MenuViewController.h"

#import "NPCellFactory.h"

@interface MenuViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *dataSource;
@property (nonatomic, strong) NSArray<NSString *> *options;
@end

@implementation MenuViewController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}

- (void)configView {
    self.view.backgroundColor = [JHThemeManager sharedThemeManager].accent;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.menuTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 16, 0, 16));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:NPNotificationMenuShouldOpenClose object:nil];
    
    if (indexPath.section==0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NPNotificationNewsFragmentShouldChange object:@(indexPath.row)];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    cell = [NPCellFactory configCellForTableView:tableView type:NPCellTypeNone indexPath:indexPath config:^(UITableViewCell *cell) {
        cell.textLabel.text = self.dataSource[indexPath.section][indexPath.row];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"";
    switch (section) {
        case 0:
            title = @"CATAGORY";
            break;
        case 1:
            title = @"OPTIONS";
            break;
            
        default:
            break;
    }
    
    return title;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)view;
    headerView.textLabel.textColor = [UIColor whiteColor];
    headerView.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
}

#pragma mark - Getter

- (UITableView *)menuTableView {
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _menuTableView.dataSource = self;
        _menuTableView.delegate = self;
        _menuTableView.backgroundColor = [UIColor clearColor];
        _menuTableView.showsVerticalScrollIndicator = NO;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _menuTableView.bounces = NO;
        
        [self.view addSubview:_menuTableView];
    }
    
    return _menuTableView;
}

- (NSArray<NSArray<NSString *> *> *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@[@"Recommand",
                          @"Editor's Pick",
                          @"Audio",
                          @"Opinion",
                          @"China",
                          @"World",
                          @"Bussiness",
                          @"Sport",
                          @"Life Style",
                          @"Tech",
                          //@"Special",
                          @"Photo",
                          @"Video"],
                        @[@"SETTING", @"LOGIN"]];
    }
    
    return _dataSource;
}

@end
