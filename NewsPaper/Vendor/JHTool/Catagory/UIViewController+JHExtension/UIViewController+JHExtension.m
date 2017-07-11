//
//  UIViewController+JHExtension.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/8.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "UIViewController+JHExtension.h"
#import <objc/runtime.h>

static const NSTimeInterval interval = 1.5;
static const void *mbHubKey = &mbHubKey;

@implementation UIViewController (JHExtension)

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
    if (!self.mbHub) {
        if (!self.view.window) {
            return;
        }
        self.mbHub = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
        // Looks a bit nicer if we make it square.
        self.mbHub.square = YES;
    }
    self.mbHub.label.text = msg;
    self.mbHub.customView = [[UIImageView alloc] initWithImage:image];
    [self.mbHub hideAnimated:YES afterDelay:interval];
}

- (void)startWaitingHud {
    [self startWaitingHudWithMsg:@""];
}

- (void)startWaitingHudWithMsg:(NSString *)msg {
    if (!self.view.window) {
        return;
    }
    self.mbHub = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
    self.mbHub.square = YES;
    self.mbHub.label.text = msg;
}

- (void)dismissHud {
    [self.mbHub hideAnimated:YES];
}

- (void)dismissWithMsg:(NSString *)msg Type:(JHAlertType)type {
    [self showAlertWithMsg:msg Type:type];
}

#pragma mark - Getter

- (MBProgressHUD *)mbHub {
    return objc_getAssociatedObject(self, mbHubKey);
}

- (void)setMbHub:(NSString *)mbHub {
    objc_setAssociatedObject(self, mbHubKey, mbHub, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
