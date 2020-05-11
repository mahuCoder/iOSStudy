//
//  YXYIosBasic_UINavigation.m
//  iOSStudy
//
//  Created by sunny on 2020/3/25.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UINavigation.h"

@interface YXYIosBasic_UINavigation ()

@end

@implementation YXYIosBasic_UINavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayData = @[@"默认navigation",@"返回样式"];
    
    self.arrayVC = @[@"YXYIosBasic_UINavigationDefault",@""];
    // Do any additional setup after loading the view.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[NSClassFromString(self.arrayVC[indexPath.row]) alloc] init];
       if (vc) {
           vc.title = @"我是根试图";
           UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
           navC.modalPresentationStyle = UIModalPresentationFullScreen;
           [self presentViewController:navC animated:YES completion:nil];
       }
}


@end
