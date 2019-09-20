//
//  YXYIosBasic_UIViewFrameVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/18.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIViewFrameVC.h"

@interface YXYIosBasic_UIViewFrameVC ()
{
}
@property (nonatomic, strong) UIView *superView;
@property (nonatomic, strong) UIView *subView;
@property (nonatomic, strong) UILabel *superLabel;
@property (nonatomic, strong) UILabel *subLabel;


@end

@implementation YXYIosBasic_UIViewFrameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.superView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    self.superView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.superView];
    self.subView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    self.subView.backgroundColor = [UIColor greenColor];
    [self.superView addSubview:self.subView];
    
    
    self.superLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    _superLabel.font = FONT(12);
    _superLabel.numberOfLines = 0;
    _superLabel.textColor = HEXCOLOR(0x333333);
    [self.superView addSubview:self.superLabel];
    
    self.subLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    _subLabel.font = FONT(12);
    _subLabel.numberOfLines = 0;
    _subLabel.textColor = HEXCOLOR(0x333333);
    [self.subView addSubview:self.subLabel];
    
    
    self.superLabel.text = [NSString stringWithFormat:@"frame=%@,\nbounds=%@", NSStringFromCGRect(self.superView.frame), NSStringFromCGRect(self.superView.bounds)];
    self.subLabel.text = [NSString stringWithFormat:@"frame=%@,\nbounds=%@", NSStringFromCGRect(self.subView.frame), NSStringFromCGRect(self.subLabel.bounds)];
    
    
    UILabel *rect_label_to = [[UILabel alloc] initWithFrame:CGRectMake(15, 400, 350, 100)];
    rect_label_to.textColor = HEXCOLOR(0x333333);
    rect_label_to.font = FONT(14);
    rect_label_to.numberOfLines = 0;
    [self.view addSubview:rect_label_to];
    rect_label_to.text = @"转换坐标：A convertRect:B.frame toView:C\n *将B的frame（相对于父视图）的size保留，\n origin加上A相对于C的frame的origin组成新的origin,返回最新的rect";
    
    UILabel *rect_label_from = [[UILabel alloc] initWithFrame:CGRectMake(15, 500, 350, 100)];
    rect_label_from.textColor = HEXCOLOR(0x333333);
    rect_label_from.font = FONT(14);
    rect_label_from.numberOfLines = 0;
    [self.view addSubview:rect_label_from];
    rect_label_from.text = @"转换坐标：A convertRect:B.frame fromView:C\n *将B的frame（相对于父视图）的size保留，\norigin加上C相对于A的frame的origin组成新的origin,返回最新的rect";
  
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
