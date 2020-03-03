//
//  MusicMessageModel.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/8.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "MusicMessageModel.h"

@implementation MusicMessageModel


- (void)setCostTime:(NSTimeInterval)costTime
{
    _costTime = costTime;
    _costTimeFormat = [MusicMessageModel getFormatTime:costTime];
}
- (void)setTotalTime:(NSTimeInterval)totalTime
{
    _totalTime = totalTime;
    _totalTimeFormat = [MusicMessageModel getFormatTime:_totalTime];
}

+ (NSString *)getFormatTime:(NSTimeInterval)time{
    
    // time 123
    // 03:12
    
    NSInteger min = time / 60;
    NSInteger second = time - min * 60;
    
    NSString *result = [NSString stringWithFormat:@"%02ld:%02ld",(long)min,(long)second];
    
    return result;
}

+ (NSTimeInterval)getTimeInterval:(NSString *)formatTime {
    
    // 00:00.89  -> 多少秒
    NSArray *minAndSec = [formatTime componentsSeparatedByString:@":"];
    if (minAndSec.count == 2) {
        
        // 分钟
        NSTimeInterval min = [minAndSec[0] doubleValue];
        // 秒数
        NSTimeInterval sec = [minAndSec[1] doubleValue];

        return min * 60 + sec;
    }

    return 0;
}
@end
