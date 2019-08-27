//
//  CustomPaopaoView.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/24.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomPaopaoView : UIView
@property (nonatomic, strong) UIImage *image; //商户图
@property (nonatomic, copy) NSString *title; //商户名
@property (nonatomic, copy) NSString *subtitle; //地址
@end

NS_ASSUME_NONNULL_END
