//
//  YXYIosBasic_UISegmentedControl.m
//  iOSStudy
//
//  Created by sunny on 2020/3/22.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UISegmentedControl.h"

@interface YXYIosBasic_UISegmentedControl ()

@property (nonatomic, strong) UISegmentedControl *segmentShow;

@property (nonatomic, strong) UISegmentedControl *segmentControl;


@end

@implementation YXYIosBasic_UISegmentedControl

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arrayC = @[@"复位", @"改变大小", @"插入文字", @"插入图片", @"删除", @"我被禁用"];
    UISegmentedControl *segmentC = [[UISegmentedControl alloc] initWithItems:arrayC];
//    segmentC.segmentedControlStyle
    [self.view addSubview:segmentC];
    [segmentC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.centerX.offset(0);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 30));
    }];
    
    [segmentC addTarget:self action:@selector(segmentChange:) forControlEvents:(UIControlEventValueChanged)];
    //禁用某个
    [segmentC setEnabled:NO forSegmentAtIndex:5];
        
   
    self.segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"宽度60",@"不保持选中", @"宽度不一致",@"偏移一下"]];
    [self.view addSubview:self.segmentControl];
    [self.segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(segmentC.mas_bottom).offset(15);
        make.centerX.offset(0);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, 30));
    }];
    [self.segmentControl addTarget:self action:@selector(actionSegmentControl:) forControlEvents:(UIControlEventValueChanged)];
//    self.segmentControl.backgroundColor = [UIColor greenColor];
    self.segmentControl.tintColor = [UIColor clearColor];
    if (@available(iOS 13.0, *)) {
        self.segmentControl.selectedSegmentTintColor = [UIColor redColor];
    } else {
        // Fallback on earlier versions
    }
    //默认选中某个
    [self.segmentControl setSelectedSegmentIndex:0];
    //改变默认颜色
    [self.segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:(UIControlStateNormal)];
    [self.segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor yellowColor],NSFontAttributeName:FONT(15)} forState:(UIControlStateSelected)];
    
    //指定单个宽度
    [self.segmentControl setWidth:60 forSegmentAtIndex:0];
    
    
    
    self.segmentShow = [[UISegmentedControl alloc] initWithItems:@[@"我是单元位"]];
    [self.view addSubview:self.segmentShow];
    [self.segmentShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentControl.mas_bottom).offset(15);
        make.centerX.offset(0);
    }];
    [self.segmentShow addTarget:self action:@selector(actionSegment:) forControlEvents:(UIControlEventValueChanged)];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.numberOfLines = 0;
    descLabel.font = FONT(14);
    [descLabel setPreferredMaxLayoutWidth:ScreenWidth - 30];
    [self.view addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentShow.mas_bottom).offset(15);
        make.left.offset(15);
    }];
    descLabel.text = @"1、segmentControl加载Image时需用UIImageRenderingModeAlwaysOriginal模式加载";
}
- (void)actionSegmentControl:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;
    if (index == 0) {
    } else if (index == 1) {
        self.segmentShow.momentary = YES;
    } else if (index == 2) {
        [self.segmentShow setApportionsSegmentWidthsByContent:YES];
    } else if (index == 3) {
        if ([self.segmentShow titleForSegmentAtIndex:0].length) {
            [self.segmentShow setContentOffset:CGSizeMake(-10, -5) forSegmentAtIndex:0];
        }
    }
}
- (void)segmentChange:(UISegmentedControl *)sender {
    //可以获取选中的位置
    NSInteger index = sender.selectedSegmentIndex;
    //可以获取某个的标题
    NSString *title = [sender titleForSegmentAtIndex:index];
    if (index == 0) {
        self.segmentShow.apportionsSegmentWidthsByContent = NO;
        self.segmentShow.momentary = NO;
        [self isChangeFrame:NO];
        [self.segmentShow setEnabled:YES forSegmentAtIndex:0];
        if ([self.segmentShow titleForSegmentAtIndex:0].length) {
            [self.segmentShow setContentOffset:CGSizeZero forSegmentAtIndex:0];
        }
//        self.segmentShow.seg
    } else if (index == 1) {
        [self isChangeFrame:YES];
    } else if (index == 2) {
        [self insetTitle];
    } else if (index == 3) {
        UIImage *image = [[UIImage imageNamed:@"WeChat"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        [self.segmentShow insertSegmentWithImage:image atIndex:0 animated:YES];
    } else if (index == 4) {
        if (self.segmentShow.numberOfSegments > 1) {
            [self.segmentShow removeSegmentAtIndex:0 animated:YES];
        }
    } else if (index == 5) {
        [self.segmentShow setEnabled:NO forSegmentAtIndex:0];
    }
    DebugLog(@"选中的文字是：%@",title);
}
- (void)actionSegment:(UISegmentedControl *)sender {
    
}
- (void)isChangeFrame:(BOOL )isChange {
    [self.segmentShow  mas_updateConstraints:^(MASConstraintMaker *make) {
        if (isChange) {
            make.height.mas_equalTo(50);
        } else {
            make.height.mas_equalTo(30);
        }
    }];
}
- (void)insetTitle {
    [self.segmentShow insertSegmentWithTitle:@"插入的" atIndex:0 animated:YES];
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
