//
//  YXYIosBasic_UIToolbar.m
//  iOSStudy
//
//  Created by sunny on 2020/3/26.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIToolbar.h"

@interface YXYIosBasic_UIToolbar ()<UIToolbarDelegate>

@property (nonatomic, strong) UITextField *textfield;

@property (nonatomic, assign) CGFloat top;


@end

@implementation YXYIosBasic_UIToolbar

- (void)viewDidLoad {
    [super viewDidLoad];
    self.top = 15;
    UIImageView *imageView = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"example"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.text = @"toolbar自带毛玻璃效果，布局时常借助占位（UIBarButtonSystemItemFlexibleSpace），图片默认Y居中，文字默认49的高度居中";
    descLabel.numberOfLines = 0;
    descLabel.preferredMaxLayoutWidth = ScreenWidth - 30;
    descLabel.font = FONT(12);
    [self.view addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.left.offset(15);
    }];
    
    self.top += 60;
    [self addToolbar_0];
    
    [self addToolbar_1];
    
    [self addToolbar_2];
    
    [self addToolbar_3];
    
    [self addToolbar_4];
    
    [self addToolbar_5];
}

- (void)addToolbar_0 {
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    UIBarButtonItem *item0=[[UIBarButtonItem alloc]initWithTitle:@"居左" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithTitle:@"左2" style:UIBarButtonItemStylePlain target:self action:nil];
    toolbar.items=@[item0,item3];
    [self.view addSubview:toolbar];
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
        make.left.offset(0);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addToolbar_1 {
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    toolbar.barTintColor=[UIColor brownColor];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"居中" style:UIBarButtonItemStylePlain target:self action:nil];
    [item1 setTintColor:[UIColor redColor]];
    toolbar.items=@[space,item1,space];
    [self.view addSubview:toolbar];
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
        make.left.offset(15);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addToolbar_2 {
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    toolbar.barStyle = UIBarStyleBlack;
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"barStyle = UIBarStyleBlack" style:UIBarButtonItemStylePlain target:self action:nil];
    toolbar.items=@[space,item1,space];
    [self.view addSubview:toolbar];
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
        make.left.offset(0);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addToolbar_3 {
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    toolbar.translucent =  NO;
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"translucent不透明" style:UIBarButtonItemStylePlain target:self action:nil];
    toolbar.items=@[space,item1,space];
    [self.view addSubview:toolbar];
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
        make.left.offset(0);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addToolbar_4 {
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    toolbar.delegate = self;
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"我开代理了" style:UIBarButtonItemStylePlain target:self action:nil];
    toolbar.items=@[space,item1,space];
    [self.view addSubview:toolbar];
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
        make.left.offset(15);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addToolbar_5 {
    UIToolbar *toolbar=[[UIToolbar alloc]init];
    UIBarButtonItem *item0=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"alipay"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithTitle:@"左2" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item3=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:nil];
    toolbar.items=@[item0,item1,item2,item3];
    [self.view addSubview:toolbar];
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.centerX.offset(0);
        make.left.offset(15);
        make.height.equalTo(@90);
    }];
    self.top += 50;
}


- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar {
    return UIBarPositionTop;
}
@end
