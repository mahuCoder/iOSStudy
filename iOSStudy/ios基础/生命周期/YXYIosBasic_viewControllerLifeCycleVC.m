//
//  YXYIosBasic_viewControllerLifeCycleVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/16.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_viewControllerLifeCycleVC.h"
#import "YXYIosBasic_dataCenter.h"

@interface YXYIosBasic_viewControllerLifeCycleVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *arrayData;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YXYIosBasic_viewControllerLifeCycleVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.arrayData = [YXYIosBasic_dataCenter shareDataCenter].lifeCycleViewControllerSelectorList;
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UISegmentedControl *segmentC = [[UISegmentedControl alloc] initWithItems:@[@"普通加载",@"xib加载",@"stordboard加载"]];
    [segmentC addTarget:self action:@selector(actionSegment:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:segmentC];
    
    [self.view addSubview:self.tableView];
    [segmentC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(20);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(100, 0, 0, 0));
    }];
   
}
- (void)actionSegment:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            
        }
            break;
        case 1: {
            
        }
            break;
        case 2: {
            
        }
            break;
        default:
            break;
    }
}
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
}

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
