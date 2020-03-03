//
//  LrcCell.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "LrcCell.h"

#import "LrcLabel.h"

static NSString * const reuseId = @"lrcCell";

@interface LrcCell()
@property (nonatomic, strong) LrcLabel *lrcContentLabel;

@end

@implementation LrcCell

#pragma mark --------------------------
#pragma mark 重写 set

/** 给子控件赋值*/
- (void)setLrcModel:(LrcModel *)lrcModel {
    _lrcModel = lrcModel;
    
    self.lrcContentLabel.text = lrcModel.lrcStr;
}

/** 设置播放进度*/
- (void)setProgress:(CGFloat)progress {
    
    _progress = progress;
    
    self.lrcContentLabel.progress = progress;
}


#pragma mark --------------------------
#pragma mark 创建
+ (instancetype)cellWithTable:(UITableView *)tableView {
    
    LrcCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[LrcCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseId];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.lrcContentLabel];
        [self.lrcContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
        }];
    }
    return self;
}
- (LrcLabel *)lrcContentLabel {
    if (!_lrcContentLabel) {
        _lrcContentLabel = [[LrcLabel alloc] init];
    }
    return _lrcContentLabel;
}
@end
