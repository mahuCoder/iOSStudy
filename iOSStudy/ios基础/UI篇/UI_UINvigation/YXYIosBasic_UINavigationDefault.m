//
//  YXYIosBasic_UINavigationDefault.m
//  iOSStudy
//
//  Created by sunny on 2020/3/25.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UINavigationDefault.h"
#import "YXYIosBasic_UINavigationDefaultExample.h"

@interface YXYIosBasic_UINavigationDefault ()

@end

@implementation YXYIosBasic_UINavigationDefault

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我是根试图";
    self.arrayData = @[@"左1",@"左1,2",@"push页面",@"右1,2",@"自定义item&图片",@"设置不透明",@"设置UIBarStyleBlack",@"UIBarStyleBlackTranslucent(透明)",@"按钮间距1站位法",@"按钮间距设置edg图片可用",@"设置隐藏/显示",@"更换被背景图",@"复位",@"返回"];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
    if (!headerView) {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
    }
    headerView.textLabel.text = @"系统默认灰色/透明(透明时y从屏幕顶端开始)/按钮颜色蓝色";
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                self.navigationItem.leftBarButtonItems = @[];
                self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"左1" style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarButtonItem)];
            }
            break;
        case 1:
            {
                UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"左1" style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarButtonItem)];
                UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"左2" style:(UIBarButtonItemStyleDone) target:self action:@selector(left2BarButtonItem)];
                self.navigationItem.leftBarButtonItems = @[item1,item2];
            }
            break;
        case 2:
            {
                YXYIosBasic_UINavigationDefaultExample *example = [[YXYIosBasic_UINavigationDefaultExample alloc] init];
                [self.navigationController pushViewController:example animated:YES];
            }
            break;
        case 3:
            {
                UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"右2" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItem)];
                UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"右1" style:(UIBarButtonItemStyleDone) target:self action:@selector(right2BarButtonItem)];
                self.navigationItem.rightBarButtonItems = @[item1,item2];
            }
            break;
        case 4:
            {
                UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"alipay"] style:(UIBarButtonItemStylePlain) target:self action:nil];
                
                UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
                [button setTitle:@"自定义" forState:(UIControlStateNormal)];
                [button setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
                UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:button];
                self.navigationItem.rightBarButtonItems = @[item1,item2];
            }
            break;
        case 5:
            {
                [self.navigationController.navigationBar setTranslucent:NO];
            }
            break;
        case 6:
            {
                [self.navigationController.navigationBar setBarStyle:(UIBarStyleBlack)];
            }
            break;
        case 7:
            {
                [self.navigationController.navigationBar setBarStyle:(UIBarStyleBlackTranslucent)];
            }
            break;
        case 8:
            {
                UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"右2" style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItem)];
                UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"右1" style:(UIBarButtonItemStyleDone) target:self action:@selector(right2BarButtonItem)];
                UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
                space.width = -20;
              self.navigationItem.rightBarButtonItems = @[space,item1,item2];
            }
            break;
        case 9:
            {
                UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"alipay"] style:(UIBarButtonItemStylePlain) target:self action:nil];
                [item1 setImageInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
                  UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"右1" style:(UIBarButtonItemStyleDone) target:self action:@selector(right2BarButtonItem)];
                self.navigationItem.rightBarButtonItems = @[item1,item2];
            }
            break;
        case 10:
            {
                BOOL isHidden = !self.navigationController.navigationBarHidden;
                [self.navigationController setNavigationBarHidden:isHidden];
            }
            break;
        case 11:
            {
                [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"example"] forBarMetrics:(UIBarMetricsDefault)];
            }
            break;
        case 12:
            {
                [self.navigationController.navigationBar setBarStyle:(UIBarStyleDefault)];
                [self.navigationController.navigationBar setTranslucent:YES];
            }
            break;
        case 13:
            {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            break;
            
        default:
            break;
    }
}

- (void)leftBarButtonItem {
    [ToastManager showToast:@"点击左1"];
}
- (void)left2BarButtonItem {
    [ToastManager showToast:@"点击左2"];
}
- (void)rightBarButtonItem {
    
}
- (void)right2BarButtonItem {
    
}
@end
