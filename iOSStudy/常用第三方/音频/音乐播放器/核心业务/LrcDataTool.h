//
//  LrcDataTool.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/14.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LrcModel.h"


@interface LrcDataTool : NSObject

/**
 *  根据歌词文件名获取歌词数据
 *
 *  @param filename 歌词文件名
 *
 *  @return 歌词对象数组 NSArray<LrcModel *>
 */
+ (NSArray<LrcModel *> *)getLrcData:(NSString *)filename;


/**
 *  获取当前播放的歌词所在的行
 *
 *  @param currentTime 已经播放的时间 NSTimeInterval
 *  @param lrcMs       歌词信息 NSArray<LrcModel *>
 *  @param completion  获取信息后要执行的操作
 */
+ (void)getRow:(NSTimeInterval)currentTime andLrcs:(NSArray<LrcModel *> *)lrcMs completion:(void (^)(NSInteger row, LrcModel *lrcModel))completion;

@end

