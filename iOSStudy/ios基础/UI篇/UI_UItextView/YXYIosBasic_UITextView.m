//
//  YXYIosBasic_UITextView.m
//  iOSStudy
//
//  Created by sunny on 2020/3/26.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UITextView.h"

@interface YXYIosBasic_UITextView ()

@property (nonatomic, assign) CGFloat top;

@end

@implementation YXYIosBasic_UITextView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.top = 15;
    [self addTextView_0];
    
    [self addTextView_1];

    [self addTextView_2];

//    [self addTextView_3];
//
//    [self addTextView_4];
//
//    [self addTextView_5];

//    [self addTextView_6];

}

- (void)addTextView_0 {
    UITextView *textView = [[UITextView alloc] init];
    textView.text = @"我是默认文本编辑器";
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addTextView_1 {
    UITextView *textView = [[UITextView alloc] init];
    textView.backgroundColor = [UIColor blueColor];
    textView.editable = NO;
    textView.font = FONT(19);
    textView.text = @"我是不能编辑的文本";
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addTextView_2 {
    UITextView *textView = [[UITextView alloc] init];
    textView.scrollEnabled = NO;
    textView.text = @"我无法滚动";
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addTextView_3 {
    UITextView *textView = [[UITextView alloc] init];
    //自适应高度
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    textView.text = @"检测电话13666668888,网址https://www.baidu.com和邮箱wuming@yahoo.com、。符合条件的文本中的内容就会高亮";
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@80);
    }];
    self.top += 50;
}
- (void)addTextView_4 {
    UITextView *textView = [[UITextView alloc] init];
    textView.text = @"我是默认文本编辑器";
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
- (void)addTextView_5 {
    UITextView *textView = [[UITextView alloc] init];
    textView.text = @"我是默认文本编辑器";
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(self.top);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.equalTo(@40);
    }];
    self.top += 50;
}
@end
