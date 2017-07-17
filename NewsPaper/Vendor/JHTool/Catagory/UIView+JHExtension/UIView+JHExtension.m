//
//  UIView+JHExtension.m
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "UIView+JHExtension.h"

@implementation UIView (JHExtension)

#pragma mark - Getter

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (CGFloat)left {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)top {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)centerX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)centerY {
    return CGRectGetMidY(self.frame);
}

#pragma mark - Setter

- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (void)setLeft:(CGFloat)left {
    CGRect rect = self.frame;
    CGFloat right = self.right;
    rect.origin.x = left;
    rect.size.width = right - left;
    self.frame = rect;
}

- (void)setRight:(CGFloat)right {
    CGRect rect = self.frame;
    CGFloat left = self.left;
    rect.size.width = right - left;
    self.frame = rect;
}

- (void)setTop:(CGFloat)top {
    CGRect rect = self.frame;
    CGFloat bottom = self.bottom;
    rect.origin.y = top;
    rect.size.height = top - bottom;
    self.frame = rect;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect rect = self.frame;
    CGFloat top = self.top;
    rect.size.height = top - bottom;
    self.frame = rect;
}

- (void)setCenterX:(CGFloat)centerX {
    CGRect rect = self.frame;
    rect.origin.x = centerX - self.width/2;
    self.frame = rect;
}

- (void)setCenterY:(CGFloat)centerY {
    CGRect rect = self.frame;
    rect.origin.y = centerY - self.height/2;
    self.frame = rect;
}

@end
