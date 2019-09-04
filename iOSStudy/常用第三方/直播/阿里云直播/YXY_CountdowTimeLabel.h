//
//  YXY_CountdowTimeLabel.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/3.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXY_CountdowTimeLabel : UILabel

@property (nonatomic, assign) int countTime;



//执行这个方法开始倒计时
- (void)startCount;


@end

NS_ASSUME_NONNULL_END
