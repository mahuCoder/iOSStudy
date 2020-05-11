//
//  DevicesDefine.h
//  iOSStudy
//
//  Created by sunny on 2020/3/18.
//  Copyright © 2020 yunhun. All rights reserved.
//

#ifndef DevicesDefine_h
#define DevicesDefine_h


#define ScreenWidth         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight        [[UIScreen mainScreen] bounds].size.height


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

//判断设备类型
///是否iphone4。高度480
#define IS_IPHONE4      (IS_IPHONE && ScreenHeight<568.0)

#define IS_IPHONE5      (IS_IPHONE && ScreenHeight==568.0)

#define IS_IPHONE_6     (IS_IPHONE && ScreenHeight == 667.0)

#define IS_IPHONE_6P    (IS_IPHONE && ScreenHeight == 736.0)

///判断是否是刘海屏（iponeX以上）
#define IS_IPHONE_X_UP \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
////判断iPhoneX
//#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
////判断iPHoneXr
//#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
////判断iPhoneXs
//#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
////判断iPhoneXs Max
//#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//系统型号
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_OS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IS_OS_10_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IS_OS_11_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#define IS_OS_12_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.0)
#define IS_OS_13_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 13.0)



#define Height_SafeStatusBar (IS_IPHONE_X_UP ? 44.0 : 20.0)
#define Height_SafeNavBar (IS_IPHONE_X_UP ? 88.0 : 64.0)
#define Height_SafeTabBar (IS_IPHONE_X_UP ? 83.0 : 49.0)
#define Height_SafeToTabBar (IS_IPHONE_X_UP ? 34.0 :0)


#endif /* DevicesDefine_h */
