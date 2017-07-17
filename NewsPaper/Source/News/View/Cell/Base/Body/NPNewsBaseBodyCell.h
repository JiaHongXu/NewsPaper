//
//  NPNewsBaseBodyCell.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/18.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NPNewsBaseBodyCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *catagoryLabel;
@property (strong, nonatomic) UILabel *timeLabel;

- (void)initConstraints;

@end
