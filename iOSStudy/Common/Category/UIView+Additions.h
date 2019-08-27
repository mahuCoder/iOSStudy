//
//  UIView+Additions.h
//  DFentor
//
//  Created by chun.chen on 2016/11/16.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

@property (nonatomic, strong) NSString *stringTag;

// coordinator getters
- (CGFloat)xx_height;
- (CGFloat)xx_width;
- (CGFloat)xx_x;
- (CGFloat)xx_y;
- (CGSize)xx_size;
- (CGPoint)xx_origin;
- (CGFloat)xx_centerX;
- (CGFloat)xx_centerY;
- (CGFloat)xx_bottom;
- (CGFloat)xx_right;

- (void)setXx_x:(CGFloat)x;
- (void)setXx_y:(CGFloat)y;

// height
- (void)setXx_height:(CGFloat)height;
- (void)xx_heightEqualToView:(UIView *)view;

// width
- (void)setXx_width:(CGFloat)width;
- (void)xx_widthEqualToView:(UIView *)view;

// center
- (void)setXx_centerX:(CGFloat)centerX;
- (void)setXx_centerY:(CGFloat)centerY;
- (void)xx_centerXEqualToView:(UIView *)view;
- (void)xx_centerYEqualToView:(UIView *)view;

// top, bottom, left, right
- (void)xx_top:(CGFloat)top FromView:(UIView *)view;
- (void)xx_bottom:(CGFloat)bottom FromView:(UIView *)view;
- (void)xx_left:(CGFloat)left FromView:(UIView *)view;
- (void)xx_right:(CGFloat)right FromView:(UIView *)view;

- (void)xx_topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)xx_bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)xx_leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)xx_rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;

- (void)xx_topEqualToView:(UIView *)view;
- (void)xx_bottomEqualToView:(UIView *)view;
- (void)xx_leftEqualToView:(UIView *)view;
- (void)xx_rightEqualToView:(UIView *)view;

// size
- (void)setXx_size:(CGSize)size;
- (void)xx_sizeEqualToView:(UIView *)view;

// imbueset
- (void)xx_fillWidth;
- (void)xx_fillHeight;
- (void)xx_fill;

- (UIView *)xx_topSuperView;


/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;
/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;

/**
 给View加上圆角和边框
 */
- (UIView *)roundedCornerAndBorderView;

- (void)addBorderTop:(BOOL)top
              bottom:(BOOL)bottom
                left:(BOOL)left
               right:(BOOL)right
               color:(UIColor *)color ;
- (void)addUpperBorder:(UIRectEdge)edge
                 color:(UIColor *)color
             thickness:(CGFloat)thickness;

- (id)subviewWithTag:(NSInteger)tag;

- (void)cornerRect:(UIRectCorner)corners withRadius:(CGFloat)r;

@end
