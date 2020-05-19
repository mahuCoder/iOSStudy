//
//  YXYIosBasic_block_exapmleVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/19.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_block_exapmleVC.h"

@interface YXYIosBasic_block_exapmleVC ()

@end

@implementation YXYIosBasic_block_exapmleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.font = FONT(14);
    [self.view addSubview:label];
    label.preferredMaxLayoutWidth = ScreenWidth - 30;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.offset(0);
    }];
    label.text = @"";
    
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
