//
//  YXYAlertViewController.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/21.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYBaseViewController.h"
#import "YXYPresentationRightController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXYAlertViewController : YXYBaseViewController

@property (nonatomic, copy) dispatch_block_t block;


@property (nonatomic, strong) NSMutableArray *arrayData;


@end

NS_ASSUME_NONNULL_END
