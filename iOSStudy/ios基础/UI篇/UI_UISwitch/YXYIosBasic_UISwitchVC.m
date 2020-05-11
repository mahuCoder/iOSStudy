//
//  YXYIosBasic_UISwitchVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/23.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UISwitchVC.h"

@interface YXYIosBasic_UISwitchVC ()

@property (nonatomic, assign) CGFloat top;

@end

@implementation YXYIosBasic_UISwitchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.top = 15;
    
    [self addSwitch_0];
    
    [self addSwitch_1];
    
    [self addSwitch_2];
    
    [self addSwitch_3];
    
    [self addSwitch_4];
    
    [self addSwitch_5];
}
- (void)actionSwith:(UISwitch *)sender {
    if (sender.on) {
        [ToastManager showToast:@"打开开关"];
    } else {
        [ToastManager showToast:@"关闭"];
    }
}
- (void)addSwitch_0 {
    UISwitch *switchOn = [[UISwitch alloc] init];
    [self.view addSubview:switchOn];
    [switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
    }];
    self.top += 50;
    [switchOn addTarget:self action:@selector(actionSwith:) forControlEvents:(UIControlEventValueChanged)];
}
- (void)addSwitch_1 {
    UISwitch *switchOn = [[UISwitch alloc] init];
    [self.view addSubview:switchOn];
    [switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
    }];
    switchOn.enabled = NO;
    self.top += 50;
    
}
- (void)addSwitch_2 {
    UISwitch *switchOn = [[UISwitch alloc] init];
    [self.view addSubview:switchOn];
    [switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
    }];
    switchOn.on = YES;
    switchOn.enabled = NO;
    self.top += 50;
}
- (void)addSwitch_3 {
    UISwitch *switchOn = [[UISwitch alloc] init];
    [self.view addSubview:switchOn];
    [switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
    }];
    switchOn.onTintColor = [UIColor redColor];
    switchOn.tintColor = [UIColor blueColor];
    switchOn.thumbTintColor = [UIColor greenColor];
    switchOn.backgroundColor = [UIColor yellowColor];
    self.top += 50;
}
- (void)addSwitch_4 {
    UISwitch *switchOn = [[UISwitch alloc] init];
    [self.view addSubview:switchOn];
    [switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
    }];
    //在iOS 7以后，设置无效
    switchOn.onImage = [UIImage imageNamed:@"redAnimationIcon"];
    switchOn.offImage = [UIImage  imageNamed:@"greenAnimationIcon"];
    self.top += 50;
}
- (void)addSwitch_5 {
    UISwitch *switchOn = [[UISwitch alloc] init];
    [self.view addSubview:switchOn];
    [switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
        make.size.mas_equalTo(CGSizeMake(200, 60));
    }];
    switchOn.backgroundColor = [UIColor yellowColor];
    self.top += 50;
}
@end
