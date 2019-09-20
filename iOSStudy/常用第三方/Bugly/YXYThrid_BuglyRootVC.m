//
//  YXYThrid_BuglyRootVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/9.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_BuglyRootVC.h"


@interface YXYThrid_BuglyRootVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;

@end

@implementation YXYThrid_BuglyRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //https://bugly.qq.com/docs/user-guide/instruction-manual-ios/?v=20180709165613
    //pod 'Bugly'
    //在工程AppDelegate.m的application:didFinishLaunchingWithOptions:方法中初始化：
    //[Bugly startWithAppId:@"此处替换为你的AppId"];
    self.arrayData = @[@"发送数组崩溃",@"对数组取字典值",@"发送不存在方法",@"移除不存在通知"];

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
    switch (indexPath.row) {
        case 0:
            {
                NSLog(@"%@", [@[] objectAtIndex:0]);
            }
            break;
        case 1:
        {
            id arrray = @[];
            NSDictionary *dict = arrray;
           NSLog(@"%@",dict[@"key"]) ;
        }
            break;
        case 2:
        {
            id arrray = @[];
            YXYThrid_BuglyRootVC *vc = arrray;
            [vc viewDidLoad];
        }
            break;
        case 3:
        {
            [self removeObserver:self forKeyPath:@"URL"];
        }
            break;
        case 4:
        {
           
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
