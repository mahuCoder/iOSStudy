//
//  YXYThrid_BaiduMap_Define.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_BaiduMap_Define.h"
#import <BaiduMapAPI_Map/BMKGradient.h>


@interface YXYThrid_BaiduMap_Define ()



@end

@implementation YXYThrid_BaiduMap_Define

/*
    需导入系统库
    CoreGraphics.framework
    CoreLocation.framework
    libc++.tbd//V4.2.0及以上版本，需要将libstdc++.6.0.9.tbd 更新为libc++.tbd
    libsqlite3.0.tbd（xcode7以前为 libsqlite3.0.dylib）
    OpenGLES.framework
    QuartzCore.framework
    Security.framework  //是为了统计app信息使用
    SystemConfiguration.framework  //统计信息，用于改善产品
    环境配置：在TARGETS->Build Settings->Other Linker Flags （选中ALL视图）中添加-ObjC
 */


+ (void)initBaiduMapWithDelegateObject:(id)delegateObject
{
    // 初始化定位SDK
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:baiduMapAppSecret authDelegate:delegateObject];
    //要使用百度地图，请先启动BMKMapManager
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [mapManager start:baiduMapAppSecret  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    /**
     百度地图SDK所有API均支持百度坐标（BD09）和国测局坐标（GCJ02），用此方法设置您使用的坐标类型.
     默认是BD09（BMK_COORDTYPE_BD09LL）坐标.
     如果需要使用GCJ02坐标，需要设置CoordinateType为：BMK_COORDTYPE_COMMON.
     */
    [BMKMapManager setCoordinateTypeUsedInBaiduMapSDK: BMK_COORDTYPE_BD09LL];
    
//    BMKCataloguePage *cataloguePage = [[BMKCataloguePage alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:cataloguePage];
//    [self.window setRootViewController:navigationController];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
}


- (void)test
{
//        #百度地图SDK
//        #pod 'BaiduMapKit'
    //参考资料
    
    
}

@end
