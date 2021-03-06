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
+ (void)load {
    /*主要y静态引用或者动态加载就会触发此方法*/
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];

}
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
- (void)awakeFromNib {
    [super awakeFromNib];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}
- (void)loadView {
    [super loadView];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"返回可以查看这个控制器的生命周期";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.centerX.offset(0);
    }];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];
}
- (void)dealloc {
    [YXYIosBasic_dataCenter.shareDataCenter.lifeCycleViewControllerSelectorList addObject:NSStringFromSelector(_cmd)];

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
