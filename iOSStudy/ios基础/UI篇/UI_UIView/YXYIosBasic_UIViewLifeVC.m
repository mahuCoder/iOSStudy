//
//  YXYIosBasic_UIViewLifeVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/16.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIViewLifeVC.h"
#import "YXYIosBasic_UIViewLiftTestView.h"

@interface YXYIosBasic_UIViewLifeVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;

@property (nonatomic, strong) NSMutableArray *arrayLife;


@end

@implementation YXYIosBasic_UIViewLifeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"frame加载",@"约束加载",@"从xib加载"];
    self.arrayVC = @[@"",@""];
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
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
         return self.arrayData.count;
    }
    return self.arrayLife.count;
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
    } else {
        cell.textLabel.text = self.arrayLife[indexPath.row];
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
    if (indexPath.section == 0) {
        if (!self.arrayLife) {
            self.arrayLife = [NSMutableArray array];
        }
        [self.arrayLife removeAllObjects];
        if (indexPath.row == 0) {
            __weak typeof(self) wSelf = self;
              YXYIosBasic_UIViewLiftTestView *view = [[YXYIosBasic_UIViewLiftTestView alloc] initWithFrame:CGRectMake(100, 100, 40, 40) completionBlock:^(NSString * _Nonnull event) {
                [wSelf.arrayLife addObject:event];
                [wSelf.tableView reloadData];
            }];
             view.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:view];
            __weak typeof(view) wView = view;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [wView removeFromSuperview];
            });
        } else  if (indexPath.row == 1) {
            __weak typeof(self) wSelf = self;
              YXYIosBasic_UIViewLiftTestView *view = [[YXYIosBasic_UIViewLiftTestView alloc] initWithCompletionBlock:^(NSString * _Nonnull event) {
                [wSelf.arrayLife addObject:event];
                [wSelf.tableView reloadData];
            }];
            view.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.offset(100);
                make.size.mas_equalTo(CGSizeMake(40, 40));
            }];
            __weak typeof(view) wView = view;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [wView removeFromSuperview];
            });
        } else  if (indexPath.row == 2) {
            __weak typeof(self) wSelf = self;
            [self.arrayLife addObject:@"initWithCoder"];
            [self.arrayLife addObject:@"awakeFromNib"];
            YXYIosBasic_UIViewLiftTestView *view = [[[NSBundle mainBundle] loadNibNamed:@"YXYIosBasic_UIViewLiftTestView" owner:self options:nil] firstObject];
            view.completionBlock = ^(NSString * _Nonnull event) {
                [wSelf.arrayLife addObject:event];
                [wSelf.tableView reloadData];
            };
            view.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.offset(100);
                make.size.mas_equalTo(CGSizeMake(40, 40));
            }];
            __weak typeof(view) wView = view;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [wView removeFromSuperview];
            });
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


