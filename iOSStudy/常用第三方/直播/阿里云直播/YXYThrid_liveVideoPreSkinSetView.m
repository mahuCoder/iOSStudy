//
//  YXYThrid_liveVideoPreSkinSetView.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/2.
//  Copyright © 2019 yunhun. All rights reserved.
//





#import "YXYThrid_liveVideoPreSkinSetView.h"


@interface YXYThrid_liveVideoPreSkinSetViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, copy) void(^ sliderValueBlock)(float value);

@end
@implementation YXYThrid_liveVideoPreSkinSetViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.nameLabel = [[UILabel alloc] init];
        _nameLabel.font = FONT(14);
        _nameLabel.textColor = HEXCOLOR(0xffffff);
        [self.contentView addSubview:self.nameLabel];
        self.slider = [[UISlider alloc] init];
        _slider.tintColor = [UIColor whiteColor];
        _slider.thumbTintColor = HEXCOLOR(0x333333);
        [_slider setThumbImage:[UIImage imageNamed:@"attention"] forState:(UIControlStateNormal)];//可设置颜色
        [self.contentView addSubview:self.slider];
        [_slider addTarget:self action:@selector(actionSlider:) forControlEvents:(UIControlEventValueChanged)];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15);
            make.centerY.offset(0);
        }];
        [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).offset(10);
            make.right.offset(-15);
            make.height.equalTo(@44);
            make.centerY.offset(0);
        }];
    }
    return self;
}
- (void)actionSlider:(UISlider *)sender
{
    if (self.sliderValueBlock) {
        self.sliderValueBlock(sender.value);
    }
}
@end


static NSString *const kYXYThrid_liveVideoPreSkinSetCellID = @"kYXYThrid_liveVideoPreSkinSetCellID";
@interface YXYThrid_liveVideoPreSkinSetView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) UIButton *switchOn;
@property (nonatomic, strong) UIButton *defaulttBtn;


@end

