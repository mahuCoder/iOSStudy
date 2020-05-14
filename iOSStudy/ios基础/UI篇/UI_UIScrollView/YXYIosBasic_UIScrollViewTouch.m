//
//  YXYIosBasic_UIScrollViewTouch.m
//  iOSStudy
//
//  Created by sunny on 2020/3/30.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIScrollViewTouch.h"

@interface YXYIosBasic_UIScrollViewTouch ()<UIScrollViewDelegate>
{
    
}
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UITextView *descTextView;


@end

@implementation YXYIosBasic_UIScrollViewTouch

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.pagingEnabled = YES;
    scrollView.frame = CGRectMake(50, 100, 300, 400);
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    UIImage *image = [UIImage imageNamed:@"example"];
    UIImageView *imageView = [[UIImageView  alloc] initWithImage:image];
    scrollView.contentSize = self.view.bounds.size;
    [scrollView addSubview:imageView];
    imageView.center = scrollView.center;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"滑动中");
}
///当开始滚动视图时，执行该方法。一次有效滑动（开始滑动，滑动一小段距离，只要手指不松开，只算一次滑动），只执行一次。
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"开始滚动");
}
///yo 滚动视图减速完成，滚动将停止时，调用该方法。一次有效滑动，只执行一次。
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"减速完成");
}
/// 滑动减速时调用该方法。
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"开始减速");
}
///滑动scrollView，并且手指离开时执行。一次有效滑动，只执行一次。
// 当pagingEnabled属性为YES时，不调用，该方法
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"滑动xxx");
}
/// 滑动视图，当手指离开屏幕那一霎那，调用该方法。一次有效滑动，只执行一次。
// decelerate,指代，当我们手指离开那一瞬后，视图是否还将继续向前滚动（一段距离）
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //当decelerate = yes（会有减速运动）时，继续执行开始减速---滑动---结束减速行为
    //为NO时（手势没有减速过程，直接离开），滑动结束
    NSLog(@"结束拖动");
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}
- (UITextView *)descTextView {
    if (!_descTextView) {
        _descTextView = [[UITextView alloc] init];
        _descTextView.font = FONT(12);
    }
    return _descTextView;
}
@end
