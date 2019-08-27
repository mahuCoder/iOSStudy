//
//  YXYThrid_BaiduMap_Define.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#define baiduMapAppSecret @"V4SMflY0tY5epqyjGXzP7BLbVm9I8b4Q"

#import <Foundation/Foundation.h>
#import <BMKLocationkit/BMKLocationComponent.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXYThrid_BaiduMap_Define : NSObject

//@property (nonatomic, strong) BMKMapManager *mapManager; //主引擎类


+ (void)initBaiduMapWithDelegateObject:(id )delegateObject;

@end

NS_ASSUME_NONNULL_END
