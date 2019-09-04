//
//  YXYThrid_liveVideo_aliVC.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/30.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYBaseViewController.h"
#import <AlivcLivePusher/AlivcLivePusherHeader.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXYThrid_liveVideo_aliVC : YXYBaseViewController

/*
 集成条件 1、 bitcode 关闭
        2、  导入（           AlivcLibRtmp.framework
                            AlivcLivePusher.framework
                            AlivcLibBeauty.framework
                            AlivcLibFace.framework
                            AlivcLibFaceResource.bundle）
        3、导入SDK成功之后，在 Xcode > General > Embedded Binaries中添加SDK依赖：
 AlivcLivePusher.framework              推流SDK
 AlivcLibRtmp.framework                  RTMPSDK
 AlivcLibBeauty.framework               美颜库
 AlivcLibFace.framework                 人脸检测库
 AlivcLibFaceResource.bundle            人脸检测资源文件（人脸识别资源文件，如果您需要使用美颜的人脸识别高级功能，则必须导入开发工程；反之则不需要。）
 AliyunPlayerSDK.framework              播放器库
 AliThirdparty.framework                播放器依赖的第三方库
 AliyunLanguageSource.bundle            播放器依赖的资源文件
 
 */

@property (nonatomic, strong) NSString *pushURL;

@end

NS_ASSUME_NONNULL_END
