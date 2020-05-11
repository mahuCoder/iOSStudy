//
//  YXYIosBasic_RootVC.h
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/4.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YXYIosBasic_RootVC : YXYBaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSArray *arrayVC;


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
