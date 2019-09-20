//
//  YXYThrid_UmengRootVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/9.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_UmengRootVC.h"
#import <UMAnalytics/MobClick.h>

@interface YXYThrid_UmengRootVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;

@end

@implementation YXYThrid_UmengRootVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView: NSStringFromClass([self class])];
}
- (void)viewWillDisappear:(BOOL)animated
{
     [super viewWillDisappear:animated];
     [MobClick endLogPageView: NSStringFromClass([self class])];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayData = @[@"友盟分享",@"友盟统计",@"友盟页面统计",@"友盟事件统计"];
    
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
    if (!cell)
    {
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
    switch (indexPath.row) {
       case 0:
        {
            
        }
            break;
        case 1:
        {
         //appdelegate添加
//             [MobClick setScenarioType:E_UM_NORMAL];//支持普通场景
        }
            break;
        case 2:
        {
          
//           appdelegate添加 [MobClick setAutoPageEnabled:YES];
//
              //在需要统计的页面
//            - (void)viewWillAppear:(BOOL)animated
//            {
//                [super viewWillAppear:animated];
//                [MobClick beginLogPageView: NSStringFromClass([self class])];
//            }
//            - (void)viewWillDisappear:(BOOL)animated
//            {
//                [super viewWillDisappear:animated];
//                [MobClick endLogPageView: NSStringFromClass([self class])];
//            }
        }
            break;
            case 3:
        {
            [MobClick event:@"UMengClcik"];
            [MobClick event:@"UMengClcik_more" attributes:@{@"key":@"value"}];
        }
            break;
        default:
            break;
    }
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
