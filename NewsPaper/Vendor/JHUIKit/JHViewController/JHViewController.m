//
//  JHViewController.m
//  ChuangYeHuiApp
//
//  Created by 307A on 2016/12/20.
//  Copyright © 2016年 徐嘉宏. All rights reserved.
//

#import "JHViewController.h"

static const NSTimeInterval interval = 1.5;

@interface JHViewController ()
@property (strong, nonatomic) MBProgressHUD *mbHub;
@end

@implementation JHViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initBaseData];
    [self initBaseView];
    [self registerBaseNotification];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)dealloc {
    [self unregisterBaseNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init Methods
- (void)initBaseData {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEdit)];
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)initBaseView {
//    self.view.backgroundColor = [JHTool colorWithHexStr:kEWColorBackgroundGrayLight];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Return", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)registerBaseNotification {
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self selector:@selector(didReceiveUserLogin:) name:kEWNotificationUserLogin object:nil];
//    [center addObserver:self selector:@selector(didReceiveUserLogout:) name:kEWNotificationUserLogout object:nil];
//    [center addObserver:self selector:@selector(didRecieveThemeChange:) name:kEWNotificationThemeChange object:nil];
}

- (void)unregisterBaseNotification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

#pragma mark - Public Methods

- (void)showAlertWithMsg:(NSString *)msg Type:(JHAlertType)type {
    UIImage *image;
    
    switch (type) {
        case JHAlertTypeSuccess:
            image = [[UIImage imageNamed:@"checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        case JHAlertTypeError:
            image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        case JHAlertTypeWarning:
            image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
            
        default:
            break;
    }
    
    self.mbHub.label.text = msg;
    self.mbHub.customView = [[UIImageView alloc] initWithImage:image];
    [self.mbHub hideAnimated:YES afterDelay:interval];
}

- (void)startWaitingHud {
    [self startWaitingHudWithMsg:@""];
}

- (void)startWaitingHudWithMsg:(NSString *)msg {
    _mbHub = nil;
    [self startWaitingHudWithMsg:msg];
}

- (void)dismissHud {
    [_mbHub hideAnimated:YES];
}

- (void)dismissWithMsg:(NSString *)msg Type:(JHAlertType)type {
    [self showAlertWithMsg:msg Type:type];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

#pragma mark - Private Methods
- (void)endEdit {
    [self.view endEditing:YES];
}

- (void)didReceiveUserLogout:(NSNotification *)notification {
    // override this method to apply
}

- (void)didReceiveUserLogin:(NSNotification *)notification {
    // override this method to apply
}

- (void)didRecieveThemeChange:(NSNotification *)notification {
    // override this method to apply
}

#pragma mark - Getter

- (MBProgressHUD *)mbHub {
    if (!_mbHub) {
        _mbHub = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
        // Looks a bit nicer if we make it square.
        _mbHub.square = YES;
    }
    
    return _mbHub;
}
@end
