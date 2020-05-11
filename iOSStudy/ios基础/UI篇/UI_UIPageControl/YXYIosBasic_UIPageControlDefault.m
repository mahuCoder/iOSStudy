//
//  YXYIosBasic_UIPageControlDefault.m
//  iOSStudy
//
//  Created by sunny on 2020/3/24.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIPageControlDefault.h"

@interface YXYIosBasic_UIPageControlDefault ()
{
    
}
@property (nonatomic, assign) CGFloat top;
@end

@implementation YXYIosBasic_UIPageControlDefault

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.top = 15;
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.numberOfLines = 0;
    descLabel.font = FONT(12);
    descLabel.text = @"pageControl点击左右相当于左右事件，当numberOfpages=0时自动隐藏，hidesForSinglePage=yes时只有一个也隐藏";
    descLabel.preferredMaxLayoutWidth = ScreenWidth - 30;
    [self.view addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.top);
    }];
    self.top += 40;
    
    [self addPageControl_0];
    
    [self addPageControl_1];
    //数量位1时隐藏
    [self addPageControl_2];
    //改变颜色
    [self addPageControl_3];
    //不自动更新类型
    [self addPageControl_4];
}
- (void)actionChangePage:(UIPageControl *)sender {
    NSInteger index = sender.currentPage;
    [ToastManager showToast:[NSString stringWithFormat:@"点击的是第%ld个",index]];
}
- (void)addPageControl_0 {
    UIPageControl *pageC = [[UIPageControl alloc] init];
    pageC.backgroundColor = HEXCOLOR(0x999999);
    [self.view addSubview:pageC];
    pageC.numberOfPages = 5;
    [pageC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(self.top);
    }];
    [pageC addTarget:self action:@selector(actionChangePage:) forControlEvents:(UIControlEventValueChanged)];
    self.top += 40;
}
- (void)addPageControl_1 {
    UIPageControl *pageC = [[UIPageControl alloc] init];
    pageC.backgroundColor = HEXCOLOR(0x999999);
    [self.view addSubview:pageC];
    pageC.numberOfPages = 0;
    [pageC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
//        make.right.offset(0);
        make.top.offset(self.top);
    }];
    [pageC addTarget:self action:@selector(actionChangePage:) forControlEvents:(UIControlEventValueChanged)];
    self.top += 40;
}
- (void)addPageControl_2 {
    UIPageControl *pageC = [[UIPageControl alloc] init];
    pageC.backgroundColor = HEXCOLOR(0x999999);
    [self.view addSubview:pageC];
    pageC.numberOfPages = 1;
    //当一个是也选中隐藏
    pageC.hidesForSinglePage = YES;
    [pageC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.size.mas_equalTo(CGSizeMake(200, 20));
        make.top.offset(self.top);
    }];
    [pageC addTarget:self action:@selector(actionChangePage:) forControlEvents:(UIControlEventValueChanged)];
    self.top += 40;
}
- (void)addPageControl_3 {
    UIPageControl *pageC = [[UIPageControl alloc] init];
//    pageC.backgroundColor = HEXCOLOR(0x999999);
    //设置选中颜色
    pageC.currentPageIndicatorTintColor = [UIColor redColor];
    //设置非选中颜色
    pageC.pageIndicatorTintColor = [UIColor greenColor];
    [self.view addSubview:pageC];
    pageC.numberOfPages = 5;
    [pageC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(self.top);
    }];
    [pageC addTarget:self action:@selector(actionChangePage:) forControlEvents:(UIControlEventValueChanged)];
    self.top += 40;
}
- (void)addPageControl_4 {
    UIPageControl *pageC = [[UIPageControl alloc] init];
//    pageC.backgroundColor = HEXCOLOR(0x999999);
    //设置选中颜色
    pageC.currentPageIndicatorTintColor = [UIColor redColor];
    //设置非选中颜色
    pageC.pageIndicatorTintColor = [UIColor greenColor];
    //不自动更新,需要手动调用    [pageC updateCurrentPageDisplay];
    pageC.defersCurrentPageDisplay = YES;

    [self.view addSubview:pageC];
    pageC.numberOfPages = 5;
    [pageC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(self.top);
    }];
    [pageC addTarget:self action:@selector(actionChangePage:) forControlEvents:(UIControlEventValueChanged)];
    self.top += 40;
}


@end
