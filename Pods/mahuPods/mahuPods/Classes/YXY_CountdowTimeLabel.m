//
//  YXY_CountdowTimeLabel.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/3.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXY_CountdowTimeLabel.h"

@interface YXY_CountdowTimeLabel()
@property (nonatomic, strong) NSTimer *timer;
@end


@implementation YXY_CountdowTimeLabel

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        self.frame = frame;
//    }
//    return self;
//}
- (instancetype)init{
    if (self = [super init]){
        self.font = [UIFont systemFontOfSize:40];
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
//开始倒计时
- (void)startCount{
    [self initTimer];
}

- (void)initTimer{
    //如果没有设置，则默认为3
    if (self.countTime == 0){
        self.countTime = 3;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (void)countDown{
    if (_countTime > 0){
        self.text = [NSString stringWithFormat:@"%d",_countTime];
        CAKeyframeAnimation *anima2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        //字体变化大小
        NSValue *value1 = [NSNumber numberWithFloat:3.0f];
        NSValue *value2 = [NSNumber numberWithFloat:2.0f];
        NSValue *value3 = [NSNumber numberWithFloat:0.7f];
        NSValue *value4 = [NSNumber numberWithFloat:1.0f];
        anima2.values = @[value1,value2,value3,value4];
        anima2.duration = 0.5;
        [self.layer addAnimation:anima2 forKey:@"scalsTime"];
        _countTime -= 1;
    }else {
        [_timer invalidate];
        [self removeFromSuperview];
    }
}

@end
