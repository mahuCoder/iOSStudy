//
//  MUsicLrcViewController.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LrcModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MUsicLrcViewController : UIViewController
/** 数据源*/
@property (nonatomic, strong) NSArray<LrcModel *> *datasource;

/** 指定歌词滚动到某一行*/
@property (nonatomic, assign) NSInteger scrollRow;

/** 当前歌词的播放进度*/
@property (nonatomic, assign) CGFloat progress;

@end

NS_ASSUME_NONNULL_END
