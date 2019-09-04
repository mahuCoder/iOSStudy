//
//  YXYThrid_liveVideoPreView.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/2.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXYThrid_liveVideoPreSkinSetView.h"


NS_ASSUME_NONNULL_BEGIN



@interface YXYThrid_liveVideoPreView : UIView

@property (nonatomic, strong)AlivcLivePushConfig *pushConfig;//推流配置
@property (nonatomic, copy ) void(^ eventBlock)(YXYThrid_liveVideoPreViewEvent event);
@property (nonatomic, copy ) void(^ titleBlock)(NSString* title);



@end

NS_ASSUME_NONNULL_END
