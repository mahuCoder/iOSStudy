//
//  YXYIosBasic_otherVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/14.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_otherVC.h"

@interface YXYIosBasic_otherVC ()

@end

@implementation YXYIosBasic_otherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"xcode配置",@"pch添加",@"cocoapods安装"];
    // Do any additional setup after loading the view.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [ToastManager showToast:@"详见内部代码"];
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
