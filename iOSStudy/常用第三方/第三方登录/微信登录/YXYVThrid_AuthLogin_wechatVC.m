//
//  YXYVThrid_AuthLogin_wechatVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/23.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYVThrid_AuthLogin_wechatVC.h"
#import "WXApi.h"

@interface YXYVThrid_AuthLogin_wechatVC ()<WXApiDelegate>

@end

@implementation YXYVThrid_AuthLogin_wechatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //一般放在appdelegate
    self.title = @"微信登录";
    
//     [WXApi registerApp:@"wxfa05f8b7f084f9ea"];//dfcadmin的
    [WXApi registerApp:@"appid" universalLink:@""];
//    WXApi re
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            /*检测是否安装微信客户端（ps：微信登录）//LSApplicationQueriesSchemes 新增数组中item值为weixin 还无权限的话卸载重装*/
           if ([WXApi isWXAppInstalled]) {//
               [self authWechat];
           } else {
//               [toas]
           }
    });
   
    
}

- (void)authWechat
{
    //构造SendAuthReq结构体
    SendAuthReq* req = [[SendAuthReq alloc]init];
    req.scope = @"snsapi_userinfo";
    req.state = @"123";
    req.openID = @"com.yunhu.www.MeHealthySeller";//com.yunhu.www.iOSStudy
    //    UIApplicationd [UIApplication sharedApplication].delegate
    //第三方向微信终端发送一个SendAuthReq消息结构
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    appDelegate.delegate = self;
    [WXApi sendReq:req completion:^(BOOL success) {
        if (success) {
            DebugLog(@"成功");
        } else {
            DebugLog(@"失败");
        }
    }];
}

- (void)onReq:(BaseReq*)req
{
    
}
- (void)onResp:(BaseResp*)resp
{
    
}

@end
