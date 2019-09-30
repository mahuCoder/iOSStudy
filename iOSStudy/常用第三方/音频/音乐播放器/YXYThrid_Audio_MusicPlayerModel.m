//
//  YXYThrid_Audio_MusicPlayerModel.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/29.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_Audio_MusicPlayerModel.h"

@implementation YXYThrid_Audio_MusicPlayerModel

- (void)setSingerIcon:(NSString *)singerIcon {
    _singerIcon = QQResources([@"Images" stringByAppendingPathComponent:singerIcon]);
}

- (void)setLrcname:(NSString *)lrcname {
    _lrcname = QQResources([@"Lrcs" stringByAppendingPathComponent:lrcname]);
}

- (void)setFilename:(NSString *)filename {
    _filename = QQResources([@"MP3s" stringByAppendingPathComponent:filename]);
}

- (void)setIcon:(NSString *)icon {
    _icon = QQResources([@"Images" stringByAppendingPathComponent:icon]);
}

@end
