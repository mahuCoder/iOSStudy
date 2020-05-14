//
//  YXYIosBasic_UIStackView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/13.
//  Copyright © 2020 yunhun. All rights reserved.
//堆栈试图（自动布局）

#import "YXYIosBasic_UIStackView.h"

@interface YXYIosBasic_UIStackView ()

@end

@implementation YXYIosBasic_UIStackView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addHorizontalStackView];
    [self addVerticalStackView];
    
}
- (void)addHorizontalStackView {
    UIStackView *containerView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 100)];
     containerView.tintColor = UIColor.redColor;
     //水平布局
     containerView.axis = UILayoutConstraintAxisHorizontal;
    //间距
     containerView.spacing = 10;
     //子控件依据何种规矩布局
     containerView.distribution = UIStackViewDistributionFillEqually;
     //对齐方式
     for (NSInteger i = 0; i < 5; i ++) {
         UIView *view = [[UIView alloc] init];
         view.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
         [containerView addArrangedSubview:view];
     }
     [self.view addSubview:containerView];
}
- (void)addVerticalStackView {
    UIStackView *containerView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 450)];
     containerView.tintColor = UIColor.redColor;
     //水平布局
     containerView.axis = UILayoutConstraintAxisVertical;
    //间距
     containerView.spacing = 10;
    ///对齐方式
    containerView.alignment = UIStackViewAlignmentLeading;
     //子控件依据何种规矩布局
     containerView.distribution = UIStackViewDistributionFillEqually;
     //对齐方式
     for (NSInteger i = 0; i < 3; i ++) {
         
         UILabel *label = [[UILabel alloc] init];
         label.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
         label.text = @"测试文字";
         //label 自动布局可以改变size
         [containerView addArrangedSubview:label];
     }
     [self.view addSubview:containerView];
}
/*alignment
 
 UIStackViewDistribution

 UIStackViewDistributionFill ：它就是将 arrangedSubviews 填充满整个 StackView ，如果设置了spacing，那么这些 arrangedSubviews 之间的间距就是spacing。如果减去所有的spacing，所有的 arrangedSubview 的固有尺寸( intrinsicContentSize )不能填满或者超出 StackView 的尺寸，那就会按照 Hugging 或者 CompressionResistance 的优先级来拉伸或压缩一些 arrangedSubview 。如果出现优先级相同的情况，就按排列顺序来拉伸或压缩。

 UIStackViewDistributionFillEqually ：这种就是 StackView 的尺寸减去所有的spacing之后均分给 arrangedSubviews ，每个 arrangedSubview 的尺寸是相同的。

 UIStackViewDistributionFillProportionally ：这种跟FillEqually差不多，只不过这个不是讲尺寸均分给 arrangedSubviews ，而是根据 arrangedSubviews 的 intrinsicContentSize 按比例分配。

 UIStackViewDistributionEqualSpacing ：这种是使 arrangedSubview 之间的spacing相等，但是这个spacing是有可能大于 StackView 所设置的spacing，但是绝对不会小于。这个类型的布局可以这样理解，先按所有的 arrangedSubview 的 intrinsicContentSize 布局，然后余下的空间均分为spacing，如果大约 StackView 设置的spacing那这样就OK了，如果小于就按照 StackView 设置的spacing，然后按照 CompressionResistance 的优先级来压缩一个 arrangedSubview 。

 UIStackViewDistributionEqualCentering ：这种是使 arrangedSubview 的中心点之间的距离相等，这样没两个 arrangedSubview 之间的spacing就有可能不是相等的，但是这个spacing仍然是大于等于 StackView 设置的spacing的，不会是小于。这个类型布局仍然是如果 StackView 有多余的空间会均分给 arrangedSubviews 之间的spacing，如果空间不够那就按照 CompressionResistance 的优先级压缩 arrangedSubview 。
 
 
 

UIStackViewAlignmentFill = 默认方式， 如果子控件水平布局, 则指子控件的垂直方向填充满stackView. 反之亦然

UIStackViewAlignmentLeading = 如果子控件竖直布局, 则指子控件左边对齐stackView左边. 反之亦然, 即 UIStackViewAlignmentTop = UIStackViewAlignmentLeading。

UIStackViewAlignmentTop = UIStackViewAlignmentLeading,

UIStackViewAlignmentFirstBaseline = 根据上方基线布局所有子视图的 y 值(适用于 Horizontal 模式)

UIStackViewAlignmentLastBaseline = 根据下方基线布局所有子视图的 y 值(适用于 Horizontal 模式)

UIStackViewAlignmentCenter = 中心对齐

UIStackViewAlignmentTrailing = 如果子控件竖直布局, 则指子控件左边对齐stackView右边. 反之亦然, 即UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing

UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing
 
 
 */
@end
