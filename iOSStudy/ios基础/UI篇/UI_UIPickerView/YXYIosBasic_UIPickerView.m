//
//  YXYIosBasic_UIPickerView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/12.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIPickerView.h"

@interface YXYIosBasic_UIPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong)UIPickerView *pickerView;
@end

@implementation YXYIosBasic_UIPickerView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIButton *resultButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [resultButton setTitleColor:UIColor.grayColor forState:(UIControlStateNormal)];
    [resultButton setTitle:@"获取结果" forState:(UIControlStateNormal)];
    [self.view addSubview:resultButton];
    [resultButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(15);
    }];
    [resultButton addTarget:self action:@selector(actionResult) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:self.pickerView];
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    ///滚动到指定位置
    [self.pickerView selectRow:1 inComponent:0 animated:YES];
    [self.pickerView selectRow:2 inComponent:1 animated:YES];
}
- (void)actionResult {
    
    
    NSInteger numLine =  [self.pickerView numberOfComponents];
    NSString *string = @"";
    for (int i = 0 ; i < numLine; i++ ) {
        NSInteger row = [self.pickerView selectedRowInComponent:i];
        NSString *compareString = [NSString stringWithFormat:@"%d组选择的是第%ld行\n",i,row];
        string = [string stringByAppendingString:compareString];
    }
    [ToastManager showToast:string];
}
///多少组
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
///每组多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}
///每组多宽
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 200;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"第%ld组第%ld行",component, row];
}
///组高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 49;
}
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [NSString stringWithFormat:@"第%ld组第%ld行",component, row];
    return [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:UIColor.redColor}];
}

- (UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.backgroundColor = UIColor.yellowColor;
    }
    return _pickerView;
}
@end
