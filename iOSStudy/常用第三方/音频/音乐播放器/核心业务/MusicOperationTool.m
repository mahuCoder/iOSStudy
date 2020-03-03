//
//  MusicOperationTool.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/29.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "MusicOperationTool.h"

@interface MusicOperationTool ()
/** 音乐播放工具*/
@property (nonatomic, strong) MusicPlayerTool *tool;

/** 记录当前歌曲的歌词 播放到哪一行*/
@property (nonatomic, assign) NSInteger lrcRow;

/** 当前播放音乐的信息*/
@property (nonatomic, strong) MusicMessageModel *musicMessageModel;
@end

@implementation MusicOperationTool

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tool = [[MusicPlayerTool alloc] init];
        _musicMessageModel = [[MusicMessageModel alloc] init];
        _lrcRow = -1;
    }
    return self;
}

#pragma mark --------------------------
#pragma mark 单首音乐的操作
- (BOOL)playMusic:(MusicModel *)music
{
    NSString *fileName = music.filename;
    BOOL isPlayMusicSucceed = [self.tool playMusic:fileName];
        
    if (self.musicMList == nil || self.musicMList.count <= 1) {
        NSLog(@"没有播放列表, 只能播放一首歌");
//        isPlayMusicSucceed = NO;
        return NO;
    }
    
    // 记录当前播放歌曲的索引
    self.index = [self.musicMList indexOfObject:music];
    
    return isPlayMusicSucceed;
}

#pragma mark 单例
static id _instance = nil;
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
#pragma mark set 方法

/** 重写 index 的 set方法,防止越界*/
- (void)setIndex:(NSInteger)index{
    _index = index;
    
    if (index < 0) {
        _index = self.musicMList.count - 1;
        
    }else if(index > self.musicMList.count - 1) {
        _index = 0;
    }
}

/** 获取最新信息*/
- (MusicMessageModel *)getNewMusicMessageModel{
    
    // 跟新数据
    self.musicMessageModel.musicM = self.musicMList[self.index];
    
    // 已经播放的时长
    self.musicMessageModel.costTime = self.tool.player.currentTime;
    
    // 总时长
    self.musicMessageModel.totalTime = self.tool.player.duration;
    
    // 播放状态
    self.musicMessageModel.playing = self.tool.player.playing;
    
    return self.musicMessageModel;
}
- (void)playCurrentMusic{
    
    [self.tool resumeCurrentMusic];
}

- (void)pauseCurrentMusic{
    
    [self.tool pauseCurrentMusic];
}

/**
 停止当前音乐
 */
- (void)stopCurrentMusic {
    [self.tool stopCurrentMusic];
}

- (BOOL)nextMusic{
    
    self.index += 1;
    if (self.musicMList) {
        MusicModel *music = self.musicMList[self.index];
       return [self playMusic:music];
    }
    return NO;
}

- (BOOL)preMusic{
    
    self.index -= 1;
    if (self.musicMList) {
        MusicModel *music = self.musicMList[self.index];
       return [self playMusic:music];
    }
    return NO;
}
- (BOOL)isPlaying
{
    return [self.tool isPlaying];
}
- (void)seekTo:(NSTimeInterval)timeInteval{
    
    [self.tool seekTo:timeInteval];
}
- (NSArray *)musicMList
{
    if(_musicMList == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:QQResources(@"Musics") ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _musicMList = [NSArray yy_modelArrayWithClass:[MusicModel class] json:array];
    }
    return _musicMList;
}
- (BOOL)isExistAVAudioPlayer
{
    return [self.tool isExistAVAudioPlayer];
}
@end
