//
//  YXYIosBasic_UITableView.m
//  iOSStudy
//
//  Created by sunny on 2020/3/24.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UITableView.h"

@interface YXYIosBasic_UITableView ()

@end

@implementation YXYIosBasic_UITableView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = @[@"plain",@"group",@"InsetGrouped(ios13)"];
    self.arrayVC = @[@"YXYIosBasic_UITableViewPlain",@"YXYIosBasic_UITableViewGroup",@"YXYIosBasic_UITableViewInsetGrouped"];
    
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
