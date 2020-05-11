//
//  MusicPlayerVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/8.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "MusicPlayerVC.h"
#import "MusicOperationTool.h"
#import "MusicMessageModel.h"
#import "CALayer+MUSAmi.h"
#import "LrcLabel.h"
#import "LrcDataTool.h"
#import "MUsicLrcViewController.h"

@interface MusicPlayerVC ()<UIScrollViewDelegate>
/* 播放设置按钮*/
@property (nonatomic, strong) UIButton *playerTypeBtn;
@property (nonatomic, strong) UIButton *playOrPauseBtn;
/*时间进度控件*/
@property (nonatomic, strong) UISlider *progressSlider;
@property (nonatomic, strong) UILabel *costTimeLabel;
@property (nonatomic, strong) UILabel *totalTimeLabel;
/** 其他控件*/
@property (nonatomic, strong) UIImageView *backImageView;//背景图片
@property (nonatomic, strong) UIImageView *foreImageView;//前景图片
/*歌词背景*/
@property (nonatomic, strong) UIScrollView *lrcBackScrollView;//gecic
@property (nonatomic, strong) LrcLabel *lrcLabel;//前景图片
@property (nonatomic, strong) MUsicLrcViewController *lrcTVC;

/*定时器*/
@property (nonatomic, weak) NSTimer *timer;
/** 歌词定时器*/
@property (nonatomic, weak) CADisplayLink *displayLink;
/** 进度条手势*/
@property (nonatomic, strong) UITapGestureRecognizer *tap;

@end

@implementation MusicPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBarTitle];
    /*t普通试图*/
    [self initView];
    
    /*进度试图*/
    [self setProgressView];
    [self updateUIOnce];
    
    [self addLrcView];

    
    [self addTimer];

    [self addDisplayLink];
   // 监听播放完毕后的通知
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nextMusic:) name:kPlayFinishNotificationName object:nil];
   
}
//- viewdidl
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self removeTimer];
}
- (void)dealloc{
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark --------------------------歌词处理--------------------------


#pragma mark --------------------------点击事件--------------------------

- (void)actionPlayOrPauseMusic:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [MusicOperationTool.shareInstance playCurrentMusic];
        [self resumeRotationAnimatioin];
    } else {
        [MusicOperationTool.shareInstance pauseCurrentMusic];
        [self pauseRotationAnimation];
    }
}
- (void)actionPreMusic:(UIButton *)sender
{
    if ([MusicOperationTool.shareInstance preMusic]) {
        [self updateUIOnce];
    }
}
- (void)actionNextMusic:(UIButton *)sender
{
    if ([MusicOperationTool.shareInstance nextMusic]) {
        [self updateUIOnce];
    }
}
- (void)nextMusic:(NSNotification *)sender
{
    [self actionNextMusic:nil];
}
- (CGFloat )getProgessWithMessageModel:(MusicMessageModel *)musicMessageModel
{
    // 获取最新数据
    return  musicMessageModel.costTime / (musicMessageModel.totalTime * 1.0);
}
/// 切换歌曲是更新UI
- (void)updateUIOnce
{
    // 获取最新数据
    MusicMessageModel *musicMessageModel = [[MusicOperationTool shareInstance] getNewMusicMessageModel];
       // 背景图片
    NSString *imageName = musicMessageModel.musicM.icon;
    self.backImageView.image = [UIImage imageNamed:imageName];
       // 前景图片
    self.foreImageView.image = [UIImage imageNamed:imageName];
    [self setNavBarTitle];
    // 进度恢复成0
    self.progressSlider.value = 0.0;
    // 播放时长是0
    self.costTimeLabel.text = @"00:00";
    // 总时长
    self.totalTimeLabel.text = musicMessageModel.totalTimeFormat;
    // 开启旋转动画
    [self addRotationAnimation];
       
    if (musicMessageModel.isPlaying) {
        [self resumeRotationAnimatioin];
    }else{
        [self pauseRotationAnimation];
    }
    // 获取歌词数据
     // 1.获取歌词数据源
     NSArray<LrcModel *> *lrcMs = [LrcDataTool getLrcData:musicMessageModel.musicM.lrcname];
     //    NSLog(@"%@", lrcMs);
     
     // 2.将数据源交给控制器来展示
     self.lrcTVC.datasource = lrcMs;
    
}
/// 实时更新UI
- (void)updateUIMore
{
    // 获取最新数据
    MusicMessageModel *musicMessageModel = [[MusicOperationTool shareInstance] getNewMusicMessageModel];
    self.costTimeLabel.text = musicMessageModel.costTimeFormat;
    self.progressSlider.value = [self getProgessWithMessageModel:musicMessageModel];
    
    // 播放或者暂停按钮 待定
    self.playOrPauseBtn.selected = musicMessageModel.isPlaying;
}
/** 添加歌词视图*/
- (void)addLrcView{
    
    // 歌词视图
    [self.lrcBackScrollView addSubview:self.lrcTVC.view];
    self.lrcTVC.view.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, self.view.frame.size.height);

    
    // 歌词的背景视图
    self.lrcBackScrollView.showsHorizontalScrollIndicator = NO;
    self.lrcBackScrollView.pagingEnabled = YES;
    self.lrcBackScrollView.delegate = self;
    
    // 歌词视图
