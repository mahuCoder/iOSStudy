//
//  LrcModel.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/14.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LrcModel : NSObject
/** 开始时间*/
@property (nonatomic, assign) NSTimeInterval beginTime;

/** 结束时间*/
@property (nonatomic, assign) NSTimeInterval endTime;

/** 歌词*/
@property (nonatomic, copy) NSString *lrcStr;
@end

