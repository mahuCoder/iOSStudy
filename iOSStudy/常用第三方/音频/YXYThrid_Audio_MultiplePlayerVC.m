//
//  YXYThrid_Audio_MultiplePlayerVCViewController.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/27.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_Audio_MultiplePlayerVC.h"
#import <AVFoundation/AVFoundation.h>
#import "PathUtility.h"
@interface YXYThrid_Audio_MultiplePlayerVC ()<AVAudioPlayerDelegate>
{
    
}
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *compoundButton;
@property (nonatomic, strong) UIButton *audioPlayerBUtton;
@property (nonatomic, strong) UIButton *synchAudioPlayer;
@property (nonatomic, strong) NSString  *price;

@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) NSMutableArray *arrayData;


@end

@implementation YXYThrid_Audio_MultiplePlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.compoundButton];
    [self.view addSubview:self.audioPlayerBUtton];
    [self.view addSubview:self.synchAudioPlayer];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@49);
    }];
    [self.compoundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(-ScreenWidth/4);
        make.top.equalTo(self.textField.mas_bottom).offset(50);
    }];
    [self.audioPlayerBUtton mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.offset(ScreenWidth/4);
          make.top.equalTo(self.textField.mas_bottom).offset(50);
      }];
    [self.synchAudioPlayer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.audioPlayerBUtton.mas_bottom).offset(30);
    }];
}

- (NSString *)getPrice
{
    [self.view endEditing:YES];
    if (! [self.textField.text doubleValue]) {
        return nil;
    }
   
    NSString *str = [NSString stringWithFormat:@"%.2lf",[self.textField.text doubleValue]];
    return str;
}
- (NSArray *)getVoiceListWithPrice:(NSString *)price
{
    if (!price) {
        return nil;
    }
    NSArray *array_count = [price componentsSeparatedByString:@"."];
     if (array_count.count > 2) {
         return nil;
     }
     NSString *maxNum = array_count[0];
     if ([maxNum containsString:@"¥"]) {
         maxNum = [maxNum substringFromIndex:1];
     }
     if (maxNum.length > 8) {//上亿金额播放
         [ToastManager showError:@"金额过大不能播放"];
         return nil;
     }
     NSMutableArray *arrayM_int = [NSMutableArray array];
     NSArray *array_unit = @[@"thousand",@"hundred",@"10",@"wan",@"thousand",@"hundred",@"10",@""];
    for(int i =0; i < [maxNum length]; i++)
    {
        [arrayM_int addObject: [maxNum substringWithRange:NSMakeRange(i, 1)]];
    }
    //插入单位
   for (int i = 0; i < arrayM_int.count ; i ++) {
        int index = (int)arrayM_int.count  - 2 * i;
        if (index == 0) {
            break;
        }
        [arrayM_int insertObject:array_unit[array_unit.count - 1 - i] atIndex:index];
    }
    //去除0后单位（为0万是不读0）
    for (int i = 0; i < arrayM_int.count ; i ++) {
        NSString * str_i = arrayM_int[i];
        if ([str_i isEqualToString:@"0"]) {
            if ([arrayM_int[i + 1] isEqualToString:@"wan"]) {
                [arrayM_int replaceObjectAtIndex:i withObject:@""];
            } else {
                [arrayM_int replaceObjectAtIndex:i+1 withObject:@""];
            }
        }
        i ++;
    }
    //移除不读
     [arrayM_int removeObject:@""];
    //多个0合并
    NSMutableArray *array_data = [NSMutableArray array];
    int i = 0;
    for (NSString *str in arrayM_int) {
        if (i == 0) {
            [array_data addObject:str];
        } else {
            if (![str isEqualToString:@"0"]) {
                [array_data addObject:str];
            } else {
                NSString *str_last = [array_data lastObject];
                if (![str_last isEqualToString:@"0"]) {
                    [array_data addObject:str];
                }
            }
        }
        i ++;
    }
   //个位为0时 且整数不为0 个位不读
        if ([[array_data lastObject] isEqualToString:@"0"] && array_data.count > 1) {
//                [array_data replaceObjectAtIndex:(array_data.count - 1) withObject:@""];
            [array_data removeLastObject];
           }
       //去除万位上0
       if ([array_data indexOfObject:@"wan"] != NSNotFound) {
           NSInteger index = [array_data indexOfObject:@"wan"];
           if (index > 1 && [array_data[index - 1] doubleValue] == 0) {
               [array_data removeObjectAtIndex:index-1];
           }
       }
       //添加小数后面
        if (array_count.count == 2 ) {
            NSString *count =  array_count[1];
            if ([count intValue] > 0) {// 9
                [array_data addObject:@"count"];
               NSMutableArray *array_limit = [NSMutableArray array];
               for(int i =0; i < [array_count[1] length]; i++)
               {
                   [array_limit addObject: [array_count[1] substringWithRange:NSMakeRange(i, 1)]];
               }
               for (NSString *str in array_limit) {
                   [array_data addObject:str];
               }
            }
        }
    //添加前缀
     [array_data insertObject:@"pay" atIndex:0];
    //添加单位
     [array_data addObject:@"unit"];
   return array_data;
}


