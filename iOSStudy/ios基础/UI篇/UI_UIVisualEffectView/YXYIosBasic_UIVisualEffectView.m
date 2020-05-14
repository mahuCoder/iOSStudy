//
//  YXYIosBasic_UIVisualEffectView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/13.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIVisualEffectView.h"

@interface YXYIosBasic_UIVisualEffectView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation YXYIosBasic_UIVisualEffectView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    imageView.image = [UIImage imageNamed:@"001"];
    self.imageView = imageView;
    
    [self addDarkEffect];
    [self addLightEffect];
    [self addExtraLightEffect];
    
    [self addVibrancyEffectWithStyle:(UIBlurEffectStyleDark) point:CGPointMake(10, 340) alpha:1];
    [self addVibrancyEffectWithStyle:(UIBlurEffectStyleLight) point:CGPointMake(10, 450) alpha:1];
    [self addVibrancyEffectWithStyle:(UIBlurEffectStyleExtraLight) point:CGPointMake(10, 560) alpha:1];
}


- (void)addEffectWithStyle:(UIBlurEffectStyle)style point:(CGPoint )point alpha:(CGFloat)alpha{
    /**
     *
     * 在官方的API中对UIVisualView类的对象的透明度有这样的描述(此处未全部引用官方API):
      *      When using the UIVisualEffectView class, avoid alpha values that are less than 1.
      *      当使用UIVisualEffectView的类时, 避免alpha的值小于1;
     */
    
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:nil];
    effectView.frame = CGRectMake(point.x, point.y, ScreenWidth *0.4, 100);
    effectView.alpha = alpha;
    [self.imageView addSubview:effectView];

    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"example"];

    [effectView.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 60));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"测试";
    label.textColor = UIColor.redColor;
    [effectView.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.offset(5);
    }];
    [UIView animateWithDuration:5 animations:^{
        effectView.effect = effect;
    }];
    
}

- (void)addDarkEffect {
    [self addEffectWithStyle:(UIBlurEffectStyleDark) point:CGPointMake(10, 10) alpha:1];
    [self addEffectWithStyle:(UIBlurEffectStyleDark) point:CGPointMake(ScreenWidth *0.5, 10) alpha:0.9];

}
- (void)addLightEffect {
    [self addEffectWithStyle:(UIBlurEffectStyleLight) point:CGPointMake(10, 120) alpha:1];
    [self addEffectWithStyle:(UIBlurEffectStyleLight) point:CGPointMake(ScreenWidth *0.5, 120) alpha:0.9];
}
- (void)addExtraLightEffect {
    [self addEffectWithStyle:(UIBlurEffectStyleExtraLight) point:CGPointMake(10, 230) alpha:1];
    [self addEffectWithStyle:(UIBlurEffectStyleExtraLight) point:CGPointMake(ScreenWidth *0.5, 230) alpha:0.9];
}

- (void)addVibrancyEffectWithStyle:(UIBlurEffectStyle)style point:(CGPoint )point alpha:(CGFloat)alpha{
    /**
    * 在UIVibrancyEffect这种类型的毛玻璃中, 苹果官方API对UIImageView的image属性的渲染方式做出了要求:
    *      UIImageView will need its image to have a rendering mode of UIImageRenderingModeAlwaysTemplate to receive the proper effect.
    *
    * UIImageView的属性imgae的渲染方式要选择UIImageRenderingModeAlwaysTemplate, 会获得更好的效果.
    */
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:(style)];
    
    UIVibrancyEffect *effect = [UIVibrancyEffect effectForBlurEffect:blur];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(point.x, point.y, ScreenWidth - 20, 100);
    effectView.alpha = alpha;
    [self.imageView addSubview:effectView];

    
    UIImageView *imageView = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:@"example"];
//    [image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    imageView.image = image;

    [effectView.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 60));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"测试";
    label.textColor = UIColor.redColor;
    [effectView.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.offset(5);
    }];
//    [UIView animateWithDuration:5 animations:^{
//        effectView.effect = effect;
//    }];
}

@end
