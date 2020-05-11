//
//  YXYIosBasic_UITextFieldVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/22.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UITextFieldVC.h"

@interface YXYIosBasic_UITextFieldVC ()

@end

@implementation YXYIosBasic_UITextFieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayData = @[@"常见基础样式", @"发送验证码样式", @"支付宝密码样式",@"touchID样式",@"短横线样式",@"禁止复制粘贴",@"银行卡间隔输入样式" ,@"自定义键盘样式"];
    self.arrayVC = @[@"YXYIosBasic_UITextFieldCommonVC",@"",@"",@"",@"",@"",@"",@""];
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
