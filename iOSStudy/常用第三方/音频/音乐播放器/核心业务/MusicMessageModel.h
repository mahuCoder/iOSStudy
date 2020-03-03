//
//  MusicMessageModel.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/8.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicMessageModel : NSObject

/** 音乐数据*/
@property (nonatomic, strong) MusicModel *musicM;

/** 当前播放时长*/
@property (nonatomic, assign) NSTimeInterval costTime;

/** 歌曲总时长*/
@property (nonatomic, assign) NSTimeInterval totalTime;

/** 当前播放状态*/
@property (nonatomic, assign, getter=isPlaying) BOOL playing;

#pragma mark --------------------------
#pragma mark 时间格式
/** 当前播放时长 字符串格式*/
@property (nonatomic, strong, readonly) NSString *costTimeFormat;

/** 歌曲总时长 字符串格式*/
@property (nonatomic, strong, readonly) NSString *totalTimeFormat;


+ (NSString *)getFormatTime:(NSTimeInterval)time;

+ (NSTimeInterval)getTimeInterval:(NSString *)formatTime;
@end

NS_ASSUME_NONNULL_END
