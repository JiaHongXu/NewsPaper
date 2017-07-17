//
//  RecommendBodyCell.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RecommendBean;

@interface NPNewsRecommendBodyCell : UITableViewCell
@property (strong, nonatomic) RecommendBean *recommend;
@end

@interface NPNewsRecommendDetailBodyCell : NPNewsRecommendBodyCell

@end

@interface NPNewsRecommendDetailNoPicBodyCell : NPNewsRecommendBodyCell

@end

@interface NPNewsRecommendLargePicBodyCell : NPNewsRecommendBodyCell

@end

@interface NPNewsRecommendMultiPicBodyCell : NPNewsRecommendBodyCell

@end
