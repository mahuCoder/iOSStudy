//
//  YXYIosBasic_blockVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/19.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_blockVC.h"

@interface YXYIosBasic_blockVC ()

@end

@implementation YXYIosBasic_blockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayData = @[@"block的写法",@"block的实例",@"block进阶"];
    self.arrayVC = @[@"YXYIosBasic_block_writeVC",@"YXYIosBasic_block_exapmleVC",@"YXYIosBasicWebViewController"];
    // Do any additional setup after loading the view.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[NSClassFromString(self.arrayVC[indexPath.row]) alloc] init];
    if (vc) {
        if ([vc isKindOfClass:[YXYIosBasicWebViewController class]]) {
            YXYIosBasicWebViewController *webVC = (YXYIosBasicWebViewController *)vc;
            webVC.path = @"https://www.jianshu.com/p/4e79e9a0dd82";
        }
        [self.navigationController pushViewController:vc animated:YES];
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
