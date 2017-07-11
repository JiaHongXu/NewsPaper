//
//  BaseViewController.h
//  ChuangYeHuiApp
//
//  Created by 307A on 2016/12/20.
//  Copyright © 2016年 徐嘉宏. All rights reserved.
//

@interface JHViewController : UIViewController

typedef NS_ENUM(NSInteger , JHAlertType) {
    JHAlertTypeSuccess,
    JHAlertTypeWarning,
    JHAlertTypeError,
};

// show an alert hud with a single string of msg
- (void)showAlertWithMsg:(NSString *)msg Type:(JHAlertType)type;

// start an waiting hud (or waiting hud with msg)
- (void)startWaitingHud;
- (void)startWaitingHudWithMsg:(NSString *)msg;

// dissmiss hud
- (void)dismissHud;
- (void)dismissWithMsg:(NSString *)msg Type:(JHAlertType)type;


// override these methods to apply
- (void)didReceiveUserLogout:(NSNotification *)notification;
- (void)didReceiveUserLogin:(NSNotification *)notification ;
- (void)didRecieveThemeChange:(NSNotification *)notification;
@end
