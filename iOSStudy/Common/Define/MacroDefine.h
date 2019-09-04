//
//  MacroDefine.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/2.
//  Copyright © 2019 yunhun. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h



#ifdef DEBUG
#  define LOG(fmt, ...) do {                                            \
NSString* file = [[NSString alloc] initWithFormat:@"%s", __FILE__]; \
NSLog((@"%@(%d) " fmt), [file lastPathComponent], __LINE__, ##__VA_ARGS__); \
} while(0)
#  define LOG_METHOD NSLog(@"%s", __func__)
#  define LOG_CMETHOD NSLog(@"%@/%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#  define COUNT(p) NSLog(@"%s(%d): count = %d\n", __func__, __LINE__, [p retainCount]);
#  define LOG_TRACE(x) do {printf x; putchar('\n'); fflush(stdout);} while (0)
#else
#  define LOG(...)
#  define LOG_METHOD
#  define LOG_CMETHOD
#  define COUNT(p)
#  define LOG_TRACE(x)
#endif

/**
 *  日志调试
 */
#ifdef DEBUG
#define DebugLog(format,...)    NSLog(@"{%s,%d}" format, __FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define DebugLog(format,...)
#endif

/**
 *   字体处理
 */
#define FONT_Name(s, f)                     [UIFont fontWithName:s size:f]
#define FONT(f)                             [UIFont fontWithName:@"PingFang SC" size:f]

//占位图
#define PlaceHolederNormalImage   [UIImage imageNamed:@"placeholder_product"]
#define PlaceHolederUserImage     [UIImage imageNamed:@"placeholder_headerimage"]
#define PlaceHolederHeaderImage     [UIImage imageNamed:@"icon_head_bg"]



/**
 *  应用程序
 */
#define ApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define SharedApplication                   [UIApplication sharedApplication]
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NotificationCenter                  [NSNotificationCenter defaultCenter]
#define Bundle                              [NSBundle mainBundle]
#define MainScreen                          [UIScreen mainScreen]
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x

#define BACK(block)          dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block)          dispatch_async(dispatch_get_main_queue(),block)




/**
 * 自定义处理
 */
#define LS(v)                               NSLocalizedString(v, nil)
#define Notify(v)                           [[NSNotificationCenter defaultCenter] postNotificationName:v object:nil userInfo:nil]
#define NotifyU(v, u)                       [[NSNotificationCenter defaultCenter] postNotificationName:v object:nil userInfo:u]
#define Subscribe(v, s)                     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(s) name:v object:nil]
#define UnSubscribe(v)                      [[NSNotificationCenter defaultCenter] removeObserver:self name:v object:nil]
#define StoryboardVC(s, v)                  [[UIStoryboard storyboardWithName:s bundle:nil] instantiateViewControllerWithIdentifier:v]
#define SelfVCByName(n)                     [self.storyboard instantiateViewControllerWithIdentifier:n];
#define WS(weakSelf)                        __weak __typeof(&*self)weakSelf = self;


//#define weakify(...) \
//rac_keywordify \
//metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)
//
//#define strongify(...) \
//rac_keywordify \
//_Pragma("clang diagnostic push") \
//_Pragma("clang diagnostic ignored \"-Wshadow\"") \
//metamacro_foreach(rac_strongify_,, __VA_ARGS__) \
//_Pragma("clang diagnostic pop")


// weakify strongify
#ifndef weakify
#if DEBUG
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#endif
#endif

#ifndef strongify
#if DEBUG
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#endif
#endif

/**
 *  系统
 */
#define NLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)
#define IOS7_OR_LATER NLSystemVersionGreaterOrEqualThan(7.0)
#define IOS8_OR_LATER NLSystemVersionGreaterOrEqualThan(8.0)

/**
 *  角度<->弧度
 */
#define Degree2Radian(degrees)  (M_PI * (degrees) / 180.0)
#define Radian2Ddegree(radian)  ((radian * 180.0) / M_PI)

#define _TEXT(key) NSLocalizedStringFromTable(key,@"Localizable_cn", nil)


/**
 * 设备类型
 */
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_IPHONE4 (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define IS_OS_10_BEFOR    ([[[UIDevice currentDevice] systemVersion] floatValue] < 10.0)

#define isIPhone ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,960),[[UIScreen mainScreen] currentMode].size) : NO)


#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,1136),[[UIScreen mainScreen] currentMode].size) : NO)



#define isIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define isIPad2 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(768,1024),[[UIScreen mainScreen] currentMode].size) : NO)


#define isIPad3_4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1536,2048),[[UIScreen mainScreen] currentMode].size) : NO)


#define NLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)
#define IOS7_OR_LATER NLSystemVersionGreaterOrEqualThan(7.0)

//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)
#define Height_NOTabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 34.0 :0)



/**
 *  UI
 */
#define DATE_COMPONENTS                     NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
#define TIME_COMPONENTS                     NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
#define FlushPool(p)                        [p drain]; p = [[NSAutoreleasePool alloc] init]
#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
#define HEXCOLOR_Alpha(c,a)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:a]


#define NavBar                              self.navigationController.navigationBar
#define TabBar                              self.tabBarController.tabBar

#define NavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define StatusBarHeight                     22
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define TouchHeightDefault                  44
#define TouchHeightSmall                    32
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewWidth                       self.view.bounds.size.width
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectMakeWidth(f, w)                 CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectMakeHeight(f, h)                CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectMakeX(f, x)                     CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectMakeY(f, y)                     CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectMakeSize(f, w, h)               CGRectMake(RectX(f), RectY(f), w, h)
#define RectMakeOrigin(f, x, y)             CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define RectMakeMove(f, dx, dy)             CGRectMake(RectX(f) + dx, RectY(f) + dy, RectWidth(f), RectHeight(f))
#define RectSetWidth(f, w)                  f = RectMakeWidth(f, w)
#define RectSetHeight(f, h)                 f = RectMakeHeight(f, h)
#define RectSetX(f, x)                      f = RectMakeX(f, x)
#define RectSetY(f, y)                      f = RectMakeY(f, y)
#define RectSetSize(f, w, h)                f = RectMakeSize(f, w, h)
#define RectSetOrigin(f, x, y)              f = RectMakeOrigin(f, x, y)
#define RectSetMove(f, dx, dy)              f = RectMakeMove(f, dx, dy)
//比例
#define kscaleW     [[UIScreen mainScreen] bounds].size.width/375
















#endif /* MacroDefine_h */
