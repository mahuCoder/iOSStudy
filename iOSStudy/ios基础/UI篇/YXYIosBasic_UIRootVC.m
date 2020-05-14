//
//  YXYIosBasic_UIRootVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/4.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIRootVC.h"

@interface YXYIosBasic_UIRootVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
//@dynamic
@property (nonatomic, strong)   UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;

@end

@implementation YXYIosBasic_UIRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"ios基础";
    self.arrayData = @[@"View",@"Label",@"Button",@"Image View",@"Text Field",@"Table View",@"Collection View", @"Navigation Bar&Item", @"Toolbar", @"Text View", @"Scroll View", @"Date picker", @"Picker View",@"WKWebView",@"Segmented Control",@"Slider",@"Switch",@"Activity Indicator View",@"Progress View",@"Page Control",@"Stepper",@"Stack View",@"Visual Effect View",
//                       @"Visual Effect View with Blur", @"Visual Effect Views with Blur and Vibrancy",
                       @"Map Kit View", @"MetalKit View", @"GLKit View", @"SceneKit View",@"SpirteKit View",@"ARKit SceneKit View",@"ARKit SpirteKit View",@"Web View",@"WebKit View",@"Container View"];
    self.arrayVC = @[@"YXYIosBasic_UIViewVC",@"YXYIosBasic_UILabelVC",
                     @"YXYIosBasic_UIButtonVC",@"YXYIosBasic_UIImageViewVC",
                     @"YXYIosBasic_UITextFieldVC",@"YXYIosBasic_UITableView",
                     @"",@"YXYIosBasic_UINavigation",
                     @"YXYIosBasic_UIToolbar",@"YXYIosBasic_UITextView",
                     @"YXYIosBasic_UIScrollView",@"YXYIosBasic_UIDatePickerView",
                     @"YXYIosBasic_UIPickerView",@"YXYIosBasic_UIWKWebViewVC",
                     @"YXYIosBasic_UISegmentedControl",@"YXYIosBasic_UISliderVC",
                     @"YXYIosBasic_UISwitchVC",@"YXYIosBasic_UIActivityIndicatorView",
                     @"YXYIosBasic_UIProgressView",@"YXYIosBasic_UIPageControl",
                     @"YXYIosBasic_UIStepper", @"YXYIosBasic_UIStackView",
                     @"YXYIosBasic_UIVisualEffectView", @"",
                     @"", @"",
                     @"", @"", @"",@"", @"", @"", @"", @"", @"", @"",@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    
    [self.view addSubview:self.tableView];
//    vie
    //    self.tableView mas
}

#pragma mark --------------------------网络处理--------------------------


#pragma mark --------------------------点击事件--------------------------


#pragma mark --------------------------delegate&datasoure---------------
#pragma mark  -------------deleget & dataSource------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = self.arrayData[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [[NSClassFromString(self.arrayVC[indexPath.row]) alloc] init];
    if (vc) {
        vc.title = self.arrayData[indexPath.row];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        [ToastManager showError:@"该功能暂时未开发"];
    }
}




@end

