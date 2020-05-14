//
//  YXYIosBasic_UIScrollViewZoom.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/11.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIScrollViewZoom.h"

@interface YXYIosBasic_UIScrollViewZoom ()<UIScrollViewDelegate>


@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation YXYIosBasic_UIScrollViewZoom

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"缩放比例0.5-3";
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    UIImage *image = [UIImage imageNamed:@"example"];
    UIImageView *imageView = [[UIImageView  alloc] initWithImage:image];
    scrollView.contentSize = image.size;
    [scrollView addSubview:imageView];
    scrollView.maximumZoomScale = 3;
    scrollView.minimumZoomScale = 0.5;
//    scrollView.zom
//    scrollView.zoomScale = 2;
    imageView.center = scrollView.center;
    self.imageView = imageView;

}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
