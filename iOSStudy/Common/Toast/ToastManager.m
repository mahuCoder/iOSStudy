//
//  ToastManager.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/27.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "ToastManager.h"

@implementation ToastManager

+(void)showToast:(NSString *)toast
{
    [self showToast:toast toView:[UIApplication sharedApplication].keyWindow];
}
+(void)showToast:(NSString *)toast toView:(UIView *)view
{
    [self showToast:toast toView:view afterComplete:nil];
}
+ (void)showToast:(NSString *)toast toView:(UIView *)view afterComplete:(void(^)(void))complete
{
     [self showText:toast icon:nil toView:view afterComplete:complete];
}
+(void)showError:(NSString *)error
{
    [self showError:error toView:[UIApplication sharedApplication].keyWindow];
}
+(void)showError:(NSString *)error toView:(UIView *)view
{
     [self showError:error toView:view afterComplete:nil];
}
+ (void)showError:(NSString *)error toView:(UIView *)view afterComplete:(void(^)(void))complete
{
    [self showText:error icon:@"mb_error" toView:view afterComplete:complete];
}

+(void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:[UIApplication sharedApplication].keyWindow];
}
+(void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self showSuccess:success toView:view afterComplete:nil];
}
+ (void)showSuccess:(NSString *)success toView:(UIView *)view afterComplete:(void(^)(void))complete
{
    [self showText:success icon:@"mb_success" toView:view afterComplete:complete];
}

+ (void)showText:(NSString*)text icon:(NSString *)icon toView:(UIView *)view afterComplete:(void(^)(void))complete
{
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    if (!text || !text.length) {
        text = @"出错啦";
    }
    [self hideHud:view];
    // 快速显示一个提示信息
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (!icon) {
         hud.mode = MBProgressHUDModeText;
    } else {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    }
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = text;
    hud.label.numberOfLines = 0;
    hud.label.preferredMaxLayoutWidth = ScreenWidth - 30;
    hud.removeFromSuperViewOnHide = YES;
    CGFloat delay = 1.0f;
    if (text.length >= 20) {
        delay = 3.0f;
    }
    [hud hideAnimated:YES afterDelay:delay];
}
+(void)hideHud
{
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
}
+ (void)hideHud:(UIView *)view
{
    if (view == nil)
        view = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:view animated:YES];
}
+(MBProgressHUD *)showHorizontalProgressBarWithMessage:(NSString *)message
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.removeFromSuperViewOnHide = YES;
    //设置进度条颜色
    [hud setContentColor:[UIColor whiteColor]];

    return hud;
}
+(MBProgressHUD *)showCircularProgressWithMessage:(NSString *)message
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.removeFromSuperViewOnHide = YES;
    //设置进度条颜色
    [hud setContentColor:[UIColor whiteColor]];
    return hud;
}
+(MBProgressHUD *)showActivityIndicatorWithMessage:(NSString *)message
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.removeFromSuperViewOnHide = YES;
    //设置进度条颜色
    [hud setContentColor:[UIColor whiteColor]];
    return hud;
}
+(MBProgressHUD *)showFanProgressBarWithMessage:(NSString *)message
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.removeFromSuperViewOnHide = YES;
    //设置进度条颜色
    [hud setContentColor:[UIColor whiteColor]];
    return hud;
}
+(void)showCustomViewWithCustomView:(UIView *)customView message:(NSString *)message
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    hud.customView = customView;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7f];
    hud.removeFromSuperViewOnHide = YES;
    //设置进度条颜色
    [hud setContentColor:[UIColor whiteColor]];
    CGFloat delay = 1.0f;
    if (message.length >= 20) {
        delay = 3.0f;
    }
    [hud hideAnimated:YES afterDelay:delay];
}

@end
