//
//  YXYIosBasic_dataCenter.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/14.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_dataCenter.h"

@implementation YXYIosBasic_dataCenter


+ (instancetype )shareDataCenter {
    static YXYIosBasic_dataCenter *dataCenter;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [YXYIosBasic_dataCenter yy_modelWithJSON:@{}];
        dataCenter.lifeCycleSelectorList = [NSMutableArray array];
    });
    return dataCenter;
}

//- (void)setLifeCycleSelectorList:(NSMutableArray *)lifeCycleSelectorList {
//    if (!lifeCycleSelectorList) {
//        lifeCycleSelectorList = [NSMutableArray array];
//    }
//    _lifeCycleSelectorList = lifeCycleSelectorList;
//}

//- (NSMutableArray *)lifeCycleSelectorList {
//    if (!_lifeCycleSelectorList) {
//        _lifeCycleSelectorList = [NSMutableArray array];
//    }
//    return _lifeCycleSelectorList;
//}
@end
