//
//  YXYThrid_Audio_MusicPlayerListVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/27.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_Audio_MusicPlayerListVC.h"
#import "YXYThrid_Audio_MusicPlayerModel.h"

@interface YXYThrid_Audio_MusicPlayerListVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;

@end

@implementation YXYThrid_Audio_MusicPlayerListVC

- (void)viewDidLoad {
    [super viewDidLoad];
//                                                              QQResources.bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:QQResources(@"Musics") ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    self.arrayData = [NSArray yy_modelArrayWithClass:[YXYThrid_Audio_MusicPlayerModel class] json:array];

    [self.view addSubview:self.tableView];
    
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
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"CellID"];
    }
    YXYThrid_Audio_MusicPlayerModel *model = self.arrayData[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:model.singerIcon];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.singer;
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
            }
            break;
        case 1:
            {

            }
            break;
        case 2:
            {
                UIViewController *vc = [[NSClassFromString(self.arrayVC[indexPath.row]) alloc] init];
                  vc.title = self.arrayData[indexPath.row];
                  [self.navigationController pushViewController:vc animated:YES];

            }
            break;
        case 3:
        {
            UIViewController *vc = (UIViewController *) [[NSClassFromString(self.arrayVC[indexPath.row])  alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
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

