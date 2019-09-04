//
//  YXYThrid_liveVideoPreSkinSetView.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/2.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AlivcLivePusher/AlivcLivePusherHeader.h>



NS_ASSUME_NONNULL_BEGIN
/*  beautyWhite 美白 默认 : 70 范围 : [0,100]
 beautyBuffing 磨皮参数 默认 : 40 范围 : [0,100]
 beautyRuddy  红润 默认 : 40 范围 : [0,100]
 beautyCheekPink 腮红参数 默认 : 15 范围 : [0,100]
 beautyThinFace 瘦脸参数  默认 : 40 范围 : [0,100]
 beautyShortenFace  收下巴参数 默认 : 50 范围 : [0,100]
 beautyBigEye 大眼参数 默认 : 30 范围 : [0,100]
 */
typedef NS_ENUM(NSUInteger, YXYThrid_liveVideoPreViewEvent) {
    YXYThrid_liveVideoPreViewEventStarLive,  //开始直播
    YXYThrid_liveVideoPreViewEventlensFlipFront, //镜头前置（默认）
    YXYThrid_liveVideoPreViewEventlensFlipBack,
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyWhite,//更新美颜_美白
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyBuffing,//更新美颜_磨皮
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyRuddy,//更新美颜_红润
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyThinFace,//更新美颜_瘦脸
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyShortenFace,//更新美颜_下巴
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyBigEye,//更新美颜_大眼
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_on,//更新美颜_开关
    YXYThrid_liveVideoPreViewEventlensUpdateSkin_defalut//更新美颜_默认
};

@interface YXYThrid_liveVideoPreSkinSetView : UIView

@property (nonatomic, strong)AlivcLivePushConfig *pushConfig;//推流配置

@property (nonatomic, copy) void(^ skinBlock)(YXYThrid_liveVideoPreViewEvent event);

@end

NS_ASSUME_NONNULL_END
