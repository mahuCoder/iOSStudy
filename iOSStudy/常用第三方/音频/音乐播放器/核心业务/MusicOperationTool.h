//
//  MusicOperationTool.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/29.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicMessageModel.h"
#import "MusicPlayerTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicOperationTool : NSObject



/** 音乐播放列表*/
@property (nonatomic, strong) NSArray<MusicModel *> *musicMList;


#pragma mark 单例
/**
 *  获取对象单例
 *
 *  @return MusicOperationTool单例对象
 */
+ (instancetype)shareInstance;


/**
 *  播放音乐
 *  是否播放成功
 *  @param music 音乐对象模型,
 */
- (BOOL)playMusic:(MusicModel *)music;

/** 当前播放音乐的索引*/
@property (nonatomic, assign) NSInteger index;

#pragma mark --------------------------
#pragma mark set 方法

/**
 *  获取最新信息
 *
 *  @return QQMusicMessageModel
 */
- (MusicMessageModel *)getNewMusicMessageModel;

#pragma mark --------------------------
#pragma mark 单首音乐的操作


/**
 *  播放当前歌曲
 */
- (void)playCurrentMusic;

/**
 *  暂停当前音乐播放
 */
- (void)pauseCurrentMusic;

/**
 *  播放 下一首
 */
- (BOOL)nextMusic;

/**
 *  播放 上一首
 */
- (BOOL)preMusic;

/**
 停止当前音乐
 */
- (void)stopCurrentMusic;

/**
 *  指定当前播放进度
 *
 *  @param timeInteval 歌曲已经播放的时间
 */
- (void)seekTo:(NSTimeInterval)timeInteval;

/// 是否正在播放音乐
- (BOOL)isPlaying;

- (BOOL)isExistAVAudioPlayer;
@end

NS_ASSUME_NONNULL_END
