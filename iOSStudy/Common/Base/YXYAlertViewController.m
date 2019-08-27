//
//  YXYAlertViewController.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/21.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYAlertViewController.h"

@interface YXYAlertViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation YXYAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIToolbar *tool = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 40.0f, self.view.frame.size.width, 40.0f)];
    tool.barStyle = UIBarStyleDefault;
//    tool.backgroundColor = [UIColor orangeColor];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(ationCancel)];
    UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(ationSure)];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:NULL];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:NULL action:NULL];
    addItem.enabled = NO;
    [tool setItems:@[cancelItem,spaceItem,confirmItem]];
    
    [self.view addSubview:tool];
    [tool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(tool.mas_bottom);
    }];
    //    self.tableView mas
}

#pragma mark --------------------------网络处理--------------------------


#pragma mark --------------------------点击事件--------------------------
- (void)actionSwitch:(UISwitch *)sender
{
    NSInteger index = sender.tag - 100;
    NSMutableDictionary *dictM = self.arrayData[index];
    dictM[@"isSel"] = [NSNumber numberWithBool:sender.on];
}
- (void)ationCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)ationSure
{
    if (self.block) {
        self.block();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
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
    cell.textLabel.text = [self.arrayData[indexPath.row] objectForKey:@"title"];
    if ([[self.arrayData[indexPath.row] objectForKey:@"title"] boolValue]) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [btn setTitle:@"🔘" forState:(UIControlStateNormal)];
        cell.accessoryView = btn;
    } else {
        UISwitch *switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        switchBtn.tag = indexPath.row + 100;
        switchBtn.on = [[self.arrayData[indexPath.row] objectForKey:@"isSel"] boolValue];
        [switchBtn addTarget:self action:@selector(actionSwitch:) forControlEvents:(UIControlEventValueChanged)];
        cell.accessoryView = switchBtn;
    }
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
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
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