//    [self.lrcTVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.top.bottom.offset(0);
//        make.left.equalTo(self.lrcBackScrollView.mas_right);
//    }];
     // 歌词背景视图
     self.lrcBackScrollView.contentSize = CGSizeMake(ScreenWidth * 2, 0);
}
/** 更新歌词*/
- (void)updateLrc{
    
    // 1.获取当前音乐的数据
    MusicMessageModel *musicMessageModel = [[MusicOperationTool shareInstance] getNewMusicMessageModel];
    
    // 1.获取歌词数据源
    NSArray<LrcModel *> *lrcMs = [LrcDataTool getLrcData:musicMessageModel.musicM.lrcname];

    // 2.获取当前歌词所在的行
    [LrcDataTool getRow:musicMessageModel.costTime andLrcs:lrcMs completion:^(NSInteger row, LrcModel *lrc) {

        // 3.把数据传递给歌词控制器管理
        self.lrcTVC.scrollRow = row;

        // 4.设置单行歌词
        self.lrcLabel.text = lrc.lrcStr;

        // 5.跟新歌词进度
        CGFloat progress = (musicMessageModel.costTime - lrc.beginTime) / (lrc.endTime - lrc.beginTime);
        self.lrcLabel.progress = progress;

        // 6.把歌词的播放进度传递给 歌词控制器
        self.lrcTVC.progress = progress;

    }];
    
    // 7.设置锁屏信息
    // 前台不更新, 进入后台之后才更新
    UIApplicationState state =  [UIApplication sharedApplication].applicationState;
//    if (state == UIApplicationStateBackground) {
//        [[QQMusicOperationTool shareInstance] setUpLockMessage];
//    }
}
#pragma mark 拖动进度
- (void)dragSliderProgess:(UISlider *)sender
{
    // 1.计算总时长
      NSTimeInterval totalTime = [[MusicOperationTool shareInstance] getNewMusicMessageModel].totalTime;
      // 2.当前时间
      NSTimeInterval currentTime = sender.value * totalTime;
    // 3.设置 已经播放时长
      self.costTimeLabel.text = [MusicMessageModel getFormatTime:currentTime];
    // 3.设置当前播放进度
       [[MusicOperationTool shareInstance] seekTo:currentTime];
}
#pragma mark --------------------------delegate&datasoure---------------


