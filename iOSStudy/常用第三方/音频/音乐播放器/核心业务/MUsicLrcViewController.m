//
//  MUsicLrcViewController.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "MUsicLrcViewController.h"
#import "LrcCell.h"
@interface MUsicLrcViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
/** 记录历史歌词所在的行*/
@property (nonatomic, assign) NSInteger oldScrollRow;
@end

@implementation MUsicLrcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    self.tableView.frame = [UIScreen mainScreen].bounds;
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsZero);
//    }];
    self.oldScrollRow = -1;
    
  
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    // 增加内边距
       CGFloat insetH = self.tableView.frame.size.height * 0.5;
       self.tableView.contentInset = UIEdgeInsetsMake(insetH, 0, ScreenHeight, 0);
}
- (void)setDatasource:(NSArray<LrcModel *> *)datasource
{
    _datasource = datasource;
    [self.tableView reloadData];
}

/** 实时滚动到指定的行*/
- (void)setScrollRow:(NSInteger)scrollRow{
    
    _scrollRow = scrollRow;
    
    if (scrollRow != self.oldScrollRow) {
        
        //NSLog(@"当前歌词所在的行: ===== %zd", scrollRow);
        
        // tableView 滚动到指定的行
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollRow inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        
        self.oldScrollRow = scrollRow;
    }
}
/** 设置歌词的播放进度*/
- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    // 1.获取当前正在播放的 cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.scrollRow inSection:0];
    LrcCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    // 2.设置播放进度
    cell.progress = progress;
}
#pragma mark --------------------------
#pragma mark UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 创建 cell
    LrcCell *cell = [LrcCell cellWithTable:tableView];
    
    // 取出模型
    LrcModel *lrcModel = self.datasource[indexPath.row];
    cell.lrcModel = lrcModel;
    
    if (indexPath.row == self.scrollRow) {
        cell.progress = self.progress;
    }else
    {
        cell.progress = 0;
    }
    
    return cell;
}
#pragma mark tableView-lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:(UITableViewStyleGrouped)];
//        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 不给选中
        _tableView.allowsSelection = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:yhCellID];
    }
    return _tableView;
}


@end
