//
//  YXYIosBasic_appLifeCycleVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/14.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_appLifeCycleVC.h"

#import "IDMPhotoBrowser.h"

@interface YXYIosBasic_appLifeCycleVC ()



@end

@implementation YXYIosBasic_appLifeCycleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = YXYIosBasic_dataCenter.shareDataCenter.lifeCycleSelectorList;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看图片" style:(UIBarButtonItemStyleDone) target:self action:@selector(actionCheckImage)];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.arrayData = YXYIosBasic_dataCenter.shareDataCenter.lifeCycleSelectorList;
    [self.tableView reloadData];
}
- (void)actionCheckImage {
    UIImage *image = [UIImage imageNamed:@"app生命周期管理"];
    IDMPhoto *photo =   [[IDMPhoto alloc] initWithImage:image];
    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:@[photo]];
    [self presentViewController:browser animated:YES completion:nil];
    
    
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
