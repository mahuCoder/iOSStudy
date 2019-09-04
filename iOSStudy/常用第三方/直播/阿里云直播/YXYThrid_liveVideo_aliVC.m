//
//  YXYThrid_liveVideo_aliVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/30.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_liveVideo_aliVC.h"
#import <AlivcLivePusher/AlivcLivePusherHeader.h>
#import <AlivcLibFace/AlivcLibFaceManager.h>
#import <ALivcLibBeauty/AlivcLibBeautyManager.h>
#import "YXYThrid_liveVideoPreView.h"
#import "YXY_CountdowTimeLabel.h"
//
@interface YXYThrid_liveVideo_aliVC ()<AlivcLivePusherInfoDelegate,AlivcLivePusherErrorDelegate,AlivcLivePusherNetworkDelegate,AlivcLivePusherBGMDelegate,AlivcLivePusherSnapshotDelegate,AlivcLivePusherCustomFilterDelegate,AlivcLivePusherCustomDetectorDelegate>
{

}
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong)AlivcLivePushConfig *pushConfig;//推流配置
@property (nonatomic, strong) AlivcLivePusher *livePusher;
@property (nonatomic, strong) YXYThrid_liveVideoPreView *preView;


@end
@implementation YXYThrid_liveVideo_aliVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置推流状态监听回调
    [self.livePusher setInfoDelegate:self];
    [self.livePusher setErrorDelegate:self];
    [self.livePusher setNetworkDelegate:self];
    [self.livePusher setBGMDelegate:self];
//    [self.livePusher setSnapshotDelegate:self];
    [self.livePusher setCustomFilterDelegate:self];
    [self.livePusher setCustomDetectorDelegate:self];
    //开始预览
    [self.livePusher startPreview:self.view];
    [self configSubViews];
}
#pragma mark ------------AlivcLivePusherInfoDelegate--------------
- (void)onPreviewStarted:(AlivcLivePusher *)pusher
{
    NSLog(@"开始预览");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [ToastManager showToast:@"开始预览"];
//    });

}
- (void)onPreviewStoped:(AlivcLivePusher *)pusher
{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [ToastManager showToast:@"停止预览"];
//    });
}
- (void)onFirstFramePreviewed:(AlivcLivePusher *)pusher
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [ToastManager showToast:@"第一帧"];
    });
}
- (void)onPushStarted:(AlivcLivePusher *)pusher
{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [ToastManager showToast:@"直播开始"];
//    });
    NSLog(@"直播开始");
}
- (void)onPushPaused:(AlivcLivePusher *)pusher
{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [ToastManager showToast:@"直播暂停"];
//    });
    NSLog(@"直播暂停");
}
- (void)onPushStoped:(AlivcLivePusher *)pusher
{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [ToastManager showToast:@"直播结束"];
//    });
    NSLog(@"直播结束");
}
- (void)onPushResumed:(AlivcLivePusher *)pusher
{
    NSLog(@"恢复直播");
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [ToastManager showToast:@"恢复直播"];
//    });
}
#pragma mark ------------AlivcLivePusherErrorDelegate--------------
- (void)onSystemError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error
{
    NSLog(@"系统错误");
}
- (void)onSDKError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error
{
    NSLog(@"SDK错误");
}
#pragma mark ------------AlivcLivePusherNetworkDelegate--------------
- (void)onNetworkPoor:(AlivcLivePusher *)pusher
{
    NSLog(@"网络差回调");
}
- (void)onConnectFail:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error
{
    NSLog(@"推流链接失败");
}
- (void)onConnectRecovery:(AlivcLivePusher *)pusher
{
    NSLog(@"网络恢复");
}
- (void)onReconnectStart:(AlivcLivePusher *)pusher
{
    NSLog(@"重连开始回调");
}
- (void)onReconnectSuccess:(AlivcLivePusher *)pusher
{
    NSLog(@"重连成功回调");
}
- (void)onConnectionLost:(AlivcLivePusher *)pusher
{
    NSLog(@"连接被断开");
}
- (void)onReconnectError:(AlivcLivePusher *)pusher error:(AlivcLivePushError *)error
{
    NSLog(@"重连失败回调");
}
- (void)onSendDataTimeout:(AlivcLivePusher *)pusher
{
     NSLog(@"发送数据超时");
}
- (NSString *)onPushURLAuthenticationOverdue:(AlivcLivePusher *)pusher
{
    NSLog(@"推流URL的鉴权时长即将过期(将在过期前1min内发送此回调)");
    return nil;//return 新的推流URL
}
#pragma mark ------------按钮事件--------------
- (void)actionClose
{
    if(self.livePusher) {
        [self.livePusher stopPush];
        [self.livePusher destory];
        self.livePusher = nil;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 开始直播
- (void)actionStarPush
{
    [self.preView removeFromSuperview];
    YXY_CountdowTimeLabel *label = [[YXY_CountdowTimeLabel alloc] init];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
    label.countTime = 3;
    [label startCount];
    @weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self)
        [self.livePusher startPushWithURLAsync:@"rtmp://video-center.alivecdn.com/test/stream45?vhost=push-demo.aliyunlive.com"];
//        [self.livePusher startPushWithURLAsync:@"rtmp://video-center.alivecdn.com/HUxuegang/StreamName?vhost=line.dfcapp.com"]
    });
}
- (void)updateSkin
{
  int num = [_livePusher setBeautyBuffing:100];
    
}
- (void)actionStarPreView:(UIButton *)sender
{
    [_livePusher startPreview:self.view];
}
- (void)actionStopPreView:(UIButton *)sender
{
    [_livePusher stopPreview];
}
- (void)actionStarPushView:(UIButton *)sender
{
    [_livePusher startPushWithURL:self.pushURL];
}
- (void)actionStopPush:(UIButton *)sender
{
    [_livePusher stopPush];
}
- (void)actionEndPush:(UIButton *)sender
{
//    [_livePusher ]
}
- (void)configSubViews
{
    [self.view addSubview:self.preView];
    [self.preView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.view addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(Height_StatusBar);
    }];
    
    _preView.pushConfig = self.pushConfig;
    _preView.titleBlock = ^(NSString * _Nonnull title) {
        NSLog(@"主题");
    };
    __weak typeof(self) wSelf = self;
    _preView.eventBlock = ^(YXYThrid_liveVideoPreViewEvent event) {
//        NSLog(@"");
        if (event == YXYThrid_liveVideoPreViewEventStarLive) {
            [wSelf actionStarPush];
        } else if (event == YXYThrid_liveVideoPreViewEventlensFlipFront) {
            [wSelf.livePusher switchCamera];
//            wSelf.pushConfig.cameraType = AlivcLivePushCameraTypeFront;
        } else if (event == YXYThrid_liveVideoPreViewEventlensFlipBack) {
              [wSelf.livePusher switchCamera];
//            wSelf.pushConfig.cameraType = AlivcLivePushCameraTypeBack;
        }
//        else {
////            [wSelf updateSkin];
//            [self.livePusher setBeautyBigEye:100];
//
//
//            [self.livePusher setBeautyOn:YES];
//            [self.livePusher setBeautyShortenFace:100];
//            [self.livePusher setBeautyWhite:100];
//            [self.livePusher setBeautyThinFace:100];
//        }
        else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_on) {
            [wSelf.livePusher setBeautyOn:wSelf.pushConfig.beautyOn];
        } else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyWhite) {
            [wSelf.livePusher setBeautyWhite:wSelf.pushConfig.beautyWhite];
        } else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyRuddy) {
            [wSelf.livePusher setBeautyRuddy:wSelf.pushConfig.beautyRuddy];
        } else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyBigEye) {
            [wSelf.livePusher setBeautyBigEye:wSelf.pushConfig.beautyBigEye];
        } else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyBuffing) {
            [wSelf.livePusher setBeautyBuffing:wSelf.pushConfig.beautyBuffing];
        } else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyThinFace) {
            [wSelf.livePusher setBeautyThinFace:wSelf.pushConfig.beautyThinFace];
        } else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyShortenFace) {
            [wSelf.livePusher setBeautyShortenFace:wSelf.pushConfig.beautyShortenFace];
        } else if (event == YXYThrid_liveVideoPreViewEventlensUpdateSkin_defalut) {

        }
    };
}
/**
 通知外置滤镜创建回调
 */
