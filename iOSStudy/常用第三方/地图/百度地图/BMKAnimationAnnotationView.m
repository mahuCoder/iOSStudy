//
//  BMKAnimationAnnotationView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/5/24.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "BMKAnimationAnnotationView.h"

@implementation BMKAnimationAnnotationView


- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, 32, 32);
        UIImageView *annotationImage = [[UIImageView alloc] initWithFrame:self.frame];
        annotationImage.animationImages = @[[UIImage imageNamed:@"greenAnimationIcon"], [UIImage imageNamed:@"blackAnimationIcon"], [UIImage imageNamed:@"redAnimationIcon"]];
        annotationImage.animationDuration = 0.5 * 3;
        annotationImage.animationRepeatCount = 0;
        [annotationImage startAnimating];
        [self addSubview:annotationImage];
    }
    return self;
}

@end
