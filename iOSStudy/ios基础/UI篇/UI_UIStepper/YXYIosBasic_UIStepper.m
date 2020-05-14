//
//  YXYIosBasic_UIStepper.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/12.
//  Copyright © 2020 yunhun. All rights reserved.
//步进器

#import "YXYIosBasic_UIStepper.h"

@interface YXYIosBasic_UIStepper ()

@property (nonatomic, strong) UILabel *valueLabel;

@property (nonatomic, assign) int value;


@end

@implementation YXYIosBasic_UIStepper

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIStepper *stepper = [[UIStepper alloc] init];
    [self.view addSubview:stepper];
    [stepper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(20);
    }];
    ///每次加减幅度
    stepper.stepValue = 1;
    ///最小值
    stepper.minimumValue = 0;
    ///最大值
    stepper.maximumValue = 200;
    [stepper addTarget:self action:@selector(actionStepper:) forControlEvents:(UIControlEventValueChanged)];
    
    self.value = 100;
    ///初始值（默认0）
    stepper.value = self.value;
    [self.view addSubview:self.valueLabel];
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.centerX.offset(0);
    }];
}
- (void)setValue:(int)value {
    _value = value;
    
    self.valueLabel.text = [NSString stringWithFormat:@"%d",value];
}
- (void)actionStepper:(UIStepper *)sender {
//    sender.value =
    self.value = sender.value;
    
}
- (UILabel *)valueLabel {
    if (!_valueLabel) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.font = FONT(12);
    }
    return _valueLabel;
}
@end