@implementation YXYThrid_liveVideoPreSkinSetView

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = RGBA(0xff, 0xff, 0xff, 0.3);
        self.arrayData = @[@"美白",@"磨皮",@"红润",@"瘦脸",@"下巴",@"大眼"];
        [self configSubViews];
    }
    return self;
}
- (void)setPushConfig:(AlivcLivePushConfig *)pushConfig
{
    _pushConfig = pushConfig;
    self.switchOn.selected = pushConfig.beautyOn;
    if ([self.pushConfig isEqual:pushConfig]) {
        return;
    }
    //beautyOn 开启关闭美颜
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}
-(void)actionSwithOn:(UIButton *)sender
{
    sender.selected = !sender.selected;
     self.pushConfig.beautyOn = sender.selected;
    [self updateSkinWithEvent:YXYThrid_liveVideoPreViewEventlensUpdateSkin_on];
}
- (void)actionDefaultSet
{
    _pushConfig.beautyWhite = 70;
    _pushConfig.beautyBuffing = 40;
    _pushConfig.beautyRuddy = 40;
    _pushConfig.beautyCheekPink = 15;
    _pushConfig.beautyThinFace = 40;
    _pushConfig.beautyShortenFace  = 50;
    _pushConfig.beautyBigEye = 30;
    [self.collectionView reloadData];
    [self updateSkinWithEvent:(YXYThrid_liveVideoPreViewEventlensUpdateSkin_defalut)];
}
- (void)configSubViews
{
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(44);
        make.left.right.offset(0);
        make.bottom.offset(-Height_NOTabBar);
    }];
    [self addSubview:self.defaulttBtn];
    [self addSubview:self.switchOn];
    [self.defaulttBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(0);
        make.height.equalTo(@44);
    }];
    [self.switchOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(0);
        make.height.equalTo(@44);
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YXYThrid_liveVideoPreSkinSetViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kYXYThrid_liveVideoPreSkinSetCellID forIndexPath:indexPath];
    NSString *title = self.arrayData[indexPath.item];
    cell.nameLabel.text = title;
    __weak typeof(self) wSelf = self;
    if ([title isEqualToString:@"美白"]) {
        [self setCellSlideValueWithMinValue:0 maxValue:100 value:_pushConfig.beautyWhite cell:cell];
        cell.sliderValueBlock = ^(float value) {
            wSelf.pushConfig.beautyWhite = value;
            [wSelf updateSkinWithEvent:(YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyWhite)];
        };
    } else if ([title isEqualToString:@"磨皮"]) {
        [self setCellSlideValueWithMinValue:0 maxValue:100 value:_pushConfig.beautyBuffing cell:cell];
        cell.sliderValueBlock = ^(float value) {
            wSelf.pushConfig.beautyBuffing = value;
            [wSelf updateSkinWithEvent:(YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyBuffing)];
        };
    } else if ([title isEqualToString:@"红润"]) {
        [self setCellSlideValueWithMinValue:0 maxValue:100 value:_pushConfig.beautyRuddy cell:cell];
        cell.sliderValueBlock = ^(float value) {
            wSelf.pushConfig.beautyRuddy = value;
            [wSelf updateSkinWithEvent:(YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyRuddy)];
        };
    } else if ([title isEqualToString:@"瘦脸"]) {
        [self setCellSlideValueWithMinValue:0 maxValue:100 value:_pushConfig.beautyThinFace cell:cell];
        cell.sliderValueBlock = ^(float value) {
            wSelf.pushConfig.beautyThinFace = value;
            [wSelf updateSkinWithEvent:(YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyThinFace)];
        };
    } else if ([title isEqualToString:@"下巴"]) {
        [self setCellSlideValueWithMinValue:0 maxValue:100 value:_pushConfig.beautyShortenFace cell:cell];
        cell.sliderValueBlock = ^(float value) {
            wSelf.pushConfig.beautyShortenFace = value;
            [wSelf updateSkinWithEvent:(YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyShortenFace)];
        };
    } else if ([title isEqualToString:@"大眼"]) {
        [self setCellSlideValueWithMinValue:0 maxValue:100 value:_pushConfig.beautyBigEye cell:cell];
        cell.sliderValueBlock = ^(float value) {
            wSelf.pushConfig.beautyBigEye = value;
            [wSelf updateSkinWithEvent:(YXYThrid_liveVideoPreViewEventlensUpdateSkin_beautyBigEye)];
        };
    }

    /*  beautyWhite 美白 默认 : 70 范围 : [0,100]
     beautyBuffing 磨皮参数 默认 : 40 范围 : [0,100]
     beautyRuddy  红润 默认 : 40 范围 : [0,100]
     beautyCheekPink 腮红参数 默认 : 15 范围 : [0,100]
     beautyThinFace 瘦脸参数  默认 : 40 范围 : [0,100]
     beautyShortenFace  收下巴参数 默认 : 50 范围 : [0,100]
     beautyBigEye 大眼参数 默认 : 30 范围 : [0,100]
     */
    return cell;
}
- (void)updateSkinWithEvent:(YXYThrid_liveVideoPreViewEvent)event
{
    if (self.skinBlock) {
        self.skinBlock(event);
    }
}
- (void)setCellSlideValueWithMinValue:(CGFloat)minValue maxValue:(CGFloat)maxValue value:(CGFloat)value cell:(YXYThrid_liveVideoPreSkinSetViewCell *)cell
{
    cell.slider.minimumValue = minValue;
    cell.slider.maximumValue = maxValue;
    cell.slider.value = value;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(ScreenWidth/ 2.0, 44);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[YXYThrid_liveVideoPreSkinSetViewCell class] forCellWithReuseIdentifier:kYXYThrid_liveVideoPreSkinSetCellID];
    }
    return _collectionView;
}
- (UIButton *)defaulttBtn
{
    if (!_defaulttBtn) {
        _defaulttBtn = [[UIButton alloc] init];
        [_defaulttBtn setTitle:@"设为默认" forState:(UIControlStateNormal)];
        _defaulttBtn.titleLabel.font = FONT(16);
        [_defaulttBtn setTitleColor:HEXCOLOR(0xffffff) forState:(UIControlStateNormal)];
        [_defaulttBtn addTarget:self action:@selector(actionDefaultSet) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _defaulttBtn;
}
- (UIButton *)switchOn
{
    if (!_switchOn) {
        _switchOn = [[UIButton alloc] init];
        [_switchOn setTitle:@"打开美颜" forState:(UIControlStateNormal)];
        [_switchOn setTitle:@"关闭美颜" forState:(UIControlStateSelected)];
        _switchOn.titleLabel.font = FONT(16);
        [_switchOn setTitleColor:HEXCOLOR(0xffffff) forState:(UIControlStateNormal)];
        [_switchOn addTarget:self action:@selector(actionSwithOn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _switchOn;
}
@end
