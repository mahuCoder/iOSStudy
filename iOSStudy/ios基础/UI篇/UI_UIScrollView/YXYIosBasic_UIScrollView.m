//
//  YXYIosBasic_UIScrollView.m
//  iOSStudy
//
//  Created by sunny on 2020/3/30.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIScrollView.h"

@interface YXYIosBasic_UIScrollView ()

@end

@implementation YXYIosBasic_UIScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayData = @[@"基础",@"移动",@"缩放",@"手势和代理"];
    self.arrayVC = @[@"YXYIosBasic_UIScrollViewDefault",@"YXYIosBasic_UIScrollViewMove",@"YXYIosBasic_UIScrollViewTouch",@"YXYIosBasic_UIScrollViewScale"];
    // Do any additional setup after loading the view.
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
