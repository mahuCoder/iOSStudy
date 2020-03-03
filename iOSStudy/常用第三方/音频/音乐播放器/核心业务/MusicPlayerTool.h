//
//  MusicPlayerTool.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/8.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


static NSString * const kPlayFinishNotificationName = @"kPlayFinishNotificationName";


@interface MusicPlayerTool : NSObject

/** 音乐播放器*/
@property (nonatomic, strong) AVAudioPlayer *player;


/**
 *  播放指定文件的音乐
 *
 *  @param musicName 音乐文件名
 */
- (BOOL)playMusic:(NSString *)musicName;

/**
 *  暂停当前音乐
 */
- (void)pauseCurrentMusic;

/**
 *  继续播放当前音乐
 */
- (void)resumeCurrentMusic;


/**
 停止当前音乐
 */
- (void)stopCurrentMusic;

/**
 *  指定播放进度
 *
 *  @param timeInteval 时间, 指定歌曲已经播放了多长时间
 */
- (void)seekTo:(NSTimeInterval)timeInteval;

- (BOOL)isPlaying;

- (BOOL)isExistAVAudioPlayer;

@end

