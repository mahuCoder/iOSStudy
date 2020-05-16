//
//  YXYIosBasic_viewControllerLifeCycleTestVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/16.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_viewControllerLifeCycleTestVC.h"
#import "YXYIosBasic_dataCenter.h"
@interface YXYIosBasic_viewControllerLifeCycleTestVC ()

@end

@implementation YXYIosBasic_viewControllerLifeCycleTestVC
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
    if (self = [super initWithCoder:coder]) {
    }
    return self;
}
- (instancetype)init {
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
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
