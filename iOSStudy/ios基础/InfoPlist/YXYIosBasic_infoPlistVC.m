//
//  YXYIosBasic_infoPlistVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/19.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_infoPlistVC.h"

@interface YXYIosBasic_infoPlistVC ()<UITableViewDelegate>

@end

@implementation YXYIosBasic_infoPlistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"NSCameraUsageDescription",@"NSFaceIDUsageDescription",@"NSMicrophoneUsageDescription",@"NSAllowsArbitraryLoads",@"UIUserInterfaceStyle"];
    // Do any additional setup after loading the view.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [ToastManager showToast:@"允许应用使用您的相机拍照获取图片发送"];
    } else if (indexPath.row == 1) {
        [ToastManager showToast:@"允许应用使用获取面部识别"];
    } else if (indexPath.row == 2) {
        [ToastManager showToast:@"允许应用使用您的麦克风进行音频录制"];
    } else if (indexPath.row == 3) {
        [ToastManager showToast:@"yes,允许http访问"];
    } else if (indexPath.row == 4) {
        [ToastManager showToast:@"Light，关闭暗黑模式"];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
