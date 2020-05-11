//
//  YXYIosBasic_UITableViewGroup.m
//  iOSStudy
//
//  Created by sunny on 2020/3/24.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UITableViewGroup.h"

@interface YXYIosBasic_UITableViewGroup ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@end

@implementation YXYIosBasic_UITableViewGroup

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@[@"默认高度44",@"我的高度80,关闭选中效果",@"分割线从最左侧开始",@"分割线偏出屏幕",@"点击事件"],
                       @[@"我可左滑",@"我可左滑",@"我可左滑",@"我可左滑", @"我可左滑"]];
    [self.view addSubview:self.tableView];
}

#pragma mark  -------------deleget & dataSource------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrayData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayData[section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            return 80;
        }
    }
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    identifier = [NSString stringWithFormat:@"CellID_section%ld_row%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        } else if (indexPath.row == 2) {
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        } else if (indexPath.row == 3) {
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, CGFLOAT_MAX);
        } else if (indexPath.row == 4) {
            
        }
    }
    
    cell.textLabel.text = self.arrayData[indexPath.section][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!header) {
        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"header"];
    }
    if (section == 0) {
        header.textLabel.text = @"组头：cell系统样式";
    } else if (section == 1) {
        header.textLabel.text = @"组头：可操作样式";
    }
    return header;
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
    [ToastManager showToast:[NSString stringWithFormat:@"点击的是第%ld组,第%ld行", indexPath.section, indexPath.row]];
   
}
#pragma mark --删除
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除文字";
//}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return YES;
    }
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [ToastManager  showToast:@"插入操作"];
    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
        [ToastManager showToast:@"删除操作"];
    }
}
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *action_Normal = [UIContextualAction contextualActionWithStyle:(UIContextualActionStyleNormal) title:@"普通" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [ToastManager showToast:@"普通操作"];
    }];
    UIContextualAction *action_Destructive = [UIContextualAction contextualActionWithStyle:(UIContextualActionStyleDestructive) title:@"红色" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [ToastManager showToast:@"红色操作"];
    }];
    
    UIContextualAction *action_diy = [UIContextualAction contextualActionWithStyle:(UIContextualActionStyleNormal) title:@"可添加图片" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [ToastManager showToast:@"可添加图片操作"];
    }];
    action_diy.backgroundColor = [UIColor greenColor];
    
    UIContextualAction *action_diy_1 = [UIContextualAction contextualActionWithStyle:(UIContextualActionStyleNormal) title:@"" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [ToastManager showToast:@"点击图片操作"];
    }];
    action_diy_1.image = [UIImage imageNamed:@"alipay"];
    action_diy.backgroundColor = [UIColor blueColor];
    
    
    UISwipeActionsConfiguration *config;

    if (indexPath.row == 0) {
        config = [UISwipeActionsConfiguration configurationWithActions:@[action_Normal]];
    } else if (indexPath.row == 1) {
        config = [UISwipeActionsConfiguration configurationWithActions:@[action_Normal,action_Destructive]];
    } else if (indexPath.row == 2) {
        config = [UISwipeActionsConfiguration configurationWithActions:@[action_Normal,action_Destructive,action_diy]];
    } else if (indexPath.row == 3) {
        config = [UISwipeActionsConfiguration configurationWithActions:@[action_Normal,action_Destructive,action_diy,action_diy_1]];
    }
    //UISwipeActionsConfiguration为空时会执行editingStyleForRowAtIndexPath
    return config;
}

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
        //允许编辑/移动
//        _tableView.editing = YES;
//        _tableView.allowsSelectionDuringEditing=YES;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:yhCellID];
    }
    return _tableView;
}
@end