#pragma mark --------------------------初始化UI---------------------------
#pragma mark 设置UI
/// 设置标题
- (void)setNavBarTitle
{
    //设置标题栏两行
       /**头部标题*/
    MusicMessageModel *model = [MusicOperationTool.shareInstance  getNewMusicMessageModel];
    NSString *title = [model.musicM.name stringByAppendingFormat:@"\n%@", model.musicM.singer];
    NSMutableAttributedString *att_title = [[NSMutableAttributedString alloc] initWithString:title ?: @""];
    [att_title addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, title.length)];
    [att_title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:13] range:NSMakeRange(0, title.length)];
    UILabel *navTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth * 0.4, 44)];
    navTitleLabel.numberOfLines=0;//可能出现多行的标题
    [navTitleLabel sizeToFit];
    [navTitleLabel setAttributedText:att_title];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    navTitleLabel.backgroundColor = [UIColor clearColor];
    navTitleLabel.userInteractionEnabled = YES;
    navTitleLabel.lineBreakMode = NSLineBreakByClipping;
    self.navigationItem.titleView = navTitleLabel;
}
- (void)initView
{
    //背景UI
    [self.view addSubview:self.backImageView];
    //蒙版
    UIToolbar *maskView = [[UIToolbar alloc] init];
    maskView.barStyle = UIBarStyleBlack;
    [self.view addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.view addSubview:self.foreImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self.foreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ScreenWidth * 0.8);
        make.height.equalTo(self.foreImageView.mas_width);
        make.centerX.offset(0);
        make.centerY.offset(-50);
    }];
    //播放UI
    [self.view addSubview:self.playOrPauseBtn];
    UIButton *preButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [preButton setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:(UIControlStateNormal)];
    [preButton addTarget:self action:@selector(actionPreMusic:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:preButton];
    UIButton *nextButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [nextButton setImage:[UIImage imageNamed:@"player_btn_next_normal"] forState:(UIControlStateNormal)];
    [nextButton addTarget:self action:@selector(actionNextMusic:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:nextButton];
    [self.playOrPauseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-Height_SafeToTabBar -  44);
        make.centerX.offset(0);
        make.height.equalTo(@64);
    }];
    [preButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.playOrPauseBtn);
        make.centerX.offset(-ScreenWidth*0.25);
    }];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.playOrPauseBtn);
        make.centerX.offset(ScreenWidth*0.25);
    }];
   self.playOrPauseBtn.selected = [MusicOperationTool.shareInstance isPlaying];
    
    
    
}

/** 处理透明度*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat alpha = 1 - 1.0 * scrollView.contentOffset.x / self.lrcBackScrollView.frame.size.width;
    
    self.foreImageView.alpha = alpha;
    self.lrcLabel.alpha = alpha;
}
- (void)setProgressView
{
    [self.view addSubview:self.costTimeLabel];
    [self.view addSubview:self.totalTimeLabel];
    [self.view addSubview:self.progressSlider];
    [self.progressSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.equalTo(self.playOrPauseBtn.mas_top);
        make.left.offset(64);
    }];
    [self.costTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressSlider);
        make.right.equalTo(self.progressSlider.mas_left).offset(-5);
    }];
    [self.totalTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressSlider);
        make.left.equalTo(self.progressSlider.mas_right).offset(5);
    }];
    [self.view addSubview:self.lrcBackScrollView];
    self.lrcBackScrollView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//    [self.lrcBackScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsZero);
//    }];
    [self.view addSubview:self.lrcLabel];
    [self.lrcLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.progressSlider.mas_top).offset(-15);
        make.centerX.offset(0);
    }];
}
/*添加动画*/
- (void)addRotationAnimation
{
    // 1.移除之前的动画
      NSString *key = @"rotation";
      [self.foreImageView.layer removeAnimationForKey:key];
    
    // 2.重新添加动画
       CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
       animation.fromValue = 0;
       animation.toValue = @(M_PI * 2);
       animation.duration = 30;
       animation.repeatCount = MAXFLOAT;
       
       // 设置播放完成之后不移除
       animation.removedOnCompletion = NO;
       
       // 添加动画
       [self.foreImageView.layer addAnimation:animation forKey:key];
}
/** 暂停旋转动画*/
- (void)pauseRotationAnimation{
    
    [self.foreImageView.layer pauseAnimate];
}

