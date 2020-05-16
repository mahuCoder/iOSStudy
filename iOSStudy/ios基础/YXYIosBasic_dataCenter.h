//
//  YXYIosBasic_dataCenter.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/14.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXYIosBasic_dataCenter : NSObject<YYModel>



+ (instancetype )shareDataCenter;


@property (nonatomic, strong)NSMutableArray *lifeCycleSelectorList;

@property (nonatomic, strong)NSMutableArray *lifeCycleViewControllerSelectorList;


@end

NS_ASSUME_NONNULL_END
