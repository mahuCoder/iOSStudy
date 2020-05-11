//
//  YXYIosBasic_UISliderVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/23.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UISliderVC.h"

@interface YXYIosBasic_UISliderVC ()

@property (nonatomic, assign)CGFloat top;

@property (nonatomic, strong)UISlider *slider;

@property (nonatomic, strong)UILabel *showLabel;

@property (nonatomic, strong)NSTimer *timer;



@end

@implementation YXYIosBasic_UISliderVC
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSlider_0];
    
    [self addSlider_1];
    
    [self addSlider_2];
    
    [self addSlider_3];
    
    [self addSlider_4];
}

- (void)addSlider_0 {
    self.top = 20;
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.top.offset(self.top);
        make.right.offset(-30);
    }];
    self.top += 50;
}

- (void)addSlider_1 {
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.top.offset(self.top);
        make.right.offset(-30);
        make.height.equalTo(@80);
    }];
    slider.backgroundColor = [UIColor yellowColor];
    //设置最小值
    [slider setMinimumValue:-100];
    //设置最大值
    [slider setMaximumValue:100];
    //设置最小值图片
    [slider setMinimumValueImage:[UIImage imageNamed:@"aliLive_skin_unselect"]];
    [slider setMaximumValueImage:[UIImage imageNamed:@"aliLive_skin"]];
    //设置滑块图片
    [slider setThumbImage:[UIImage imageNamed:@"aliLive_microphone_unselect"] forState:(UIControlStateNormal)];
    //设置滑动条左右颜色
    [slider setMinimumTrackTintColor:[UIColor greenColor]];
    [slider setMaximumTrackTintColor:[UIColor blackColor]];
    self.top += 100;
}

- (void)addSlider_2 {
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    
    //设置最小值
    [slider setMinimumValue:0];
    //设置最大值
    [slider setMaximumValue:3600];
    //设置滑块图片
    [slider setThumbTintColor:[UIColor redColor]];
    //设置滑动条左右颜色
    [slider setMinimumTrackTintColor:[UIColor greenColor]];
    [slider setMaximumTrackTintColor:[UIColor blackColor]];
//    slider
    UILabel *showLabel = [[UILabel alloc] init];
    showLabel.text = @"00:00/60:00";
//    UIButton *leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [leftBtn addTarget:self action:@selector(actionLeft) forControlEvents:(UIControlEventTouchUpInside)];
//    UIButton *rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [rightBtn addTarget:self action:@selector(actionRight) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:showLabel];
    self.showLabel = showLabel;
    [showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.top);;
    }];
    showLabel.font = FONT(12);
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(86);
        make.centerY.equalTo(showLabel);
        make.right.offset(-15);
    }];
    self.slider = slider;
    self.top += 50;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runTime) userInfo:nil repeats:YES];
    self.timer = timer;
}
- (void)addSlider_3 {
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.size.mas_equalTo(CGSizeMake(200, 30));
        make.top.offset(self.top + 15 + 100);
    }];
    //设置最小值
    [slider setMinimumValue:-100];
    //设置最大值
    [slider setMaximumValue:100];
    //设置最小值图片
    [slider setMinimumValueImage:[UIImage imageNamed:@"aliLive_skin_unselect"]];
    [slider setMaximumValueImage:[UIImage imageNamed:@"aliLive_skin"]];
    //设置滑块图片
    [slider setThumbImage:[UIImage imageNamed:@"aliLive_microphone_unselect"] forState:(UIControlStateNormal)];
    //设置滑动条左右颜色
    [slider setMinimumTrackTintColor:[UIColor greenColor]];
    [slider setMaximumTrackTintColor:[UIColor blackColor]];
    slider.transform = CGAffineTransformMakeRotation(-M_PI_2);
//    self.top += 50;
}
- (void)addSlider_4 {
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-30);
        make.size.mas_equalTo(CGSizeMake(200, 30));
        make.top.offset(self.top + 15 + 100);
    }];
    //设置最小值
    [slider setMinimumValue:-100];
    //设置最大值
    [slider setMaximumValue:100];
    //设置最小值图片
    [slider setMinimumValueImage:[UIImage imageNamed:@"aliLive_skin_unselect"]];
    [slider setMaximumValueImage:[UIImage imageNamed:@"aliLive_skin"]];
    //设置滑块图片
    [slider setThumbImage:[UIImage imageNamed:@"aliLive_microphone_unselect"] forState:(UIControlStateNormal)];
    //设置滑动条左右颜色
    [slider setMinimumTrackTintColor:[UIColor greenColor]];
    [slider setMaximumTrackTintColor:[UIColor blackColor]];
    slider.transform = CGAffineTransformMakeRotation(M_PI_2);
//    self.top += 50;
}
- (void)runTime {
    CGFloat value = [self.slider value];
    if (value >= 0 && value < 3600) {
        value += 1;
    }
    if (value <= 0) {
        value = 0;
    } else if (value >= 3600) {
        value = 3600;
    }
    int min = value / 60;
    NSString *minStr = [NSString stringWithFormat:@"%@%d", min >= 10 ? @"":@"0", min];
    int second = (int)value % 60;
    NSString *secondStr = [NSString stringWithFormat:@"%@%d", second >= 10 ? @"":@"0", second];
    [self.slider setValue:value];
    self.showLabel.text = [NSString stringWithFormat:@"%@:%@/60:00", minStr, secondStr];
}
@end
