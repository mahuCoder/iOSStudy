//
//  ToastManager.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/27.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface ToastManager : NSObject

+(void)showToast:(NSString *)toast;
+(void)showToast:(NSString *)toast toView:(UIView *)view;
+ (void)showToast:(NSString *)toast toView:(UIView *)view afterComplete:(void(^)(void))complete;

+(void)showError:(NSString *)error;
+(void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view afterComplete:(void(^)(void))complete;

+(void)showSuccess:(NSString *)success;
+(void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view afterComplete:(void(^)(void))complete;

+ (void)showText:(NSString*)text icon:(NSString *)icon toView:(UIView *)view afterComplete:(void(^)(void))complete;

/**
 横条进度条

 @param message 加载信息
 @return 进度视图
 */
+(MBProgressHUD *)showHorizontalProgressBarWithMessage:(NSString *)message;

/**
 圆形进度条

 @param message 加载信息
 @return 进度试图
 */
+(MBProgressHUD *)showCircularProgressWithMessage:(NSString *)message;

/**
 菊花加载

 @param message 加载信息
 @return 进度试图
 */
+(MBProgressHUD *)showActivityIndicatorWithMessage:(NSString *)message;

/**
 扇形进度条

 @param message 加载信息
 @return 进度试图
 */
+(MBProgressHUD *)showFanProgressBarWithMessage:(NSString *)message;

+(void)showCustomViewWithCustomView:(UIView *)customView message:(NSString *)message;


+ (void)hideHud:(UIView *)view;
+ (void)hideHud;
@end

