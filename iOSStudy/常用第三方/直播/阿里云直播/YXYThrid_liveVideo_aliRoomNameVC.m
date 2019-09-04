//
//  YXYThrid_liveVideo_aliRoomNameVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/2.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_liveVideo_aliRoomNameVC.h"


@interface YXYThrid_liveVideo_aliRoomNameVC ()
{
    
}
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIVisualEffectView *effectView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextField *nameTextF;
@property (nonatomic, strong) UIButton *starLiveBtn;


@end

@implementation YXYThrid_liveVideo_aliRoomNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.backImageView];
    [self.view addSubview:self.effectView];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.view addSubview:self.closeBtn];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.nameTextF];
    [self.view addSubview:self.starLiveBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(Height_StatusBar);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(-100);
    }];
    [self.nameTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(-40);
        make.centerX.offset(0);
        make.width.mas_equalTo(ScreenWidth - 40);
    }];
    [self.starLiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(40);
        make.left.offset(20);
        make.height.equalTo(@50);
    }];
}
- (void)actionClose
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)actionStarLive
{
    
}
- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
        _backImageView.image = [UIImage imageNamed:@"直播背景"];
    }
    return _backImageView;
}
- (UIVisualEffectView *)effectView
{
    if (!_effectView) {
        UIBlurEffect *visual = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleDark)];
        _effectView = [[UIVisualEffectView alloc] initWithEffect:visual];
        _effectView.frame = [UIScreen mainScreen].bounds;
        _effectView.alpha = 0.9;
    }
    return _effectView;
}
- (UIButton *)closeBtn
{
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_closeBtn setImage:[UIImage imageNamed:@"aliLive_close"] forState:(UIControlStateNormal)];
        [_closeBtn addTarget:self action:@selector(actionClose) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _closeBtn;
}
-(UILabel *)nameLabel
{
    if (!_nameLabel ) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = HEXCOLOR(0xffffff);
        _nameLabel.font = FONT(28);
        _nameLabel.text = @"给直播写个标题吧";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
-(UITextField *)nameTextF
{
    if (!_nameTextF) {
        _nameTextF = [[UITextField alloc] init];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"#添加话题" attributes:@{NSFontAttributeName:FONT(18),NSForegroundColorAttributeName:HEXCOLOR(0xcccccc)}];
        _nameTextF.attributedPlaceholder = attr;
        _nameTextF.font = FONT(18);
        _nameTextF.textColor = HEXCOLOR(0xffffff);
        _nameTextF.textAlignment = NSTextAlignmentCenter;
        CALayer *layer = [[CALayer alloc] init];
        layer.frame = CGRectMake(0, 39, ScreenWidth - 40, 1);
        layer.backgroundColor = HEXCOLOR(0xcccccc).CGColor;
        [_nameTextF.layer addSublayer:layer];
    }
    return  _nameTextF;
}
- (UIButton *)starLiveBtn
{
    if (!_starLiveBtn) {
        _starLiveBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_starLiveBtn setTitle:@"开始直播" forState:(UIControlStateNormal)];
        _starLiveBtn.layer.cornerRadius = 25;
        _starLiveBtn.layer.masksToBounds = YES;
        [_starLiveBtn setTitleColor:[UIColor yellowColor] forState:(UIControlStateNormal)];
        _starLiveBtn.layer.borderWidth = 1;
        _starLiveBtn.layer.borderColor = [UIColor yellowColor].CGColor;
        [_starLiveBtn addTarget:self action:@selector(actionStarLive) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _starLiveBtn;
}
@end