#pragma mark 合成播放
- (void)actionCompound
{
    NSArray *array = [self getVoiceListWithPrice:[self getPrice]];
    if (!array.count) {
//        [ToastManager showError:@"没有资源文件"];
        return;
    }
     CMTime lastDuration = kCMTimeZero;//上一段播放时间
          AVMutableComposition *composition = [AVMutableComposition composition];
          for (NSString *item in array) {
              NSString *path = [[NSBundle mainBundle] pathForResource:item ofType:@"mp3"];
              if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
                  break;
              }
                 AVURLAsset *audioAsset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:path]];
                    // 音频轨道
                    AVMutableCompositionTrack *audioTrack = [composition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:0];
                    // 音频素材轨道
                    AVAssetTrack *audioAssetTrack = [[audioAsset tracksWithMediaType:AVMediaTypeAudio] firstObject];
                 // 音频合并 - 插入音轨文件
    //           CMTime audioDuration = CMTimeMake(audioAsset.duration.value + 48000, audioAsset.duration.timescale);
                 [audioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, audioAsset.duration) ofTrack:audioAssetTrack atTime:lastDuration error:nil];
              lastDuration = CMTimeMake(audioAsset.duration.value + lastDuration.value, audioAsset.duration.timescale);
    //          lastDuration = audioAsset.duration + 0.02;
              
              NSLog(@"音频时长%lld ,%lld, %d",lastDuration.value / lastDuration.timescale, lastDuration.value, lastDuration.timescale);
            }
        // 合并后的文件导出 - `presetName`要和之后的`session.outputFileType`相对应。
              AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:composition presetName:AVAssetExportPresetAppleM4A];
        NSArray*filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
        NSString *path = filePaths[0];
           NSString *outPutFilePath = [path stringByAppendingPathComponent:@"xin.m4a"];
           
           if ([[NSFileManager defaultManager] fileExistsAtPath:outPutFilePath]) {
               [[NSFileManager defaultManager] removeItemAtPath:outPutFilePath error:nil];
           }

           // 查看当前session支持的fileType类型
           NSLog(@"---%@",[session supportedFileTypes]);
           session.outputURL = [NSURL fileURLWithPath:outPutFilePath];
           session.outputFileType = AVFileTypeAppleM4A; //与上述的`present`相对应
           session.shouldOptimizeForNetworkUse = YES;   //优化网络
           
            @weakify(self)
           [session exportAsynchronouslyWithCompletionHandler:^{
               if (session.status == AVAssetExportSessionStatusCompleted) {
                    @strongify(self)
                   NSLog(@"合并成功----%@", outPutFilePath);
                   self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:outPutFilePath] error:nil];
                   [self.player play];
               } else {
                   [ToastManager showError:[NSString stringWithFormat:@"语音播放失败，状态%ld", session.status]];
                   // 其他情况, 具体请看这里`AVAssetExportSessionStatus`.
               }
           }];
}
- (void)actionSynchAudioPlayer
{
      NSArray *array = [self getVoiceListWithPrice:[self getPrice]];
        if (!array.count) {
            return;
        }
    for (NSString *item in array) {
        NSString *path = [[NSBundle mainBundle] pathForResource:item ofType:@"mp3"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
            break;
        }
        AVURLAsset *audioAsset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:path]];
        NSError *error;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:path] error:&error];
        [self.player play];
        double time = audioAsset.duration.value / (audioAsset.duration.timescale * 1.0000000);
        usleep(time * 1000000);
    }
}
- (void)actionAudioPlayer
{
    self.arrayData = [self getVoiceListWithPrice:[self getPrice]].mutableCopy;
    if (self.arrayData.count) {
         NSString *path = [[NSBundle mainBundle] pathForResource:self.arrayData[0] ofType:@"mp3"];
        NSError *error;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:path] error:&error];
        if (!error) {
            [self.arrayData removeObjectAtIndex:0];
        }
        self.player.delegate = self;
        [self.player play];
    }
}

/* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the player is stopped due to an interruption. */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (self.arrayData.count) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.arrayData[0] ofType:@"mp3"];
        NSError *error;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:path] error:&error];
        if (!error) {
            [self.arrayData removeObjectAtIndex:0];
        } else {
            NSLog(@"出错了");
        }
        [self.player play];
        self.player.delegate = self;
    }
    NSLog(@"播放完成");
    
}

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error
{
    
}
- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = FONT(14);
        _textField.backgroundColor = HEXCOLOR(0xe6e6e6);
        _textField.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return  _textField;
}
- (UIButton *)compoundButton
{
    if (!_compoundButton) {
        _compoundButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_compoundButton setTitle:@"合成播放" forState:(UIControlStateNormal)];
        [_compoundButton setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        [_compoundButton addTarget:self action:@selector(actionCompound) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _compoundButton;
}

- (UIButton *)audioPlayerBUtton
{
    if (!_audioPlayerBUtton) {
        _audioPlayerBUtton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_audioPlayerBUtton setTitle:@"顺序播放" forState:(UIControlStateNormal)];
        [_audioPlayerBUtton setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        [_audioPlayerBUtton addTarget:self action:@selector(actionAudioPlayer) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _audioPlayerBUtton;
}

- (UIButton *)synchAudioPlayer
{
    if (!_synchAudioPlayer) {
        _synchAudioPlayer = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_synchAudioPlayer setTitle:@"循环同步播放" forState:(UIControlStateNormal)];
        [_synchAudioPlayer setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        [_synchAudioPlayer addTarget:self action:@selector(actionSynchAudioPlayer) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _synchAudioPlayer;
}

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
    }
    return _arrayData;
}
@end
