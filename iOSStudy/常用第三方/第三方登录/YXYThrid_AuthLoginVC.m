//
//  YXYThrid_AuthLoginVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/8/23.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_AuthLoginVC.h"
#import "YXYVThrid_AuthLogin_wechatVC.h"

@interface YXYThrid_AuthLoginVC ()

@property (nonatomic, strong) NSMutableArray *arrayData;

@end

@implementation YXYThrid_AuthLoginVC

- (void)viewDidLoad {
    //pod 'WechatOpenSDK'
    [super viewDidLoad];
    self.arrayData = @[@{@"icon":@"WeChat", @"title":@"微信登录"},
                       @{@"icon":@"alipay",@"title":@"支付宝登录"},
                       @{@"icon":@"",@"title":@"微博登录"}].mutableCopy;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrayData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxx"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"xxx"];
    }
    NSDictionary *dict = self.arrayData[indexPath.section];
    [cell.imageView setImage:[UIImage imageNamed:dict[@"icon"]]];
    cell.textLabel.text = dict[@"title"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 59;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        YXYVThrid_AuthLogin_wechatVC *nextVC = [[YXYVThrid_AuthLogin_wechatVC alloc] init];
        [self.navigationController pushViewController:nextVC animated:YES];
    }
}
@end
