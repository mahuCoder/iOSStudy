//
//  YXYThrid_Audio_MusicPlayerModel.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/29.
//  Copyright © 2019 yunhun. All rights reserved.
//

#define QQResources(file) [@"QQResources.bundle/" stringByAppendingString:file]


#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface YXYThrid_Audio_MusicPlayerModel : NSObject<YYModel>


/** 歌曲名称*/
@property (nonatomic, copy) NSString *name;

/** 演唱者*/
@property (nonatomic, strong) NSString *singer;

/** 歌手头像*/
@property (nonatomic, strong) NSString *singerIcon;

/** 歌词文件名称*/
@property (nonatomic, strong) NSString *lrcname;

/** 歌曲文件名称*/
@property (nonatomic, strong) NSString *filename;

/** 专辑图片*/
@property (nonatomic, strong) NSString *icon;



@end

NS_ASSUME_NONNULL_END
