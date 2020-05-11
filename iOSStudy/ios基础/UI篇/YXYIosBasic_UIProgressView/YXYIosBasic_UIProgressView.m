//
//  YXYIosBasic_UIProgressView.m
//  iOSStudy
//
//  Created by sunny on 2020/3/23.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIProgressView.h"

@interface YXYIosBasic_UIProgressView ()
@property (nonatomic, assign)CGFloat top;

@property (nonatomic, strong)UIProgressView *progressView;

@property (nonatomic, strong)UILabel *showLabel;

@property (nonatomic, strong)NSTimer *timer;
@end

@implementation YXYIosBasic_UIProgressView

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addProgressView_0];
    
    [self addProgressView_1];
    
    [self addProgressView_2];
    
    [self addProgressView_3];
    
    [self addProgressView_4];
}

- (void)addProgressView_0 {
    self.top = 20;
    UIProgressView *progressView = [[UIProgressView alloc] init];
    [self.view addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.top.offset(self.top);
        make.right.offset(-30);
    }];
    self.top += 50;
    progressView.progress = 0.8;
    UILabel *descLabeel = [[UILabel alloc] init];
    descLabeel.font = FONT(12);
    descLabeel.numberOfLines = 0;
    descLabeel.preferredMaxLayoutWidth = ScreenWidth - 30;
    descLabeel.text = @"UIProgressView是有2张imageView组合而成";
    [self.view addSubview:descLabeel];
    [descLabeel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(progressView.mas_bottom).offset(15);
    }] ;
}

- (void)addProgressView_1 {
    UIProgressView *progressView = [[UIProgressView alloc] init];
    [self.view addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.top.offset(self.top);
        make.right.offset(-30);
        make.height.equalTo(@80);
    }];
    progressView.backgroundColor = [UIColor yellowColor];
    progressView.progress = 0.6;
    [progressView setProgressTintColor:[UIColor redColor]];
    [progressView setTrackTintColor:[UIColor greenColor]];
    self.top += 100;
}

- (void)addProgressView_2 {
    UIProgressView *progressView = [[UIProgressView alloc] init];
    [self.view addSubview:progressView];
    
   
    UILabel *showLabel = [[UILabel alloc] init];
    showLabel.text = @"0%";
    [self.view addSubview:showLabel];
    self.showLabel = showLabel;
    [showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.top);;
    }];
    showLabel.font = FONT(12);
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(86);
        make.centerY.equalTo(showLabel);
        make.right.offset(-15);
    }];
    [progressView setProgressTintColor:[UIColor redColor]];
    self.progressView = progressView;
    self.top += 50;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runTime) userInfo:nil repeats:YES];
    self.timer = timer;
}
- (void)addProgressView_3 {
    UIProgressView *progressView = [[UIProgressView alloc] init];
    [self.view addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.size.mas_equalTo(CGSizeMake(200, 2));
        make.top.offset(self.top + 15 + 100);
    }];
    progressView.progress = 0.1;
    progressView.transform = CGAffineTransformMakeRotation(-M_PI_2);
//    self.top += 50;
}
- (void)addProgressView_4 {
    UIProgressView *progressView = [[UIProgressView alloc] init];
    [self.view addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-30);
        make.size.mas_equalTo(CGSizeMake(200, 2));
        make.top.offset(self.top + 15 + 100);
    }];
    progressView.progress = 0.1;
    progressView.transform = CGAffineTransformMakeRotation(M_PI_2);
//    self.top += 50;
}
- (void)runTime {
    CGFloat value = [self.progressView progress];
    if (value >= 0 && value < 1) {
        value += 0.01;
    }
    if (value <= 0) {
        value = 0;
    } else if (value >= 1) {
        value = 1;
    }
    CGFloat progress = value * 100;
    [self.progressView setProgress:value];
    self.showLabel.text = [NSString stringWithFormat:@"%.f%%", progress];
}
@end
