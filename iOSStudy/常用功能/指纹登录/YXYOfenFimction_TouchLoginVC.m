//
//  YXYOfenFimction_TouchLoginVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/5.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYOfenFimction_TouchLoginVC.h"
#import "TDTouchID.h"
#import "UIView+Toast.h"
@interface YXYOfenFimction_TouchLoginVC ()

@end

@implementation YXYOfenFimction_TouchLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //需要在infoplist 添加。
   //iphoneX新增 Privacy - Face ID Usage Description 字段 获取面部识别权限
    NSString *title = @"指纹登录";
    if (Height_NOTabBar) {
        title = @"刷脸登录";
    }
    UIButton *touchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [touchBtn setTitle:title forState:(UIControlStateNormal)];
    [touchBtn setTitleColor:HEXCOLOR(0x333333) forState:(UIControlStateNormal)];
    [touchBtn addTarget:self action:@selector(actionTouch) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:touchBtn];
    [touchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
}
- (void)actionTouch
{
    
    [TDTouchID td_showTouchIDWithDescribe:nil BlockState:^(TDTouchIDState state, NSError *error) {
        
        if (state == TDTouchIDStateNotSupport) {    //不支持TouchID
            
            [self.view makeToast:@"当前设备不支持TouchID, 请输入密码"];
            
        } else if (state == TDTouchIDStateSuccess) {    //TouchID验证成功
            
            NSLog(@"jump");
            [self.view makeToast:@"指纹验证成功"];
            
            
        } else if (state == TDTouchIDStateInputPassword) { //用户选择手动输入密码
            
            [self.view makeToast:@"当前设备不支持TouchID, 请输入密码"];
        }else {
            //            localizedFailureReason
            //            localizedDescription
            [self.view makeToast:error.localizedDescription];
        }
        
        // ps:以上的状态处理并没有写完全!
        // 在使用中你需要根据回调的状态进行处理,需要处理什么就处理什么
    }];
}


@end
