//
//  LrcCell.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LrcModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LrcCell : UITableViewCell



#pragma mark --------------------------
#pragma mark 数据

/** 歌词数据模型*/
@property (nonatomic, strong) LrcModel *lrcModel;

/** 当前播放的进度*/
@property (nonatomic, assign) CGFloat progress;

#pragma mark --------------------------
#pragma mark 方法

/**
 *  创建 cell
 *
 *  @param tableView tableView对象
 *
 *  @return QQLrcCell实例对象
 */
+ (instancetype)cellWithTable:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
