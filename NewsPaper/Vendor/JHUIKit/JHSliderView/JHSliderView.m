//
//  JHSliderView.m
//  JHSilderView
//
//  Created by Jiahong Xu on 2017/7/9.
//  Copyright © 2017年 Jiahong Xu. All rights reserved.
//

#import "JHSliderView.h"

@interface JHSliderViewBean : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imgUrl;
@property (strong, nonatomic) UIImage *imgFile;

+ (NSArray<JHSliderViewBean *> *)sliderBeansWithTitles:(NSArray<NSString *> *)titles imgUrls:(NSArray<NSString *> *)imgUrls;
+ (NSArray<JHSliderViewBean *> *)sliderBeansWithTitles:(NSArray<NSString *> *)titles imgFiles:(NSArray<UIImage *> *)imgFiles;

@end

@implementation JHSliderViewBean

#pragma mark - Class Methods

+ (NSArray<JHSliderViewBean *> *)sliderBeansWithTitles:(NSArray<NSString *> *)titles imgUrls:(NSArray<NSString *> *)imgUrls {
    if (!titles || !imgUrls || titles.count != imgUrls.count) {
        return nil;
    }
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger index = 0; index < titles.count; index++) {
        [array addObject:[[JHSliderViewBean alloc] initWithTitle:titles[index] imgUrl:imgUrls[index]]];
    }
    
    return [array copy];
}

+(NSArray<JHSliderViewBean *> *)sliderBeansWithTitles:(NSArray<NSString *> *)titles imgFiles:(NSArray<UIImage *> *)imgFiles {
    if (!titles || !imgFiles || titles.count != imgFiles.count) {
        return nil;
    }
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger index = 0; index < titles.count; index++) {
        [array addObject:[[JHSliderViewBean alloc] initWithTitle:titles[index] imgFile:imgFiles[index]]];
    }
    
    return [array copy];
}

#pragma mark - Init Methods

- (instancetype)initWithTitle:(NSString *)title imgUrl:(NSString *)imgUrl {
    if (self = [super init]) {
        _title = title;
        _imgUrl = imgUrl;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title imgFile:(UIImage *)imgFile {
    if (self = [super init]) {
        _title = title;
        _imgFile = imgFile;
    }
    
    return self;
}

@end

@interface JHSliderViewCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) JHSliderViewBean *sliderBean;
@property (strong, nonatomic) UIImage *placeholder;

- (instancetype)initWithPlaceholder:(UIImage *)placeholder;

@end

@implementation JHSliderViewCell

#pragma mark - Init Methods

- (instancetype)init {
    if (self = [self initWithPlaceholder:nil]) {
        
    }
    
    return self;
}

- (instancetype)initWithPlaceholder:(UIImage *)placeholder {
    if (self = [self init]) {
        _placeholder = placeholder;
        [self setNeedsLayout];
    }
    
    return self;
}

#pragma mark - Override Methods

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = CGRectGetHeight(self.frame), width = CGRectGetWidth(self.frame);
    self.imgView.frame = CGRectMake(0, 0, width, height);
    self.bottomView.frame = CGRectMake(0, 0.8*height, width, 0.2*height);
    self.titleLabel.center = self.bottomView.center;
    self.titleLabel.frame =  CGRectMake(0, 0, 0.8*width, 0.2*height);
    self.titleLabel.preferredMaxLayoutWidth = width*0.8;
}

#pragma mark - Getter

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        [_imgView setContentMode:UIViewContentModeScaleAspectFill];
        [_imgView setClipsToBounds:YES];
        [self addSubview:_imgView];
    }
    
    return _imgView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.bottomView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

#pragma mark - Setter

- (void)setSliderBean:(JHSliderViewBean *)sliderBean {
    _sliderBean = sliderBean;
    self.titleLabel.text = _sliderBean.title;
    _sliderBean.imgUrl ? [self.imgView sd_setImageWithURL:[NSURL URLWithString:_sliderBean.imgUrl] placeholderImage:_placeholder] : [self.imgView setImage:_sliderBean.imgFile];
}

@end

@interface JHSliderViewLayout : UICollectionViewFlowLayout

@end

@implementation JHSliderViewLayout

