//
//  JHSliderView.h
//  JHSilderView
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHSliderView : UIView

@property (assign, nonatomic) BOOL infinite;
@property (assign, nonatomic) BOOL autoPlay;
@property (assign, nonatomic) NSTimeInterval interval;

- (instancetype)initWithPlaceholderImage:(UIImage *)placeholder;

- (void)setTitles:(NSArray<NSString *> *)titles imgUrls:(NSArray<NSString *> *)imgUrls;
- (void)setTitles:(NSArray<NSString *> *)titles imgFiles:(NSArray<UIImage *> *)imgFiles;

@end
