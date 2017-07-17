//
//  RecommendBodyCell.h
//  NewsPaper
//
//  Created by Jiahong Xu on 2017/7/15.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArticleBean;

@interface NPNewsNormalBodyCell : UITableViewCell
@property (strong, nonatomic) ArticleBean *article;
@end

@interface NPNewsNormalDetailBodyCell : NPNewsNormalBodyCell

@end

@interface NPNewsNormalDetailNoPicBodyCell : NPNewsNormalBodyCell

@end

@interface NPNewsNormalLargePicBodyCell : NPNewsNormalBodyCell

@end

@interface NPNewsNormalMultiPicBodyCell : NPNewsNormalBodyCell

@end