/** 恢复旋转动画*/
- (void)resumeRotationAnimatioin{
    
    [self.foreImageView.layer resumeAnimate];
}
/*添加进度定时器*/
- (void)addTimer
{
    if (_timer == nil) {
           
           NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateUIMore) userInfo:nil repeats:YES];
           self.timer = timer;
           // 添加到 runloop
           [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
       }
}
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
/** 定时更新 歌词面板信息*/
- (void)addDisplayLink{
    
    if (!_displayLink) {
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateLrc)];
        self.displayLink = displayLink;
        // 添加到 runloop
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}
/** 移除 歌词面板信息 定时器*/
- (void)removeDisplayLind{
    
    [self.displayLink invalidate];
    self.displayLink = nil;
}
#pragma mark --------------------------懒加载-----------------------------
/* 播放设置按钮*/
//@property (nonatomic, strong) UIButton *playerTypeBtn;
//@property (nonatomic, strong) UIButton *playOrPauseBtn;
- (UIButton *)playOrPauseBtn
{
    if (!_playerTypeBtn) {
        _playerTypeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_playerTypeBtn setImage:[UIImage imageNamed:@"player_btn_play_normal"] forState:(UIControlStateNormal)];
        [_playerTypeBtn setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:(UIControlStateSelected)];
        [_playerTypeBtn addTarget:self action:@selector(actionPlayOrPauseMusic:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _playerTypeBtn;
}
/*时间进度控件*/
- (UISlider *)progressSlider
{
    if (!_progressSlider) {
        _progressSlider = [[UISlider alloc] init];
        [_progressSlider addTarget:self action:@selector(dragSliderProgess:) forControlEvents:(UIControlEventValueChanged)];
    }
    return _progressSlider;
}
- (UILabel *)costTimeLabel
{
    if (!_costTimeLabel) {
        _costTimeLabel = [[UILabel alloc] init];
        _costTimeLabel.textColor = HEXCOLOR(0x999999);
        _costTimeLabel.font = FONT(13);
    }
    return _costTimeLabel;
}
- (UILabel *)totalTimeLabel
{
    if (!_totalTimeLabel) {
        _totalTimeLabel = [[UILabel alloc] init];
        _totalTimeLabel.textColor = HEXCOLOR(0x999999);
        _totalTimeLabel.font = FONT(13);
//        _totalTimeLabel
    }
    return _totalTimeLabel;
}
/** 其他控件*/
//@property (nonatomic, strong) UIImageView *backImageView;//背景图片
//@property (nonatomic, strong) UIImageView *foreImageView;//前景图片
- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
    }
    return _backImageView;
}
- (UIImageView *)foreImageView
{
    if (!_foreImageView) {
        _foreImageView = [[UIImageView alloc] init];
        _foreImageView.layer.cornerRadius = ScreenWidth *0.4;
        _foreImageView.layer.masksToBounds = YES;
    }
    return _foreImageView;
}
- (UIScrollView *)lrcBackScrollView
{
    if (!_lrcBackScrollView) {
        _lrcBackScrollView = [[UIScrollView alloc] init];
        _lrcBackScrollView.delegate = self;
//        _lrcBackScrollView.backgroundColor = [UIColor clearColor];
    }
    return _lrcBackScrollView;
}
- (LrcLabel *)lrcLabel
{
    if (!_lrcLabel) {
        _lrcLabel = [[LrcLabel alloc] init];
        _lrcLabel.font = FONT(14);
        _lrcLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _lrcLabel;
}
/** 歌词控制器*/
- (MUsicLrcViewController *)lrcTVC{
    if (_lrcTVC == nil) {
        _lrcTVC = [[MUsicLrcViewController alloc] init];
        [self addChildViewController:_lrcTVC];
    }
    return _lrcTVC;
}
@end
