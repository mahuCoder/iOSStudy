//
//  YXYIosBasic_UIScrollViewMove.m
//  iOSStudy
//
//  Created by sunny on 2020/3/30.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIScrollViewMove.h"

#import <IQKeyboardManager.h>


@interface YXYIosBasic_UIScrollViewMove ()

@property (nonatomic, assign)CGFloat top;

@end

@implementation YXYIosBasic_UIScrollViewMove
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = NO;//空白地方点击
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;//空白地方点击
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.top = 10;
    [self addSubScrollView_0];
    [self addSubScrollView_1];
    [self addSubScrollView_2];
    [self addSubScrollView_3];
    [self addSubScrollView_4];
    [self addSubScrollView_5];
    [self addSubScrollView_6];
    
}
- (void)addSubScrollView_0 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 400, 80)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(0, 120);
    [self.view addSubview:scrollView];
    UITextField *textF = [[UITextField alloc] init];
    textF.backgroundColor = UIColor.greenColor;
    textF.text = @"编辑我，拖拽时键盘隐藏（默认不隐藏）";
    [scrollView addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
    }];
    self.top += 90;
    //设置滚动条样式
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}
- (void)addSubScrollView_1 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 400, 80)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(0, 120);
    [self.view addSubview:scrollView];
    UITextField *textF = [[UITextField alloc] init];
    textF.backgroundColor = UIColor.greenColor;
    textF.text = @"编辑我拖拽时键盘不隐藏（默认不隐藏）";
    [scrollView addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
    }];
    self.top += 90;
    //设置滚动条样式
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeNone;
}
- (void)addSubScrollView_2 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 40)];
    scrollView.contentSize = CGSizeMake(1000, 20);
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"默认/关闭弹簧效果";
    [scrollView addSubview:descLabel];
    self.top += 70;
    
    
    scrollView.bounces = NO;
}
- (void)addSubScrollView_3 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(1000, 200);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 40)];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"👉便宜60";
    [scrollView addSubview:descLabel];
    self.top += 70;
    
    [scrollView setContentOffset:CGPointMake(-60, 0)];

}
- (void)addSubScrollView_4 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(1000, 200);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 600, 40)];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"我只能x或者y滚动";
    [scrollView addSubview:descLabel];
    self.top += 70;
    
    //只能同时滚动一个方向
    scrollView.directionalLockEnabled = YES;
}
- (void)addSubScrollView_5 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(1000, 200);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"我分页了";
    [scrollView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
    }];
    self.top += 70;
    
    scrollView.pagingEnabled = YES;
}
- (void)addSubScrollView_6 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(1000, 200);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"设置滚动条样式白色";
    [scrollView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
    }];
    self.top += 70;
    //设置滚动条样式
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}


@end
