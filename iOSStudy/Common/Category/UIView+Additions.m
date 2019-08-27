#import "UIView+Additions.h"
#import "objc/runtime.h"

@implementation UIView (Additions)

static char ILStringTagKey;

- (void)setStringTag:(NSString *)stringTag{

    objc_setAssociatedObject(self, &ILStringTagKey, stringTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)stringTag{

    return objc_getAssociatedObject(self, &ILStringTagKey);
}

// coordinator getters
- (CGFloat)xx_height
{
    return CGRectGetHeight(self.bounds);
}

- (CGFloat)xx_width
{
    return CGRectGetWidth(self.bounds);
}

- (CGFloat)xx_x
{
    return self.frame.origin.x;
}
- (void)setXx_x:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
- (void)setXx_y:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)xx_y
{
    return self.frame.origin.y;
}

- (CGSize)xx_size
{
    return self.frame.size;
}

- (CGPoint)xx_origin
{
    return self.frame.origin;
}

- (CGFloat)xx_centerX
{
    return self.center.x;
}

- (CGFloat)xx_centerY
{
    return self.center.y;
}

- (CGFloat)xx_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)xx_right
{
    return self.frame.size.width + self.frame.origin.x;
}

// height
- (void)setXx_height:(CGFloat)height;
{
    CGRect newFrame = CGRectMake(self.xx_x, self.xx_y, self.xx_width, height);
    self.frame = newFrame;
}

- (void)xx_heightEqualToView:(UIView *)view
{
    self.xx_height = view.xx_height;
}

// width
- (void)setXx_width:(CGFloat)width
{
    CGRect newFrame = CGRectMake(self.xx_x, self.xx_y, width, self.xx_height);
    self.frame = newFrame;
}

- (void)xx_widthEqualToView:(UIView *)view
{
    self.xx_width = view.xx_width;
}

// center
- (void)setXx_centerX:(CGFloat)centerX
{
    CGPoint center = CGPointMake(self.xx_centerX, self.xx_centerY);
    center.x = centerX;
    self.center = center;
}

- (void)setXx_centerY:(CGFloat)centerY
{
    CGPoint center = CGPointMake(self.xx_centerX, self.xx_centerY);
    center.y = centerY;
    self.center = center;
}

- (void)xx_centerXEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.xx_topSuperView];
    CGPoint centerPoint = [self.xx_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.xx_centerX = centerPoint.x;
}

- (void)xx_centerYEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.xx_topSuperView];
    CGPoint centerPoint = [self.xx_topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.xx_centerY = centerPoint.y;
}

// top, bottom, left, right
- (void)xx_top:(CGFloat)top FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_y = newOrigin.y + top + view.xx_height;
}

- (void)xx_bottom:(CGFloat)bottom FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_y = newOrigin.y - bottom - self.xx_height;
}

- (void)xx_left:(CGFloat)left FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_x = newOrigin.x - left - self.xx_width;
}

- (void)xx_right:(CGFloat)right FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_x = newOrigin.x + right + view.xx_width;
}

- (void)xx_topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.xx_height = self.xx_y - top + self.xx_height;
    }
    self.xx_y = top;
}

- (void)xx_bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.xx_height = self.superview.xx_height - bottom - self.xx_y;
    } else {
        self.xx_y = self.superview.xx_height - self.xx_height - bottom;
    }
}

- (void)xx_leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.xx_width = self.xx_x - left + self.superview.xx_width;
    }
    self.xx_x = left;
}

- (void)xx_rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.xx_width = self.superview.xx_width - right - self.xx_x;
    } else {
        self.xx_x = self.superview.xx_width - self.xx_width - right;
    }
}

- (void)xx_topEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_y = newOrigin.y;
}

- (void)xx_bottomEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_y = newOrigin.y + view.xx_height - self.xx_height;
}

- (void)xx_leftEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_x = newOrigin.x;
}

- (void)xx_rightEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.xx_origin toView:self.xx_topSuperView];
    CGPoint newOrigin = [self.xx_topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.xx_x = newOrigin.x + view.xx_width - self.xx_width;
}

// size
- (void)setXx_size:(CGSize)size
{
    self.frame = CGRectMake(self.xx_x, self.xx_y, size.width, size.height);
}

- (void)xx_sizeEqualToView:(UIView *)view
{
    self.frame = CGRectMake(self.xx_x, self.xx_y, view.xx_width, view.xx_height);
}

// imbueset
- (void)xx_fillWidth
{
    self.xx_width = self.superview.xx_width;
}

- (void)xx_fillHeight
{
    self.xx_height = self.superview.xx_height;
}

- (void)xx_fill
{
    self.frame = CGRectMake(0, 0, self.superview.xx_width, self.superview.xx_height);
}

- (UIView *)xx_topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIView*)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
    } else {
        return nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIView *)roundedCornerAndBorderView{
    self.clipsToBounds = YES;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 1;
    
    return self;
}
- (void)addBorderTop:(BOOL)top
              bottom:(BOOL)bottom
                left:(BOOL)left
               right:(BOOL)right
               color:(UIColor *)color
{
    if (top) {
        [self addUpperBorder:UIRectEdgeTop color:color thickness:0.5f];
    }
    if (bottom) {
        [self addUpperBorder:UIRectEdgeBottom color:color thickness:0.5f];
    }
    if (left) {
        [self addUpperBorder:UIRectEdgeLeft color:color thickness:0.5f];
    }
    if (right) {
        [self addUpperBorder:UIRectEdgeRight color:color thickness:0.5f];
    }
}
- (void)addUpperBorder:(UIRectEdge)edge
                 color:(UIColor *)color
             thickness:(CGFloat)thickness
{
    CALayer *border = [CALayer layer];
    
    switch (edge) {
        case UIRectEdgeTop:
            border.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), thickness);
            break;
        case UIRectEdgeBottom:
            border.frame = CGRectMake(0, CGRectGetHeight(self.frame) - thickness, CGRectGetWidth(self.frame), thickness);
            break;
        case UIRectEdgeLeft:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(self.frame));
            break;
        case UIRectEdgeRight:
            border.frame = CGRectMake(CGRectGetWidth(self.frame)-thickness, 0, thickness, CGRectGetHeight(self.frame));
            break;
        default:
            break;
    }
    
    border.backgroundColor = color.CGColor;
    
    [self.layer addSublayer:border];
}

- (id)subviewWithTag:(NSInteger)tag{
    
    for(UIView *view in [self subviews]){
        if(view.tag == tag){
            return view;
        }
    }
    return nil;
}

//定向切圆角
- (void)cornerRect:(UIRectCorner)corners withRadius:(CGFloat)r
{
    CGRect selfRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGSize bottomSize = CGSizeMake(r, r);//圆角大小
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:selfRect byRoundingCorners:corners cornerRadii:bottomSize];
    CAShapeLayer *cornerMaskLayer = [CAShapeLayer layer];
    cornerMaskLayer.frame = self.bounds;
    [cornerMaskLayer setPath:path1.CGPath];
    self.layer.mask = cornerMaskLayer;
}

@end