- (void)onCreate:(AlivcLivePusher *)pusher context:(void*)context
{
    [[AlivcLibBeautyManager shareManager] create:context];
}

- (void)updateParam:(AlivcLivePusher *)pusher buffing:(float)buffing whiten:(float)whiten pink:(float)pink cheekpink:(float)cheekpink thinface:(float)thinface shortenface:(float)shortenface bigeye:(float)bigeye
{
    [[AlivcLibBeautyManager shareManager] setParam:buffing whiten:whiten pink:pink cheekpink:cheekpink thinface:thinface shortenface:shortenface bigeye:bigeye];
}

- (void)switchOn:(AlivcLivePusher *)pusher on:(bool)on
{
    [[AlivcLibBeautyManager shareManager] switchOn:on];
}
/**
 通知外置滤镜处理回调
 */
- (int)onProcess:(AlivcLivePusher *)pusher texture:(int)texture textureWidth:(int)width textureHeight:(int)height extra:(long)extra
{
    return [[AlivcLibBeautyManager shareManager] process:texture width:width height:height extra:extra];
}
/**
 通知外置滤镜销毁回调
 */
- (void)onDestory:(AlivcLivePusher *)pusher
{
    [[AlivcLibBeautyManager shareManager] destroy];
}

#pragma mark - AlivcLivePusherCustomDetectorDelegate
/**
 通知外置视频检测创建回调
 */
- (void)onCreateDetector:(AlivcLivePusher *)pusher
{
    [[AlivcLibFaceManager shareManager] create];
}
/**
 通知外置视频检测处理回调
 */
- (long)onDetectorProcess:(AlivcLivePusher *)pusher data:(long)data w:(int)w h:(int)h rotation:(int)rotation format:(int)format extra:(long)extra
{
    return [[AlivcLibFaceManager shareManager] process:data width:w height:h rotation:rotation format:format extra:extra];
}
/**
 通知外置视频检测销毁回调
 */
- (void)onDestoryDetector:(AlivcLivePusher *)pusher
{
    [[AlivcLibFaceManager shareManager] destroy];
}

/**
 推流配置

 @return 推流配置参数
 */
- (AlivcLivePushConfig *)pushConfig
{
    if (!_pushConfig) {
        _pushConfig = [[AlivcLivePushConfig alloc] init];
        _pushConfig.beautyMode = AlivcLivePushBeautyModeProfessional;//人脸识别美颜
    }
    return _pushConfig;
}
- (AlivcLivePusher *)livePusher
{
    if (!_livePusher) {
        _livePusher = [[AlivcLivePusher alloc] initWithConfig:self.pushConfig];
    }
    return _livePusher;
}
- (YXYThrid_liveVideoPreView *)preView
{
    if (!_preView) {
        _preView = [[YXYThrid_liveVideoPreView alloc] init];
//        _preView.vi
    }
    return _preView;
}
- (UIButton *)closeBtn
{
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_closeBtn setImage:[UIImage imageNamed:@"aliLive_close"] forState:(UIControlStateNormal)];
        [_closeBtn addTarget:self action:@selector(actionClose) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _closeBtn;
}
@end
