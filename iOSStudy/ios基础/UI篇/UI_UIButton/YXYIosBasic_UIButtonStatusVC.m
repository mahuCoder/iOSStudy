//
//  YXYIosBasic_UIButtonStatusVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/20.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIButtonStatusVC.h"

@interface YXYIosBasic_UIButtonStatusVC ()

@property (nonatomic, strong) UIButton *statusButton;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, assign) NSInteger index;


@end

@implementation YXYIosBasic_UIButtonStatusVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.statusButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    //可以关闭禁用状态下的图片效果 默认yes
    [self.statusButton setAdjustsImageWhenDisabled:YES];
    //可以关闭高亮状态下的图片效果 默认yes
    [self.statusButton setAdjustsImageWhenHighlighted:YES];
    //可以打开高亮状态下的发光效果 默认NO
    [self.statusButton setShowsTouchWhenHighlighted:YES];
    
    self.statusButton.backgroundColor = HEXCOLOR(0x666666);
    [self.statusButton setTitle:@"按钮普通状态" forState:(UIControlStateNormal)];
    [self.statusButton setTitle:@"按钮高亮状态" forState:(UIControlStateHighlighted)];
    [self.statusButton setTitle:@"按钮禁用状态" forState:(UIControlStateDisabled)];
    [self.statusButton setTitle:@"按钮选中状态" forState:(UIControlStateSelected)];
    [self.statusButton setTitle:@"按钮Focused状态" forState:(UIControlStateFocused)];
    [self.statusButton setTitle:@"按钮Application状态" forState:(UIControlStateApplication)];
    [self.statusButton setTitle:@"按钮Reserved状态" forState:(UIControlStateReserved)];
    [self.statusButton setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
    [self.view addSubview:self.statusButton];
    [self.statusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(50);
    }];
    [self.statusButton addTarget:self action:@selector(actionTouchUpInside) forControlEvents:(UIControlEventTouchUpInside)];
    [self.statusButton addTarget:self action:@selector(actionTouchTouchDown) forControlEvents:(UIControlEventTouchDown)];
    [self.statusButton addTarget:self action:@selector(actionTouchCancel) forControlEvents:(UIControlEventTouchCancel)];
    [self.statusButton addTarget:self action:@selector(actionTouchDragExit) forControlEvents:(UIControlEventTouchDragExit)];
    [self.statusButton addTarget:self action:@selector(actionTouchDragEnter) forControlEvents:(UIControlEventTouchDragEnter)];
    [self.statusButton addTarget:self action:@selector(actionTouchUpOutside) forControlEvents:(UIControlEventTouchUpOutside)];
    [self.statusButton addTarget:self action:@selector(actionTouchDownRepeat) forControlEvents:(UIControlEventTouchDownRepeat)];
    [self.statusButton addTarget:self action:@selector(actionTouchDragInside) forControlEvents:(UIControlEventTouchDragInside)];
    
    
    
    UIButton *resetButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [resetButton setTitle:@"复位" forState:(UIControlStateNormal)];
    [resetButton setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [resetButton addTarget:self action:@selector(actionResetButton) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:resetButton];
    [resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(self.statusButton.mas_bottom).offset(20);
    }];
    
    UIButton *disEnableButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [disEnableButton setTitle:@"禁用" forState:(UIControlStateNormal)];
    [disEnableButton setTitle:@"恢复" forState:(UIControlStateSelected)];
    [disEnableButton setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [disEnableButton addTarget:self action:@selector(actionDisEnableButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:disEnableButton];
    [disEnableButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.statusButton.mas_bottom).offset(20);
    }];
    
    self.statusLabel = [[UILabel alloc] init];
    self.statusLabel.numberOfLines = 0;
    self.statusLabel.font = FONT(11);
    [self.view addSubview:self.statusLabel];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(resetButton.mas_bottom).offset(20);
    }];
    self.statusLabel.text = [NSString stringWithFormat:@"%ld、当前普通状态",self.index];
    
}
- (void)actionDisEnableButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.statusButton setEnabled:!sender.selected];
}
- (void)actionTouchUpInside {
    self.statusButton.selected = !self.statusButton.selected;
    [self showTextWithText:@"按钮确认事件 touchUpInside"];
}
- (void)actionTouchTouchDown {
    [self showTextWithText:@"按钮开始按下 touchTouchDown"];
}
- (void)actionTouchCancel {
    ///所有触摸取消事件，即一次触摸因为放上了太多手指而被取消，或者被上锁或者电话呼叫打断。
    [self showTextWithText:@"取消接触 touchCancel"];
}
- (void)actionTouchDragExit {
    [self showTextWithText:@"拖动离开 touchDragExit"];
}
- (void)actionTouchDragEnter {
    ///当一次触摸从控件窗口之外拖动到内部时
    [self showTextWithText:@"拖动进入 touchDragEnter"];
}
- (void)actionTouchUpOutside {
    [self showTextWithText:@" touchUpOutside 按住手势滑出触发"];
}
- (void)actionTouchDownRepeat {
    //多点触摸按下事件，点触计数大于1：用户按下第二、三、或第四根手指的时候。
    [self showTextWithText:@"touchDownRepeat"];
}
- (void)actionTouchDragInside {
    [self showTextWithText:@"touchDragInside 持续按住中"];
}
- (void)showTextWithText:(NSString *)actionText {
    NSString *text = self.statusLabel.text;
    self.index ++;
    self.statusLabel.text = [text stringByAppendingFormat:@"\n %ld、%@",self.index, actionText];
}
- (void)actionResetButton {
    self.index = 0;
    self.statusLabel.text =[NSString stringWithFormat:@"%ld、当前普通状态",self.index];
//    se
}


@end
