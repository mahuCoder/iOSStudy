//
//  YXYThrid_liveVideoRootVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/30.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_liveVideoRootVC.h"

@interface YXYThrid_liveVideoRootVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;

@end

@implementation YXYThrid_liveVideoRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"阿里云视频直播"];
    self.arrayVC = @[@"YXYThrid_liveVideo_aliVC"];
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
        if (indexPath.row == 0) {
            [self presentViewController:vc animated:YES completion:nil];
            return;
        }
        vc.title = self.arrayData[indexPath.row];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
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

