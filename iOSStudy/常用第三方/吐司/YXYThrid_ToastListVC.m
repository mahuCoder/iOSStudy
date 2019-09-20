//
//  YXYThrid_ToastListVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/27.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_ToastListVC.h"
#import "UIView+Toast.h"

@interface YXYThrid_ToastListVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;

@end

@implementation YXYThrid_ToastListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Toast";
    self.arrayData = @[@"只显示文字",@"操作成功",@"操作失败",@"自定义图标",@"横条加载",@"扇形加载",@"环形加载",@"菊花加载",@"自定义view",@"底部Toast（非MB）",@"顶部Toast(非MB)"];
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
                [ToastManager showToast:@"普通显示"];
            }
            break;
            case 1:
        {
            [ToastManager showSuccess:@"操作成功"];
        }
            break;
            case 2:
        {
            [ToastManager showError:@"操作失败"];
        }
            break;
            case 3:
        {
            [ToastManager showText:@"警告" icon:@"attention" toView:nil afterComplete:nil];
        }
            break;
            case 4:
        {
            MBProgressHUD *hud = [ToastManager showHorizontalProgressBarWithMessage:@"正在加载..."];
            // 模拟网络请求进度
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                float progress = 0.0f;
                while (progress< 1.0f) {
                    progress += 0.01f;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hud.progress = progress;
                        hud.label.text = [NSString stringWithFormat:@"正在加载...%d%%", (int)(progress * 100)];
                    });
                    // 进程挂起50毫秒
                    usleep(50000);//单位微秒 。sleep单位秒
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [ToastManager hideHud];
                });
            });
        }
            break;
            case 5:
        {
            MBProgressHUD *hud = [ToastManager showFanProgressBarWithMessage:@"正在加载..."];
            // 模拟网络请求进度
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                float progress = 0.0f;
                while (progress< 1.0f) {
                    progress += 0.01f;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hud.progress = progress;
                        hud.label.text = [NSString stringWithFormat:@"正在加载...%d%%", (int)(progress * 100)];
                    });
                    // 进程挂起50毫秒
                    usleep(50000);//单位微秒 。sleep单位秒
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [ToastManager hideHud];
                });
            });
        }
            break;
            case 6:
        {
            MBProgressHUD *hud = [ToastManager showCircularProgressWithMessage:@"正在加载..."];
            // 模拟网络请求进度
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                float progress = 0.0f;
                while (progress< 1.0f) {
                    progress += 0.01f;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hud.progress = progress;
                        hud.label.text = [NSString stringWithFormat:@"正在加载...%d%%", (int)(progress * 100)];
                    });
                    // 进程挂起50毫秒
                    usleep(50000);//单位微秒 。sleep单位秒
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [ToastManager hideHud];
                });
            });
        }
            break;
            case 7:
        {
            MBProgressHUD *hud = [ToastManager showActivityIndicatorWithMessage:@"正在加载..."];
            // 模拟网络请求进度
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                float progress = 0.0f;
                while (progress< 1.0f) {
                    progress += 0.01f;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        hud.progress = progress;
                        hud.label.text = [NSString stringWithFormat:@"正在加载...%d%%", (int)(progress * 100)];
                    });
                    // 进程挂起50毫秒
                    usleep(50000);//单位微秒 。sleep单位秒
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [ToastManager hideHud];
                });
            });
        }
            break;
            case 8:
        {
            UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WeChat"]];
//            hud.customView = imgView;
            CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
            animation.fromValue = [NSNumber numberWithFloat:0.f];
            animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
            animation.duration  = 1;
            animation.autoreverses = NO;
            animation.fillMode =kCAFillModeForwards;
            animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
            [imgView.layer addAnimation:animation forKey:nil];
             [ToastManager showCustomViewWithCustomView:imgView message:@"我是自定义的"];
        }
            break;
            case 9:
        {
            [self.view makeToast:@"我是底部Toast"];
        }
            break;
            case 10:
        {
            [self.view makeToast:@"我是顶部Toast" duration:2 position:CSToastPositionTop];
        }
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
