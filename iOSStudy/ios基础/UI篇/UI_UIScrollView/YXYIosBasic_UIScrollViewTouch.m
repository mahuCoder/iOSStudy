//
//  YXYIosBasic_UIScrollViewTouch.m
//  iOSStudy
//
//  Created by sunny on 2020/3/30.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIScrollViewTouch.h"

@interface YXYIosBasic_UIScrollViewTouch ()
{
    
}
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UITextView *descTextView;


@end

@implementation YXYIosBasic_UIScrollViewTouch

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[]];
//    
//    [self.view addSubview:self.scrollView];
    
    
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
