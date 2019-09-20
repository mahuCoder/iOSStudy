//
//  YXYIosBasic_UIViewAnimationOptionsVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIViewAnimationOptionsVC.h"

@interface YXYIosBasic_UIViewAnimationOptionsVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;

@property (nonatomic, strong) UIView *oldView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect orgRect;

@end

@implementation YXYIosBasic_UIViewAnimationOptionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIViewAnimationOptionLayoutSubviews//进行动画时布局子控件
//    UIViewAnimationOptionAllowUserInteraction//进行动画时允许用户交互
//    UIViewAnimationOptionBeginFromCurrentState//从当前状态开始动画
//    UIViewAnimationOptionRepeat//无限重复执行动画
//    UIViewAnimationOptionAutoreverse//执行动画回路
//    UIViewAnimationOptionOverrideInheritedDuration//忽略嵌套动画的执行时间设置
//    UIViewAnimationOptionOverrideInheritedCurve//忽略嵌套动画的曲线设置
//    UIViewAnimationOptionAllowAnimatedContent//转场：进行动画时重绘视图
//    UIViewAnimationOptionShowHideTransitionViews//转场：移除（添加和移除图层的）动画效果
//    UIViewAnimationOptionOverrideInheritedOptions//不继承父动画设置
//    UIViewAnimationOptionCurveEaseInOut//时间曲线，慢进慢出（默认值）
//    UIViewAnimationOptionCurveEaseIn//时间曲线，慢进
//    UIViewAnimationOptionCurveEaseOut//时间曲线，慢出
//    UIViewAnimationOptionCurveLinear//时间曲线，匀速
//    UIViewAnimationOptionTransitionNone//转场，不使用动画
//    UIViewAnimationOptionTransitionFlipFromLeft//转场，从左向右旋转翻页
//    UIViewAnimationOptionTransitionFlipFromRight//转场，从右向左旋转翻页
//    UIViewAnimationOptionTransitionCurlUp//转场，下往上卷曲翻页
//    UIViewAnimationOptionTransitionCurlDown//转场，从上往下卷曲翻页
//    UIViewAnimationOptionTransitionCrossDissolve//转场，交叉消失和出现
//    UIViewAnimationOptionTransitionFlipFromTop//转场，从上向下旋转翻页
//    UIViewAnimationOptionTransitionFlipFromBottom//转场，从下向上旋转翻页
    self.view.backgroundColor = [UIColor whiteColor];
    self.arrayData = @[@"LayoutSubviews//进行动画时布局子控件",@"AllowUserInteraction//进行动画时允许用户交互",@"BeginFromCurrentState//从当前状态开始动画",@"Repeat//无限重复执行动画",@"Autoreverse//执行动画回路",@"OverrideInheritedDuration//忽略嵌套动画的执行时间设置",@"OverrideInheritedCurve//忽略嵌套动画的曲线设置",@"AllowAnimatedContent//转场：进行动画时重绘视图",@"ShowHideTransitionViews//转场：移除（添加和移除图层的）动画效果",@"复位"];
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
        cell.textLabel.font = FONT(12);
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
        UIViewAnimationOptions options = (UIViewAnimationOptions) (1 << indexPath.row);
        
        if (indexPath.row == 9) {
            [UIView animateWithDuration:2 delay:0 options:options animations:^{
                self.imageView.frame = self.orgRect;
            } completion:nil];
        } else {
            [UIView animateWithDuration:2 delay:0 options:options animations:^{
                self.imageView.frame = self.oldView.frame;
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



