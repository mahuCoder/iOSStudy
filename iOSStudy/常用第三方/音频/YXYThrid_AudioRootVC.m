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
    self.arrayVC = @[@"", @"YXYThrid_Audio_locationPlayerVC",@"YXYThrid_Audio_MusicPlayerListVC",@"YXYThrid_Audio_MultiplePlayerVC"];
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

- (NSArray *)getVoiceList
{
    NSArray *array_count = [@"223544324.55" componentsSeparatedByString:@"."];
     if (array_count.count > 2) {
         return nil;
     }
     NSString *maxNum = array_count[0];
     if ([maxNum containsString:@"¥"]) {
         maxNum = [maxNum substringFromIndex:1];
     }
     if (maxNum.length > 8) {//上亿金额播放
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
           if (index > 1 && array_data[index - 1]) {
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            {//这个用系统声音，建议在30s内
                NSString *filePath = [[NSBundle mainBundle] pathForResource:@"pay" ofType:@"mp3"];
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

            }
            break;
        case 2:
            {
                UIViewController *vc = [[NSClassFromString(self.arrayVC[indexPath.row]) alloc] init];
                  vc.title = self.arrayData[indexPath.row];
                  [self.navigationController pushViewController:vc animated:YES];

            }
            break;
        case 3:
        {
            UIViewController *vc = (UIViewController *) [[NSClassFromString(self.arrayVC[indexPath.row])  alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
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

