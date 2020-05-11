//
//  YXYIosBasic_UIActivityIndicatorView.m
//  iOSStudy
//
//  Created by sunny on 2020/3/23.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIActivityIndicatorView.h"

@interface YXYIosBasic_UIActivityIndicatorView ()
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation YXYIosBasic_UIActivityIndicatorView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *segmentC = [[UISegmentedControl alloc] initWithItems:@[@"默认(灰)",@"白",@"白大",@"ios13(灰)",@"ios13(灰大)"]];
    [self.view addSubview:segmentC];
    [segmentC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.centerX.offset(0);
    }];
    [segmentC addTarget:self action:@selector(actionSegment:) forControlEvents:(UIControlEventValueChanged)];
    
    UISegmentedControl *segmentC_1 = [[UISegmentedControl alloc] initWithItems:@[@"开启",@"关闭"]];
    [self.view addSubview:segmentC_1];
    [segmentC_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(55);
        make.centerX.offset(0);
    }];
    [segmentC_1 addTarget:self action:@selector(actionSegment_1:) forControlEvents:(UIControlEventValueChanged)];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.numberOfLines = 0;
    descLabel.text = @"UIActivityIndicatorView在执行动画时相当于时一个动画的UIImageView在播放动画";
    [self.view addSubview:descLabel];
    descLabel.preferredMaxLayoutWidth = ScreenWidth - 30;
    descLabel.font = FONT(12);
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(100);
    }];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] init];
//    indicatorView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:indicatorView];
    [indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    self.indicatorView = indicatorView;
    // Do any additional setup after loading the view.
    
    
    
}

- (void)actionSegment:(UISegmentedControl *)sender {
    self.indicatorView.backgroundColor = [UIColor whiteColor];
    NSInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0:
            {
                self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
            }
            break;
        case 1:
            {
                self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
                self.indicatorView.backgroundColor = HEXCOLOR(0xcccccc);
            }
        break;
        case 2:
            {
                self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
                self.indicatorView.backgroundColor = HEXCOLOR(0xcccccc);
            }
        break;
        case 3:
            {
                if (@available(iOS 13.0, *)) {
                    self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleMedium;
                } else {
                    // Fallback on earlier versions
                }
            }
        break;
        case 4:
            {
                if (@available(iOS 13.0, *)) {
                    self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
                } else {
                    // Fallback on earlier versions
                }
            }
        break;
        default:
            break;
    }

}
- (void)actionSegment_1:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0:
            {
                [self.indicatorView startAnimating];
            }
            break;
        case 1:
            {
                [self.indicatorView stopAnimating];
            }
        break;
            
        default:
            break;
    }
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
