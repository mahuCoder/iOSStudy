//
//  YXYIosBasic_lifeCycleVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/14.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_lifeCycleVC.h"

@interface YXYIosBasic_lifeCycleVC ()

@end

@implementation YXYIosBasic_lifeCycleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"app生命周期",@"viewController生命周期",@"对象生命周期"];
    self.arrayVC = @[@"YXYIosBasic_appLifeCycleVC",@"YXYIosBasic_viewControllerLifeCycleVC",@"YXYIosBasic_objectLifeCycleVC"];
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
