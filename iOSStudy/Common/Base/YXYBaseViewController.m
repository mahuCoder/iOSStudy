//
//  YXYBaseViewController.m
//  iOS技术学习总结
//
//  Created by 胡雪刚 on 2019/5/8.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYBaseViewController.h"

@interface YXYBaseViewController ()

@end

@implementation YXYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self setRandowColor];
    
    
}


- (UIColor *)setRandowColor
{
    return [UIColor colorWithRed:arc4random()%255 / 255.f green:arc4random()%255 / 255.f blue:arc4random()%255 / 255.f alpha:arc4random()%255 / 255.f];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
