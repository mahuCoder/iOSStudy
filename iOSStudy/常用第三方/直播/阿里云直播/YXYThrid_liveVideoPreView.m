//
//  YXYThrid_liveVideoPreView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/2.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYThrid_liveVideoPreView.h"
#import "YXYThrid_liveVideoPreSkinSetView.h"
@interface YXYThrid_liveVideoPreView ()
{
    
}
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextField *nameTextF;
@property (nonatomic, strong) UIButton *starLiveBtn;
@property (nonatomic, strong) UIButton *lensFlipBtn;//镜头翻转
@property (nonatomic, strong) UIButton *skinCareBtn;//美颜按钮
@property (nonatomic, strong) UIButton *microphoneBtn;//麦克风按钮
@property (nonatomic, strong) YXYThrid_liveVideoPreSkinSetView *skinView;//美颜


@end




@implementation YXYThrid_liveVideoPreView

- (instancetype)init
{
    if (self = [super init]) {
        [self configSubViews];
        UITapGestureRecognizer *tap_hidden = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHidden)];
        [self addGestureRecognizer:tap_hidden];
    }
    return self;
}
- (void)tapHidden
{
    if (!self.skinView.hidden) {
        __weak typeof(self) wSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            wSelf.skinView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            wSelf.skinView.hidden = YES;
        }];
    }
}
#pragma mark 开始直播
- (void)actionStarLive:(UIButton *)sender
{
    if (self.titleBlock) {
        self.titleBlock(@"直播主题");
    }
    if (self.eventBlock) {
        self.eventBlock(YXYThrid_liveVideoPreViewEventStarLive);
    }
}
- (void)setPushConfig:(AlivcLivePushConfig *)pushConfig
{
    _pushConfig = pushConfig;
}
#pragma mark 镜头翻转
- (void)actionLensFlip:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (self.eventBlock) {
        if (sender.selected) {
            self.eventBlock(YXYThrid_liveVideoPreViewEventlensFlipBack);
        } else {
            self.eventBlock(YXYThrid_liveVideoPreViewEventlensFlipFront);
        }
    }
}
- (void)actionSkinCare
{
    if (self.skinView.hidden) {
        self.skinView.hidden = NO;
        if (!self.skinView.superview) {
            [self addSubview:self.skinView];
            [self.skinView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.offset(0);
                make.top.equalTo(self.mas_bottom);
                make.height.mas_equalTo(200 + Height_SafeToTabBar);
            }];
        }
        self.skinView.pushConfig = self.pushConfig;
        [UIView animateWithDuration:0.5 animations:^{
            self.skinView.transform = CGAffineTransformMakeTranslation(0, -200 - Height_SafeToTabBar);
        }];
        __weak typeof(self) wSelf = self;
        self.skinView.skinBlock = ^(YXYThrid_liveVideoPreViewEvent event) {
            [wSelf updateSkinWithEvent:event];
        };
    }
}
- (void)updateSkinWithEvent:(YXYThrid_liveVideoPreViewEvent )event
{
    if (self.eventBlock) {
        self.eventBlock(event);
    }
}
- (void)actionMicrophone:(UIButton *)sender
{
    sender.selected = !sender.selected;
}
- (void)configSubViews
{
    [self addSubview:self.nameLabel];
    [self addSubview:self.nameTextF];
    [self addSubview:self.starLiveBtn];
    [self addSubview:self.lensFlipBtn];
    [self addSubview:self.microphoneBtn];
    [self addSubview:self.skinCareBtn];
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
    [self.skinCareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(Height_SafeStatusBar);
        make.right.offset(-70);
        make.size.mas_equalTo(CGSizeMake(38, 38));
    }];
    [self.lensFlipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.skinCareBtn);
        make.right.equalTo(self.skinCareBtn.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(38, 38));
    }];
    [self.microphoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.skinCareBtn);
        make.right.equalTo(self.lensFlipBtn.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(38, 38));
    }];
    
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
        [_starLiveBtn addTarget:self action:@selector(actionStarLive:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _starLiveBtn;
}
//lensFlipBtn;//镜头翻转
-(UIButton *)lensFlipBtn
{
    if (!_lensFlipBtn) {
        _lensFlipBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_lensFlipBtn setImage:[UIImage imageNamed:@"aliLive_lensFlip"] forState:(UIControlStateNormal)];
        [_lensFlipBtn addTarget:self action:@selector(actionLensFlip:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _lensFlipBtn;
}
//skinCareBtn;//美颜按钮
- (UIButton *)skinCareBtn
{
    if (!_skinCareBtn) {
        _skinCareBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_skinCareBtn setImage:[UIImage imageNamed:@"aliLive_skin"] forState:(UIControlStateNormal)];
        [_skinCareBtn addTarget:self action:@selector(actionSkinCare) forControlEvents:(UIControlEventTouchUpInside)];
//        [_skinCareBtn setImage:[UIImage imageNamed:@"aliLive_skin_unselect"] forState:(UIControlStateNormal)];
    }
    return _skinCareBtn;
}
//microphoneBtn;//麦克风按钮
- (UIButton *)microphoneBtn
{
    if (!_microphoneBtn) {
        _microphoneBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_microphoneBtn setImage:[UIImage imageNamed:@"aliLive_microphone"] forState:(UIControlStateSelected)];
        [_microphoneBtn setImage:[UIImage imageNamed:@"aliLive_microphone_unselect"] forState:(UIControlStateNormal)];
        _microphoneBtn.selected = YES;
        [_microphoneBtn addTarget:self action:@selector(actionMicrophone) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _microphoneBtn;
}
- (YXYThrid_liveVideoPreSkinSetView *)skinView
{
    if (!_skinView) {
        _skinView = [[YXYThrid_liveVideoPreSkinSetView alloc] init];
        _skinView.hidden = YES;
    }
    return _skinView;
}
@end