- (instancetype)init {
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.minimumLineSpacing = CGFLOAT_MIN;
    }
    
    return self;
}


#pragma mark - Override Methods

@end

@interface JHSliderView () <UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UIImage *placeholder;
@property (assign, nonatomic) BOOL isWebImgs;
@property (strong, nonatomic) NSArray<JHSliderViewBean *> *sliderBeans;

@end

#define kJHSliderCellIdentifier @"kJHSliderCellIdentifier"

@implementation JHSliderView

#pragma mark - Init Methods

- (instancetype)initWithPlaceholderImage:(UIImage *)placeholder {
    if (self = [self initWithFrame:CGRectZero placeholder:placeholder]) {
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame placeholder:(UIImage *)placeholder {
    if (self = [super init]) {
        _placeholder = placeholder;
        [self config];
        [self setNeedsLayout];
    }
    
    return self;
}

- (instancetype)init {
    if (self = [self initWithFrame:CGRectZero placeholder:nil]) {
        
    }
    
    return self;
}

- (void)config {
    _infinite = NO;
    _autoPlay = YES;
    _isWebImgs = YES;
    _interval = 5;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_interval target:self selector:@selector(moveNext) userInfo:nil repeats:_autoPlay];
}

#pragma mark - Private Methods

- (void)moveNext {
    NSInteger page = self.pageControl.currentPage;
    NSInteger resourcesCount = _isWebImgs ? _sliderBeans.count : _sliderBeans.count;
    if (page<resourcesCount-1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:page+1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        self.pageControl.currentPage = page+1;
    } else {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        self.pageControl.currentPage = 0;
    }
}

#pragma mark - Response Methods

- (void)onPageControlValueChange:(id)sender {
    NSInteger page = self.pageControl.currentPage;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:page inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - Override Methods

- (void)layoutSubviews {
    ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout).itemSize = self.frame.size;
    CGFloat width = CGRectGetWidth(self.frame), height = CGRectGetHeight(self.frame);
    self.pageControl.frame = CGRectMake(0, height-20-10, width, 20);
    self.collectionView.frame = CGRectMake(0, 0, width, height);
}

- (void)viewDidLayoutSubviews{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[JHSliderViewLayout class]]) {
        ((JHSliderViewLayout *)self.collectionView.collectionViewLayout).itemSize = self.bounds.size;
    }
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.pageControl.numberOfPages = _sliderBeans.count;
    return _sliderBeans.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JHSliderViewCell *sliderCell = [collectionView dequeueReusableCellWithReuseIdentifier:kJHSliderCellIdentifier forIndexPath:indexPath];
    
    if (!sliderCell) {
        sliderCell = [[JHSliderViewCell alloc] init];
    }
    
    sliderCell.placeholder = _placeholder;
    sliderCell.sliderBean = _sliderBeans[indexPath.row];
    
    return sliderCell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

#pragma mark - Setter

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (void)setTitles:(NSArray<NSString *> *)titles imgUrls:(NSArray<NSString *> *)imgUrls {
    if (!titles || !imgUrls || titles.count != imgUrls.count) {
        return;
    }
    _isWebImgs = YES;
    _sliderBeans = [JHSliderViewBean sliderBeansWithTitles:titles imgUrls:imgUrls];
    [self.collectionView reloadData];
}

- (void)setTitles:(NSArray<NSString *> *)titles imgFiles:(NSArray<UIImage *> *)imgFiles {
    if (!titles || !imgFiles || titles.count != imgFiles.count) {
        return;
    }
    _isWebImgs = NO;
    _sliderBeans = [JHSliderViewBean sliderBeansWithTitles:titles imgFiles:imgFiles];
    [self.collectionView reloadData];
}

#pragma mark - Getter

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:1.0 alpha:0.5];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithWhite:1.0 alpha:1];
        _pageControl.currentPage = 0;
        [_pageControl addTarget:self action:@selector(onPageControlValueChange:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_pageControl];
    }
    
    return _pageControl;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) collectionViewLayout:[[JHSliderViewLayout alloc] init]];
        [_collectionView registerClass:[JHSliderViewCell class] forCellWithReuseIdentifier:kJHSliderCellIdentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
        [self addSubview:_collectionView];
    }
    
    return _collectionView;
}

@end
