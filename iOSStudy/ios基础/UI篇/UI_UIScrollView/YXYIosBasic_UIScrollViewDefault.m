//
//  YXYIosBasic_UIScrollViewDefault.m
//  iOSStudy
//
//  Created by sunny on 2020/3/30.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIScrollViewDefault.h"

@interface YXYIosBasic_UIScrollViewDefault ()

@property (nonatomic, assign)CGFloat top;

@end

@implementation YXYIosBasic_UIScrollViewDefault

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
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 40)];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"默认文本";
    [scrollView addSubview:descLabel];
    self.top += 70;
}
- (void)addSubScrollView_1 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(20, 100);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 40)];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"我可以y轴滚动";
    [scrollView addSubview:descLabel];
    self.top += 70;
}
- (void)addSubScrollView_2 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(350, 100);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 280, 40)];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"我可以x,y轴滚动";
    [scrollView addSubview:descLabel];
    self.top += 70;
}
- (void)addSubScrollView_3 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentSize = CGSizeMake(350, 100);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"我可以x,y轴滚动";
    [scrollView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
    }];
    self.top += 70;
}
- (void)addSubScrollView_4 {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, self.top, 300, 60)];
    scrollView.backgroundColor = UIColor.yellowColor;
    scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    scrollView.contentSize = CGSizeMake(350, 100);
    [self.view addSubview:scrollView];
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.backgroundColor = UIColor.greenColor;
    descLabel.text = @"我可以x,y轴滚动,有20内边距";
    [scrollView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
    }];
    self.top += 70;
}
- (void)addSubScrollView_5 {
//    ui
}
- (void)addSubScrollView_6 {
//    ui
}

@end
