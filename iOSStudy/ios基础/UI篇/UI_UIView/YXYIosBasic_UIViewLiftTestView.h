//
//  YXYIosBasic_UIViewLiftTestView.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/16.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YXYIosBasic_UIViewLiftTestView : UIView

- (instancetype)initWithFrame:(CGRect)frame completionBlock:(void(^)(NSString *event))completionBlock;
- (instancetype)initWithCompletionBlock:(void(^)(NSString *event))completionBlock;

@property (nonatomic, strong) void (^ completionBlock) (NSString *event);

@end

NS_ASSUME_NONNULL_END
