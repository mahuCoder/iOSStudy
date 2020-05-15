//
//  AppDelegate.m
//  iOS技术学习总结
//
//  Created by 胡雪刚 on 2019/1/17.
//  Copyright © 2019年 yunhun. All rights reserved.
//

#import "AppDelegate.h"
#import "YXYTabBarViewController.h"


#import "YXYThrid_BaiduMap_Define.h"//百度地图
#import "WXApi.h"
#import <IQKeyboardManager.h>
#import <Bugly/Bugly.h>
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>
@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#pragma 百度地图
    [YXYThrid_BaiduMap_Define initBaiduMapWithDelegateObject:self];
#pragma IQKeyboardManager
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;//空白地方点击
#pragma bugly
      [Bugly startWithAppId:@"cea36e069f"];
#pragma 友盟
    [UMConfigure initWithAppkey:@"5cd13ae30cafb212550003e7" channel:nil];
    [MobClick setScenarioType:E_UM_NORMAL];//支持普通场景
    [MobClick setAutoPageEnabled:YES];
    
    YXYTabBarViewController *tabBarVC = [[YXYTabBarViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    
    
    
    [self addLivfCycleDataWithSelector:_cmd];
    return YES;
}

#pragma mark app回调
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    BOOL result = NO;
    NSString *str = [url absoluteString];
    if ([str hasPrefix:@"wx"] && [str containsString:@"oauth"]) {//微信授权
//        @"wxfa05f8b7f084f9ea://oauth?code=071EMqdN1G1oN61h1WfN1MshdN1EMqd7&state=123"
        result = [WXApi handleOpenURL:url delegate:self];
    }
//    else{
//        result = [[UMSocialManager defaultManager] handleOpenURL:url];
//    }
//    if (!result) {
//        result = [self Alipay:url];
//    }
    return result;
//
    return YES;
}
- (void)onReq:(BaseReq*)req
{
    
}
#pragma mark --微信授权返回的结果
- (void)onResp:(BaseResp*)resp
{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self addLivfCycleDataWithSelector:_cmd];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self addLivfCycleDataWithSelector:_cmd];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self addLivfCycleDataWithSelector:_cmd];
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self addLivfCycleDataWithSelector:_cmd];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self addLivfCycleDataWithSelector:_cmd];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
///添加生命周期测试数据
- (void)addLivfCycleDataWithSelector:(SEL )selector {
    NSInteger count = [YXYIosBasic_dataCenter shareDataCenter].lifeCycleSelectorList.count;
    [[YXYIosBasic_dataCenter shareDataCenter].lifeCycleSelectorList addObject:[NSString stringWithFormat:@"%ld、%@",count, NSStringFromSelector(selector)]];
}

@end
