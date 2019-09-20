//
//  YXYIosBasic_UILabelNSLineBreakModeVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/19.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UILabelNSLineBreakModeVC.h"

@interface YXYIosBasic_UILabelNSLineBreakModeVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;
@property (nonatomic, strong) UILabel *label;

@end

@implementation YXYIosBasic_UILabelNSLineBreakModeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //    UIFont;
    self.arrayData = @[@"ByWordWrapping",@"ByCharWrapping ",@"ByClipping ",@"ByTruncatingHead",@"ByTruncatingTail（默认） ",@"ByTruncatingMiddle"];
    self.arrayVC = @[@"以单词为单位, 自动换行, 显示不全, 没有省略号",@"以字符为单位自动换行, 没有省略号", @"--- 直接切除, 可能显示半个字符", @"在行头部, 显示省略号", @"在行尾部, 显示省略号",@"在行中间, 显示省略号"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.label];
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
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = self.arrayData[indexPath.row];
    cell.detailTextLabel.text = self.arrayVC[indexPath.row];
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
    self.label.lineBreakMode = (NSLineBreakMode)indexPath.row;
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
- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 200, 50)];
        _label.font = FONT(14);
        _label.numberOfLines = 0;
        _label.backgroundColor = [UIColor yellowColor];
        _label.textColor = [UIColor redColor];
        _label.text = @"我是第一行占位的文字这里有hello word单词,欢迎来到我的app里，大家一起学习知识";
    }
    return _label;
}
@end

