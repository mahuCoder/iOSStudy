//
//  YXYIosBasic_UINavigationDefaultExample.m
//  iOSStudy
//
//  Created by sunny on 2020/3/25.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UINavigationDefaultExample.h"

@interface YXYIosBasic_UINavigationDefaultExample ()

@end

@implementation YXYIosBasic_UINavigationDefaultExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 150, 30)];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [button setTitle:@"y=64,点击返回" forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(actiionBack) forControlEvents:(UIControlEventTouchUpInside)];
    // Do any additional setup after loading the view.
}
- (void)actiionBack {
    [self.navigationController popViewControllerAnimated: YES];
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
