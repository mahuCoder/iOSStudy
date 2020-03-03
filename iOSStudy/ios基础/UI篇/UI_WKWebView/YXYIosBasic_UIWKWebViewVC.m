//
//  YXYIosBasic_UIWKWebViewVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/10/25.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIWKWebViewVC.h"
#import <WebKit/WebKit.h>
#import "WeakScriptMessageDelegate.h"

@interface YXYIosBasic_UIWKWebViewVC ()<WKScriptMessageHandler>
{
    
}
@property (strong, nonatomic) WKWebView *wkWebView;

@end

@implementation YXYIosBasic_UIWKWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = @"http://yzsapp.yunhuyj.com/mjkBTest/mjkmall/index.html#/tabbar/index?org=369999&login_id=19999999995&token=HAf2bf7e253642f0343db6cd5129103cc3&time=1529028842&version=2.6.0";

    NSURL *url = [NSURL URLWithString:path];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    //webView的首选项设置
    WKPreferences *preferences = [[WKPreferences alloc] init];
    preferences.minimumFontSize = 10;//最小字体
    preferences.javaScriptEnabled = YES;//是否启用js，默认yes
    preferences.javaScriptCanOpenWindowsAutomatically = NO;//是否支持js window.open （ios默认NO，ox默认yes）
    config.preferences = preferences;
    WKUserContentController *userCC = [[WKUserContentController alloc] init];
    config.userContentController = userCC;
    self.wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    [self.view addSubview:self.wkWebView];
    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5.0];
    [self.wkWebView loadRequest:request];
    WeakScriptMessageDelegate *weakDelegate = [[WeakScriptMessageDelegate alloc] initWithDelegate:self];
    
    [userCC addScriptMessageHandler:weakDelegate name:@"imgBig"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"UploaderImg"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"inspectionSheet"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"recharges"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"weixinPay"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"shop_wxPay"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"shop_aliPay"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"returnHomePage"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"userPay"];
//    [userCC addScriptMessageHandler:weakDelegate name:@"mapNavigation"];
////    [self.wkWebView loadRequest:request];
//    [self.wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
//    [self.wkWebView addObserver:self forKeyPath:@"URL" options:NSKeyValueObservingOptionNew context:nil];
//    [self.wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
//    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, (_webViewPushType == UIWebViewPushTypeNavigatBarAnimation)?0:SafeAreaTopHeight, CGRectGetWidth(self.view.frame), progressHeight)];
//    progress.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:progress];
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(0, 0, 0, progressHeight);
//    layer.backgroundColor = RGB(30, 195, 143).CGColor;
//    [progress.layer addSublayer:layer];
//    self.progresslayer = layer;
    
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"111111232144");
}
- (void)dealloc {
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"imgBig"];
    NSLog(@"网页释放了");
}

@end
