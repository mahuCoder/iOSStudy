//
//  YXYIosBasic_RootVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/4.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_RootVC.h"

@interface YXYIosBasic_RootVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}


@end

@implementation YXYIosBasic_RootVC
- (instancetype)init {
    if (self = [super init]) {
        self.title =  @"ios基础";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayData = @[@"UI篇",@"生命周期",@"block",@"通知",@"KVC/KVO",@"手势",@"代理",@"协议",@"类拓展",@"继承和多态",@"动画",@"OponGL",@"定时器",@"线程",@"RunTime",@"RunLoop",@"infoPlist",@"其他"];
    self.arrayVC = @[@"YXYIosBasic_UIRootVC",@"YXYIosBasic_lifeCycleVC", @"", @"", @"", @"", @"", @"",@"", @"", @"https://github.com/smalldu/IOS-Animations",@"", @"", @"", @"",@"",@"https://github.com/smalldu/IOS-Animations",@"YXYIosBasic_otherVC"];
    [self.view addSubview:self.tableView];
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
//    cell.textLabel.textColor = HEXCOLOR(0x999999);
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
    }
}

- (void)setTitle:(NSString *)title {
    self.navigationItem.title = title;
}
#pragma mark --------------------------初始化UI---------------------------

#pragma mark --------------------------懒加载-----------------------------
#pragma mark tableView-lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:yhCellID];
    }
    return _tableView;
}
@end

