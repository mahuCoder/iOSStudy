//
//  YXYIosBasic_UIViewLiftTestView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/16.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIViewLiftTestView.h"

@implementation YXYIosBasic_UIViewLiftTestView

- (void)awakeFromNib
{
    [super awakeFromNib];
//     self.completionBlock(NSStringFromSelector(_cmd));
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}
- (instancetype)initWithCompletionBlock:(void(^)(NSString *event))completionBlock
{
    if (self = [super init]) {
        completionBlock(NSStringFromSelector(_cmd));
        self.completionBlock = completionBlock;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame completionBlock:(void(^)(NSString *event))completionBlock
{
    if (self = [super initWithFrame:frame]) {
        completionBlock(NSStringFromSelector(_cmd));
        self.completionBlock = completionBlock;
    }
    return self;
}

//- (instancetype)init
//{
//    /*
//     init 内部会调用父类的 initWithFrame: 方法，只不过传入的 frame 的值为0。然后，父类的 initWithFrame: 方法发现当前的调用对象是子类对象，所以就调用了子类的 initWithFrame 方法了
//     */
//    if (self = [super init]) {
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.completionBlock(NSStringFromSelector(_cmd));
    }
    return self;
}

- (void)layoutSubviews
{
//    []
    /*
  1、init初始化不会触发layoutSubviews。
  2、addSubview会触发layoutSubviews。
  3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化。
  4、滚动一个UIScrollView会触发layoutSubviews。
  5、旋转Screen会触发父UIView上的layoutSubviews事件。
  6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件。
  7、直接调用setLayoutSubviews。
  */
     self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)drawRect:(CGRect)rect
{
    /*
     1、如果在UIView初始化时没有设置rect大小，将直接导致drawRect不被自动调用。drawRect调用是在Controller->loadView, Controller->viewDidLoad 两方法之后掉用的.所以不用担心在控制器中,这些View的drawRect就开始画了.这样可以在控制器中设置一些值给View(如果这些View draw的时候需要用到某些变量值).
     
     2、该方法在调用sizeToFit后被调用，所以可以先调用sizeToFit计算出size。然后系统自动调用drawRect:方法。
     
     3、通过设置contentMode属性值为UIViewContentModeRedraw。那么将在每次设置或更改frame的时候自动调用drawRect:。
     
     4、直接调用setNeedsDisplay，或者setNeedsDisplayInRect:触发drawRect:，但是有个前提条件是rect不能为0。
     以上1,2推荐；而3,4不提倡
     1、若使用UIView绘图，只能在drawRect：方法中获取相应的contextRef并绘图。如果在其他方法中获取将获取到一个invalidate的ref并且不能用于画图。drawRect：方法不能手动显示调用，必须通过调用setNeedsDisplay 或者 setNeedsDisplayInRect，让系统自动调该方法。
     2、若使用CAlayer绘图，只能在drawInContext: 中（类似于drawRect）绘制，或者在delegate中的相应方法绘制。同样也是调用setNeedDisplay等间接调用以上方法
     3、若要实时画图，不能使用gestureRecognizer，只能使用touchbegan等方法来掉用setNeedsDisplay实时刷新屏幕
     */
    self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)removeFromSuperview
{
    [super removeFromSuperview];
    self.completionBlock(NSStringFromSelector(_cmd));
}
//- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
//{
//    self.completionBlock(NSStringFromSelector(_cmd));
//}
//- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview
//{
//    self.completionBlock(NSStringFromSelector(_cmd));
//}

/**
 实现了drawRect方法会执行次方法，不执行drawRect方法

 @param layer
 @param ctx
 */
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
//{
//    self.completionBlock(NSStringFromSelector(_cmd));
//}
//- (void)drawRect:(CGRect)rect forViewPrintFormatter:(UIViewPrintFormatter *)formatter
//{
//    self.completionBlock(NSStringFromSelector(_cmd));
//}
- (void)layoutIfNeeded
{
    self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)willRemoveSubview:(UIView *)subview
{
    self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)willMoveToWindow:(UIWindow *)newWindow
{
    self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)didMoveToWindow
{
    self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)didAddSubview:(UIView *)subview
{
    self.completionBlock(NSStringFromSelector(_cmd));
}
- (void)didMoveToSuperview
{
    self.completionBlock(NSStringFromSelector(_cmd));
}
//- (void)setNeedsDisplay
//{
//    //异步调用
//
////    self.completionBlock(NSStringFromSelector(_cmd));
//}
//- (void)setNeedsDisplayInRect:(CGRect)rect
//{
//    self.completionBlock(NSStringFromSelector(_cmd));
//}
@end
