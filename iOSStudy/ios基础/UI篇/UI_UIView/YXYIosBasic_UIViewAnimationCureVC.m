//
//  YXYIosBasic_UIViewAnimationCureVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/16.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIViewAnimationCureVC.h"

@interface YXYIosBasic_UIViewAnimationCureVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;

@property (nonatomic, strong) UIView *circleView;

@end

@implementation YXYIosBasic_UIViewAnimationCureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"EaseInOut 开始和结尾慢，中间快(默认)",@"EaseIn 先慢后快",@"EaseOut 先快后慢 ",@"Linear 匀速",@"弹簧效果",@"多个动画效果拼接(关键帧动画)"];
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
    if (!self.circleView) {
        self.circleView = [[UIView alloc] init];
        self.circleView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:self.circleView];
    }
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    self.circleView.transform = CGAffineTransformMakeScale(0, 0);
    __weak typeof(self) wSelf = self;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [UIView animateWithDuration:2 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
                wSelf.circleView.transform = CGAffineTransformIdentity;
            } completion:nil];
        } else  if (indexPath.row == 1) {
            [UIView animateWithDuration:2 delay:0 options:(UIViewAnimationOptionCurveEaseIn) animations:^{
                wSelf.circleView.transform = CGAffineTransformIdentity;
            } completion:nil];
        } else  if (indexPath.row == 2) {
            [UIView animateWithDuration:2 delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
                wSelf.circleView.transform = CGAffineTransformIdentity;
            } completion:nil];
        } else if(indexPath.row == 3){
            [UIView animateWithDuration:2 delay:0 options:(UIViewAnimationOptionCurveLinear) animations:^{
                wSelf.circleView.transform = CGAffineTransformIdentity;
            } completion:nil];
        } else if(indexPath.row == 4) {
            //0.3是阻尼系数
            [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                wSelf.circleView.transform = CGAffineTransformIdentity;
            } completion:nil];
        } else if(indexPath.row == 5){
            [UIView animateKeyframesWithDuration:2 delay:0 options:(UIViewKeyframeAnimationOptionCalculationModeCubic) animations:^{
                //StartTime 和 relativeDuration 在0-1之间，指相对于总时间的占比
                [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
                    self.circleView.transform = CGAffineTransformIdentity;
                }];
                [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
                     self.circleView.transform = CGAffineTransformMakeScale(0, 0);
                }];
            } completion:nil];
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


