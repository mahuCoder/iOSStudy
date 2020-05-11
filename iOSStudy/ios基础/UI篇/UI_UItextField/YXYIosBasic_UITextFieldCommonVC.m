//
//  YXYIosBasic_UITextFieldCommonVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/22.
//  Copyright © 2020 yunhun. All rights reserved.
//


#import "YXYIosBasic_UITextFieldCommonVC.h"

@interface YXYIosBasic_UITextFieldCommonVC ()<UITextFieldDelegate>

@property (nonatomic, assign) CGFloat textFTop;

@property (nonatomic, strong) UITextField *passwordTF;
@end

@implementation YXYIosBasic_UITextFieldCommonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textFTop = 10;
    [self addTextField_0];
    
    [self addTextField_1];
    
    [self addTextField_2];
    
    [self addTextField_3];
    
    [self addTextField_4];
}


- (void)addTextField_0 {
    UITextField *textF = [[UITextField alloc] init];
    textF.placeholder = @"默认样式";
    [self.view addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.textFTop);
        make.width.mas_offset(ScreenWidth - 30);
    }];
    self.textFTop += 50;
}

- (void)addTextField_1 {
    UITextField *textF = [[UITextField alloc] init];
    textF.borderStyle = UITextBorderStyleRoundedRect;//圆角样式UITextBorderStyleBezel灰色边框阴影UITextBorderStyleLine黑色边框UITextBorderStyleNone无边框(默认)
    textF.placeholder = @"系统圆角/文字居右/拼写校验/自动纠正";
    //拼写校验
    textF.spellCheckingType = UITextSpellCheckingTypeYes;
    //自动纠正
    textF.autocorrectionType = UITextAutocorrectionTypeYes;
    
    textF.textAlignment = NSTextAlignmentRight;
    textF.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.textFTop);
        make.width.mas_offset(ScreenWidth - 30);
    }];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView *serachImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    serachImageView.image = [UIImage imageNamed:@"search"];
    serachImageView.contentMode = UIViewContentModeCenter;
    [leftView addSubview:serachImageView];
    textF.leftView = leftView;
    textF.leftViewMode = UITextFieldViewModeAlways;
    self.textFTop += 50;
}
- (void)addTextField_2 {
    UITextField *textF = [[UITextField alloc] init];
    textF.placeholder = @"自定义圆角样/搜索/拼音校验/限制10个";
    textF.returnKeyType = UIReturnKeySearch;
    textF.layer.borderColor = [UIColor redColor].CGColor;
    textF.layer.borderWidth = 0.5;
    textF.layer.cornerRadius = 6;
    textF.layer.masksToBounds = YES;
    [self.view addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.textFTop);
        make.width.mas_offset(ScreenWidth - 30);
        make.height.mas_equalTo(30);
    }];
//    textF.delegate = self;
    //限制文字监听UIControlEventValueChanged 最终画确认的值
    [textF addTarget:self action:@selector(textFValueChange:) forControlEvents:(UIControlEventEditingChanged)];
    self.textFTop += 50;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView *serachImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    serachImageView.image = [UIImage imageNamed:@"search"];
    serachImageView.contentMode = UIViewContentModeCenter;
    [leftView addSubview:serachImageView];
    textF.leftView = leftView;
    textF.leftViewMode = UITextFieldViewModeAlways;
    textF.clearButtonMode = UITextFieldViewModeWhileEditing;
}
- (void)addTextField_3 {
    UITextField *textF = [[UITextField alloc] init];
    //加密
    [textF setSecureTextEntry:YES];
    textF.keyboardType = UIKeyboardTypeNumberPad;
    textF.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.textFTop);
        make.width.mas_offset(ScreenWidth - 30);
    }];
    self.textFTop += 50;
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIButton *changeSecureBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [changeSecureBtn setImage:[UIImage imageNamed:@"password_show"] forState:(UIControlStateSelected)];
    [changeSecureBtn setImage:[UIImage imageNamed:@"password_hidden"] forState:(UIControlStateNormal)];
    [rightView addSubview:changeSecureBtn];
    textF.rightView = rightView;
    textF.rightViewMode = UITextFieldViewModeAlways;
    [changeSecureBtn addTarget:self action:@selector(actionChangeSecure:) forControlEvents:(UIControlEventTouchUpInside)];
    self.passwordTF = textF;
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = HEXCOLOR(0xcccccc).CGColor;
    layer.frame = CGRectMake(0, 30, ScreenWidth - 30, 1);
    [textF.layer addSublayer:layer];
    textF.textColor = [UIColor redColor];
    textF.font = FONT(18);
    textF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码/数字键盘/单线模式" attributes:@{NSFontAttributeName:FONT(12),NSForegroundColorAttributeName:[UIColor greenColor]}];
}
- (void)addTextField_4 {
    UITextField *textF = [[UITextField alloc] init];
    textF.layer.borderColor = [UIColor redColor].CGColor;
    [self.view addSubview:textF];
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(self.textFTop);
        make.width.mas_offset(ScreenWidth - 30);
    }];
    self.textFTop += 50;
    textF.placeholder = @"关闭首字母大写/黑色键盘/富文本粘贴";
    //设置键盘风格
    textF.keyboardAppearance = UIKeyboardAppearanceDark;;
    //关闭首字母大写
    textF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //可粘贴富文本
    textF.allowsEditingTextAttributes = YES;
}
- (void)actionChangeSecure:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.passwordTF setSecureTextEntry:!sender.selected];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [ToastManager showToast:textField.text];
    return YES;
}
- (void)changeTextF:(NSNotification *)sender {
    UITextField *textfield = [sender object];
    NSLog(@"%@",textfield.text);
}
- (void)textFValueChange:(UITextField *)sender {
    NSLog(@"%@",sender.text);
    UITextInputMode *inputModel = [sender textInputMode];
    NSString *language = [inputModel primaryLanguage]; // 键盘输入模式
    if ([language isEqualToString:@"zh-Hans"]) {// 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [sender markedTextRange];
        //获取高亮部分
        UITextPosition *position = [sender positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (sender.text.length > 10) {
                sender.text = [sender.text substringToIndex:10];
            }
        } else{
            // 有高亮选择的字符串（还在输入拼音/笔画中），则暂不对文字进行统计和限制
        }
    } else {//其他语言直接限制
        if (sender.text.length > 10) {
            //限制文字10个字
            sender.text = [sender.text substringToIndex:10];
        }
    }

}

@end
