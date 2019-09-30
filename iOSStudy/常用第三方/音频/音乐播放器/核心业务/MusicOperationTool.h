//
//  MusicOperationTool.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/29.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicOperationTool : NSObject

@property (nonatomic, strong) NSArray<MusicModel *> *musicMList;

#pragma mark 单例
/**
 *  获取对象单例
 *
 *  @return MusicOperationTool单例对象
 */
+ (instancetype)shareInstance;




@end

NS_ASSUME_NONNULL_END
