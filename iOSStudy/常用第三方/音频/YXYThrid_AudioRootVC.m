//
//  YXYThrid_AudioRootVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/25.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_AudioRootVC.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
//#import ""
@interface YXYThrid_AudioRootVC ()<UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;
@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation YXYThrid_AudioRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"播放系统音频",@"播放本地音频",@"音乐播放器",@"播放多段音频"];
    self.arrayVC = @[@"", @"YXYThrid_Audio_locationPlayerVC",@"YXYThrid_Audio_MusicPlayerListVC",@""];
    [self.view addSubview:self.tableView];
    
    
    
    //    self.tableView mas
}

#pragma mark --------------------------网络处理--------------------------


#pragma mark --------------------------点击事件--------------------------


#pragma mark --------------------------delegate&datasoure---------------
#pragma mark  -------------deleget & dataSource------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = self.arrayData[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            {//这个用系统声音，建议在30s内
                NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pay" ofType:@"m4a"];
                NSURL *fileUrl = [NSURL URLWithString:filePath];
                //如果文件地址不存在，就播放soundID
                SystemSoundID soundID = 1007;
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
                  //只播放声音，没振动
//                   AudioServicesAddSystemSoundCompletion(soundID,NULL,NULL,soundCompleteCallBack,NULL);
//                AudioServicesPlaySystemSound(soundID);
                 //播放声音和振动
                AudioServicesPlayAlertSoundWithCompletion(soundID, ^{
                       //播放成功回调
                   });
            }
            break;
        case 1:
            {
               
//                NSArray *array = @[@"pay",@"pay"];
//                CMTime lastDuration = kCMTimeZero;//上一段播放时间
//                   AVMutableComposition *composition = [AVMutableComposition composition];
//                   for (NSString *item in array) {
//                       NSString *path = [[NSBundle mainBundle] pathForResource:item ofType:@"m4a"];
//
//                          AVURLAsset *audioAsset1 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:path]];
//                             // 音频轨道
//                             AVMutableCompositionTrack *audioTrack1 = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
//                             // 音频素材轨道
//                             AVAssetTrack *audioAssetTrack1 = [[audioAsset1 tracksWithMediaType:AVMediaTypeAudio] firstObject];
//                          // 音频合并 - 插入音轨文件
//                          [audioTrack1 insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset1.duration) ofTrack:audioAssetTrack1 atTime:lastDuration error:nil];
//                       lastDuration = audioAsset1.duration;
//
//                   }
//                // 合并后的文件导出 - `presetName`要和之后的`session.outputFileType`相对应。
//                           AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:composition presetName:AVAssetExportPresetAppleM4A];
//                        NSArray*filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
//                        NSString *path = filePaths[0];
//                      NSString *outPutFilePath = [path stringByAppendingPathComponent:@"xin.m4a"];
//
//                      if ([[NSFileManager defaultManager] fileExistsAtPath:outPutFilePath]) {
//                          [[NSFileManager defaultManager] removeItemAtPath:outPutFilePath error:nil];
//                      }
//
//                      // 查看当前session支持的fileType类型
//                      NSLog(@"---%@",[session supportedFileTypes]);
//                      session.outputURL = [NSURL fileURLWithPath:outPutFilePath];
//                      session.outputFileType = AVFileTypeAppleM4A; //与上述的`present`相对应
//                      session.shouldOptimizeForNetworkUse = YES;   //优化网络
//
//                      [session exportAsynchronouslyWithCompletionHandler:^{
//                          if (session.status == AVAssetExportSessionStatusCompleted) {
//                              NSLog(@"合并成功----%@", outPutFilePath);
//                              _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:outPutFilePath] error:nil];
//                              [_player play];
//                          } else {
//                              // 其他情况, 具体请看这里`AVAssetExportSessionStatus`.
//                          }
//                      }];
            }
            break;
        case 2:
            {
                UIViewController *vc = [[NSClassFromString(self.arrayVC[indexPath.row]) alloc] init];
                  vc.title = self.arrayData[indexPath.row];
                  [self.navigationController pushViewController:vc animated:YES];
//                NSString *file_base = [[NSBundle mainBundle] pathForResource:@"pay" ofType:@"m4a"];
//                NSString *file_1 = [[NSBundle mainBundle] pathForResource:@"pay" ofType:@"m4a"];
//                AVURLAsset *audioAsset1 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:file_base]];
//                AVURLAsset *audioAsset2 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:file_1]];
//                AVURLAsset *audioAsset3 = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:file_1]];
//
//                AVMutableComposition *composition = [AVMutableComposition composition];
//
//                   // 音频轨道
//                   AVMutableCompositionTrack *audioTrack1 = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
//                   AVMutableCompositionTrack *audioTrack2 = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
//                 AVMutableCompositionTrack *audioTrack3 = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
//                   // 音频素材轨道
//                   AVAssetTrack *audioAssetTrack1 = [[audioAsset1 tracksWithMediaType:AVMediaTypeAudio] firstObject];
//                AVAssetTrack *audioAssetTrack2 = [[audioAsset2 tracksWithMediaType:AVMediaTypeAudio] firstObject];
//                AVAssetTrack *audioAssetTrack3 = [[audioAsset3 tracksWithMediaType:AVMediaTypeAudio] firstObject];
//
//                // 音频合并 - 插入音轨文件
//                [audioTrack1 insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset1.duration) ofTrack:audioAssetTrack1 atTime:kCMTimeZero error:nil];
//                NSLog(@"%lld, %d, %d,", audioAsset1.duration.value, audioAsset1.duration.timescale, audioAsset1.duration.flags);
//
//                [audioTrack2 insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset2.duration) ofTrack:audioAssetTrack2 atTime:audioAsset1.duration error:nil];
//                 NSLog(@"%lld, %d, %d,", audioAsset2.duration.value, audioAsset2.duration.timescale, audioAsset2.duration.flags);
//                [audioTrack3 insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset2.duration) ofTrack:audioAssetTrack2 atTime:audioAsset2.duration error:nil];
//                 NSLog(@"%lld, %d, %d,", audioAsset3.duration.value, audioAsset3.duration.timescale, audioAsset3.duration.flags);
//                // 合并后的文件导出 - `presetName`要和之后的`session.outputFileType`相对应。
//                   AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:composition presetName:AVAssetExportPresetAppleM4A];
//
//
//                NSArray*filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
//                NSString *path = filePaths[0];
//
//
//                   NSString *outPutFilePath = [path stringByAppendingPathComponent:@"xindong.m4a"];
//
//                   if ([[NSFileManager defaultManager] fileExistsAtPath:outPutFilePath]) {
//                       [[NSFileManager defaultManager] removeItemAtPath:outPutFilePath error:nil];
//                   }
//
//                   // 查看当前session支持的fileType类型
//                   NSLog(@"---%@",[session supportedFileTypes]);
//                   session.outputURL = [NSURL fileURLWithPath:outPutFilePath];
//                   session.outputFileType = AVFileTypeAppleM4A; //与上述的`present`相对应
//                   session.shouldOptimizeForNetworkUse = YES;   //优化网络
//
//                   [session exportAsynchronouslyWithCompletionHandler:^{
//                       if (session.status == AVAssetExportSessionStatusCompleted) {
//                           NSLog(@"合并成功----%@", outPutFilePath);
//                           _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:outPutFilePath] error:nil];
//                           [_player play];
//                       } else {
//                           // 其他情况, 具体请看这里`AVAssetExportSessionStatus`.
//                       }
//                   }];
                
//                NSMutableData *data_M = [[NSMutableData alloc] initWithData:data];
//                [data_M appendData:data_1];
//                NSError *error;
//                self.player = [[AVAudioPlayer alloc] initWithData:data_M error:&error];
//                self.player.delegate = self;
////                //获取系统的声音
//                      AVAudioSession *audioSession = [AVAudioSession sharedInstance];
//                      CGFloat currentVol = audioSession.outputVolume;
//                  //设置播放器声音
//
//                        _player.volume = currentVol;
//                        //设置播放速率
//                        _player.rate = 1.0;
//                        //设置播放次数，负数代表无限循环
//                //        _player.numberOfLoops = 1;
//                        //预加载资源
//                        [_player prepareToPlay];
//                NSLog(@"%@", error);
//                [self.player play];
            }
            break;
        default:
            break;
    }
}
#pragma mark -- delegate
// 音频播放完成时
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    NSLog(@"播放完成");
}

// 音频播放出错时
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error{
    NSLog(@"播放出错了");
}
void soundCompleteCallBack(SystemSoundID soundID, void *clientData)
{
   NSLog(@"播放完成");
}

#pragma mark --------------------------初始化UI---------------------------

#pragma mark --------------------------懒加载-----------------------------
#pragma mark tableView-lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:yhCellID];
    }
    return _tableView;
}
@end

