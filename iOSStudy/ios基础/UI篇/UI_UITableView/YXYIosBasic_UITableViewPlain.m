//
//  YXYIosBasic_UITableViewPlain.m
//  iOSStudy
//
//  Created by sunny on 2020/3/24.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UITableViewPlain.h"

@interface YXYIosBasic_UITableViewPlain ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@end

@implementation YXYIosBasic_UITableViewPlain

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@[@"Default",@"Default+DetailDisclosureButton",@"Subtitle+Checkmark",@"value1+DetailButton",@"value2+自定义Access"],
                       @[@"我可点击删除",@"我可点击添加",@"我可点击删除+拖动",@"我可拖动1", @"我可拖动2"]];
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
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    identifier = [NSString stringWithFormat:@"CellID_section%ld_row%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (indexPath.section == 0) {
        if (indexPath.row == 0 || indexPath.row == 1) {
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
            }
            if (indexPath.row == 1) {
                cell.textLabel.font = FONT(12);
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
        } else if (indexPath.row == 2) {
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
            }
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else if (indexPath.row == 3) {
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:identifier];
            }
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        } else if (indexPath.row == 4) {
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue2) reuseIdentifier:identifier];
            }
             UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
                       view.backgroundColor = [UIColor redColor];
                       cell.accessoryView = view;
        } else if (indexPath.row == 5) {
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue2) reuseIdentifier:identifier];
            }
           
        }
    }
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.imageView.image = [UIImage imageNamed:@"alipay"];

    cell.detailTextLabel.text = @"我是副标题";
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
   
}
#pragma mark --删除
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除文字";
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return YES;
    }
    return NO;
}
#pragma mark --编辑
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row > 1) {
            return YES;
        }
    }
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return UITableViewCellEditingStyleDelete;
        } else if (indexPath.row == 1) {
            return UITableViewCellEditingStyleInsert;
        } else if (indexPath.row == 2) {
            return UITableViewCellEditingStyleDelete;
        }
    }
    return UITableViewCellEditingStyleNone;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [ToastManager showToast:@"移动操作"];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [ToastManager  showToast:@"插入操作"];
    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
        [ToastManager showToast:@"删除操作"];
    }
}


#pragma mark --------------------------懒加载-----------------------------
#pragma mark tableView-lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        //允许编辑/移动
        _tableView.editing = YES;
        _tableView.allowsSelectionDuringEditing=YES;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:yhCellID];
    }
    return _tableView;
}
@end


