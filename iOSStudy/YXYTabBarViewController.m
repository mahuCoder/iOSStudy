//
//  YHYTabBarViewController.m
//  iOS技术学习总结
//
//  Created by 胡雪刚 on 2019/5/7.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYTabBarViewController.h"
#import "YXYThrid_RootVC.h"
#import "YXYIosBasic_RootVC.h"
#import "YXYOftenFunctionRootVC.h"
//#im


@interface YXYTabBarViewController ()

@end

@implementation YXYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *thrid_navc = [[UINavigationController alloc] initWithRootViewController:[[YXYThrid_RootVC alloc] init]];
    thrid_navc.title = @"三方";
    
    UINavigationController *basic_navc = [[UINavigationController alloc] initWithRootViewController:[[YXYIosBasic_RootVC alloc] init] ];
    basic_navc.title = @"基础";
    UINavigationController *offen_navc = [[UINavigationController alloc] initWithRootViewController:[[YXYOftenFunctionRootVC alloc] init] ];
    offen_navc.title = @"常用";
    self.viewControllers = @[basic_navc,thrid_navc,offen_navc];
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
