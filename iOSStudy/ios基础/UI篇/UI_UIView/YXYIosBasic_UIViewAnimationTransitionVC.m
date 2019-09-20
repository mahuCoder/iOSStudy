//
//  YXYIosBasic_UIViewAnimationTransitionVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIViewAnimationTransitionVC.h"

@interface YXYIosBasic_UIViewAnimationTransitionVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;

@property (nonatomic, strong) UIView *oldView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect orgRect;

@end

@implementation YXYIosBasic_UIViewAnimationTransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIViewAnimationTransitionNone,
//    UIViewAnimationTransitionFlipFromLeft,
//    UIViewAnimationTransitionFlipFromRight,
//    UIViewAnimationTransitionCurlUp,
//    UIViewAnimationTransitionCurlDown,
    self.view.backgroundColor = [UIColor whiteColor];
    self.arrayData = @[@"UIViewAnimationTransitionNone",@"UIViewAnimationTransitionFlipFromLeft",@"UIViewAnimationTransitionFlipFromRight",@"UIViewAnimationTransitionCurlUp",@"UIViewAnimationTransitionCurlDown",@"复位"];
    self.arrayVC = @[@"",@""];
    [self.view addSubview:self.tableView];
    self.oldView = [[UIView alloc] init];
    [self.view addSubview:self.oldView];
    [self.oldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-50);
        make.right.offset(-10);
        make.size.mas_equalTo(CGSizeMake(125, 152));
    }];
    self.oldView.backgroundColor = [UIColor purpleColor];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"example"]];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-50);
        make.left.offset(10);
        make.size.mas_equalTo(CGSizeMake(125, 152));
    }];
    
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
    if (indexPath.section == 0) {
        cell.textLabel.text = self.arrayData[indexPath.row];
    }
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
    if (CGRectEqualToRect(self.orgRect, CGRectZero)) {
        self.orgRect = self.imageView.frame;
    }
    if (indexPath.section == 0) {
        [UIView beginAnimations:@"beginAnimations" context:nil];
        [UIView setAnimationDuration:2];
        if (indexPath.row == 0) {
            [UIView setAnimationTransition:(UIViewAnimationTransitionNone) forView:self.imageView cache:YES];
            self.imageView.frame = self.oldView.frame;
            [UIView commitAnimations];
        } else  if (indexPath.row == 1) {
            [UIView setAnimationTransition:(UIViewAnimationTransitionFlipFromLeft) forView:self.imageView cache:YES];
            self.imageView.frame = self.oldView.frame;
            [UIView commitAnimations];
        } else  if (indexPath.row == 2) {
            [UIView setAnimationTransition:(UIViewAnimationTransitionFlipFromRight) forView:self.imageView cache:YES];
            self.imageView.frame = self.oldView.frame;
            [UIView commitAnimations];
        } else if(indexPath.row == 3){
            [UIView setAnimationTransition:(UIViewAnimationTransitionCurlUp) forView:self.imageView cache:YES];
            self.imageView.frame = self.oldView.frame;
            [UIView commitAnimations];
        } else if(indexPath.row == 4) {
            [UIView setAnimationTransition:(UIViewAnimationTransitionCurlDown) forView:self.imageView cache:YES];
            self.imageView.frame = self.oldView.frame;
            [UIView commitAnimations];
        } else if(indexPath.row == 5){
            [UIView setAnimationTransition:(UIViewAnimationTransitionNone) forView:self.imageView cache:YES];
            self.imageView.frame = self.orgRect;
            [UIView commitAnimations];
        }
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


