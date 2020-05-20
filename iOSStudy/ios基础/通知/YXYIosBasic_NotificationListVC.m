//
//  YXYIosBasic_NotificationListVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/20.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_NotificationListVC.h"

@interface YXYIosBasic_NotificationListVC ()

@end

@implementation YXYIosBasic_NotificationListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayData = @[@"通知NSNotification",@"本地通知",@"远程通知"];
    self.arrayVC = @[@"YXYIosBasic_NotificationCenterAcceptVC",@"YXYIosBasic_LocationNotificationVC",@""];
    // Do any additional setup after loading the view.
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
