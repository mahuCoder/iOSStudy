//
//  YXYIosBasic_UIDatePickerView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/12.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIDatePickerView.h"

@interface YXYIosBasic_UIDatePickerView ()
{
    NSTimer *_timer;
}

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation YXYIosBasic_UIDatePickerView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"日期+时间",@"时分",@"年月日",@"时+分"]];
    segment.selectedSegmentIndex = 0;
    [self.view addSubview:segment];
    [segment addTarget:self action:@selector(actionSegment:) forControlEvents:(UIControlEventValueChanged)];
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.offset(0);
    }];
    
    
    UISegmentedControl *segment_0 = [[UISegmentedControl alloc] initWithItems:@[@" 时间间隔1",@"间隔30（最大）",@"6(被60整除)"]];
    segment_0.selectedSegmentIndex = 0;
    [self.view addSubview:segment_0];
    [segment_0 addTarget:self action:@selector(actionSegment:) forControlEvents:(UIControlEventValueChanged)];
    [segment_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(80);
        make.centerX.offset(0);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"获取结果" forState:(UIControlStateNormal)];
    [button setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(acitonResult) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(130);
        make.centerX.offset(0);
    }];
    
    
    
    [self.view addSubview:self.datePicker];
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(260);
        make.bottom.offset(-20);
        make.bottom.left.right.offset(0);
    }];
}
- (void)actionSegment:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;
   
    if (sender.numberOfSegments == 4) {
        [_timer setFireDate:[NSDate distantFuture]];
        [_timer invalidate];
        _timer = nil;
        switch (index) {
            case 0: {
                self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            }
                break;
                
            case 1: {
                self.datePicker.datePickerMode = UIDatePickerModeTime;
            }
                break;
            
            case 2: {
                self.datePicker.datePickerMode = UIDatePickerModeDate;
            }
                break;
            case 3: {
                self.datePicker.datePickerMode = UIDatePickerModeCountDownTimer;//这个模式需要定时器
                if (self.datePicker.countDownDuration > 0) {
                    _timer = [NSTimer timerWithTimeInterval:60.0 target:self selector:@selector(actionRuntime) userInfo:nil repeats:YES];
                    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:( NSDefaultRunLoopMode)];
                }
            }
                break;
                
            default:
                break;
        }
    } else {
        switch (index) {
            case 0: {
                self.datePicker.minuteInterval = 1.0;
            }
                break;
                
            case 1: {
                self.datePicker.minuteInterval = 30.0;
            }
                break;
            
            case 2: {
                self.datePicker.minuteInterval = 6.0;
            }
                break;
            case 3: {
                self.datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
            }
                break;
                
            default:
                break;
        }
    }
}
- (void)actionRuntime {
    NSTimeInterval now = self.datePicker.countDownDuration;
    if (now > 0) {
        self.datePicker.countDownDuration -= 60;
    } else {
        [_timer setFireDate:[NSDate distantFuture]];
        [_timer invalidate];
        _timer = nil;
    }

}
- (void)acitonResult {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy/MM/dd HH:mm"];
    NSString * dateString = [formatter stringFromDate:self.datePicker.date];
    [ToastManager showToast:dateString];
}
- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.backgroundColor = UIColor.greenColor;
    }
    return _datePicker;
}

@end
