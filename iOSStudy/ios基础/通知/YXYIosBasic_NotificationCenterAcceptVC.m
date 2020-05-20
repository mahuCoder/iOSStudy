//
//  YXYIosBasic_NotificationCenterAcceptVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/20.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_NotificationCenterAcceptVC.h"

@interface YXYIosBasic_NotificationCenterAcceptVC ()

@property (nonatomic, strong)UILabel *descLabel;

@end

@implementation YXYIosBasic_NotificationCenterAcceptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UILabel *lab
    
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setTitle:@"进入下一页发送通知" forState:(UIControlStateNormal)];
    [button setTitleColor:UIColor.redColor forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(actionNext) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(64);
    }];
    
    
    //注册接收通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(actionNotiOne:) name:@"NotiOne" object:nil];

    
    [center addObserverForName:@"NotiTwo" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
    }];
    
    
    
    
    
}

- (void)actionNotiOne:(NSNotification *)sender {
    
}

- (void)actionNext {
    
}
- (void)dealloc {
    
    
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
