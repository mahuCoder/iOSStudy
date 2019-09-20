//
//  YXYIosBasic_UIViewContentModeDetailVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/17.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIViewContentModeDetailVC.h"

@interface YXYIosBasic_UIViewContentModeDetailVC ()

@property (nonatomic, strong) UIImageView *imageView;//图片实际大小 250 * 304



@end

@implementation YXYIosBasic_UIViewContentModeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *orginImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"example"]];
    orginImage.alpha = 0.5;
    [self.view addSubview:orginImage];
    [orginImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
//        make.top.offset(Height_NavBar);
    }];
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:@[@"图片大于视图",@"图片小于视图"]];
    [self.view addSubview:segmented];
    [segmented mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset( 5);
        make.centerX.offset(0);
    }];
    [segmented addTarget:self action:@selector(actionSegmented:) forControlEvents:(UIControlEventValueChanged)];
    segmented.selectedSegmentIndex = 0;
    UISegmentedControl *segmented_toBounds = [[UISegmentedControl alloc] initWithItems:@[@"默认不切除多余",@"切除多余"]];
    [self.view addSubview:segmented_toBounds];
    [segmented_toBounds mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset( 40);
        make.centerX.offset(0);
    }];
    [segmented_toBounds addTarget:self action:@selector(actionToBounds:) forControlEvents:(UIControlEventValueChanged)];
    segmented_toBounds.selectedSegmentIndex = 0;
    
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"example"]];
    self.imageView.contentMode = self.contentModel;
    self.imageView.backgroundColor = [UIColor yellowColor];
//    self.imageView.layer.masksToBounds = YES;
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(0);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}
- (void)actionSegmented:(UISegmentedControl *)sender
{
//    NSInteger Index = sender.selectedSegmentIndex;
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (sender.selectedSegmentIndex == 1) {
            make.size.mas_equalTo(CGSizeMake(350, 350));
        } else {
            make.size.mas_equalTo(CGSizeMake(200, 200));
        }
    }];
}
- (void)actionToBounds:(UISegmentedControl *)sender
{
    self.imageView.layer.masksToBounds = (sender.selectedSegmentIndex == 1) ? YES : NO;
}
@end
